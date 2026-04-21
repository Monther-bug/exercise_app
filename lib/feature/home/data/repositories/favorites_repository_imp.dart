

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exercise_app/core/di/injection_container.dart';
import 'package:exercise_app/feature/home/domain/enitites/exercise_entity.dart';
import 'package:exercise_app/feature/home/domain/repositories/favorites_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritesRepositoryImp extends FavoritesRepository{
  final firestore = locator<FirebaseFirestore>();
  final firebaseAuth = locator<FirebaseAuth>();

  @override 
  Future<void> toggleFavorites(ExerciseEntity exercise) async{
    final userId = firebaseAuth.currentUser!.uid;

    final docRef = firestore
        .collection('favorites')
        .doc(userId)
        .collection('exercises')
        .doc(exercise.name);
    
    final doc = await docRef.get();
    if(doc.exists){
      docRef.delete();
    }else{
      await docRef.set({
        'name': exercise.name,
        'type': exercise.type,
        'muscle': exercise.muscle,
        'difficulty': exercise.difficulty,
        'instructions': exercise.instructions,
        'equipments': exercise.equipments,
        'safety_info': exercise.safetyInfo,
      });
    }
  }

  @override
  Future<List<ExerciseEntity>> getFavorites()async{
    final userId = firebaseAuth.currentUser!.uid;

    final snapShot = await firestore.
      collection('favorites').
      doc(userId).
      collection('exercises').get();

    return snapShot.docs.map((doc) {
      final data = doc.data();
      return ExerciseEntity(
        name: data['name'],
        type: data['type'],
        muscle: data['muscle'],
        difficulty: data['difficulty'],
        instructions: data['instructions'],
        equipments: List<String>.from(data['equipments'] ?? []),
        safetyInfo: data['safety_info'],);
    }).toList();

  }
}