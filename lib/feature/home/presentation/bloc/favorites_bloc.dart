

import 'package:exercise_app/core/di/injection_container.dart';
import 'package:exercise_app/feature/home/data/model/exercise_local_model.dart';
import 'package:exercise_app/feature/home/domain/enitites/exercise_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitial()) {
    on<ToggleFavorites>((event, emit) async{       
      final box = locator<Box<ExerciseLocalModel>>();
     
      if(box.containsKey (event.exercise.name)){
        await box.delete(event.exercise.name);
      }
      else {
        final local = ExerciseLocalModel.fromEntity(event.exercise);
        await box.put(
          event.exercise.name, 
          local);        
      }
      final updatedList = box.values
      .map((model) => model.toEntity())
      .toList();
     
  
  // Then emit the real state
      emit(FavoritesLoaded(exercise: updatedList));
    });

    on<LoadFavorites>((event, emit) async {
      emit(FavoritesLoading());
      try{
      final box = locator<Box<ExerciseLocalModel>>();
      final favs =  box.values.map((m) => m.toEntity()).toList();
      emit(FavoritesLoaded(exercise: favs));
      } catch(e){
        emit(Favoritesfailed(message: e.toString()));
      }
      
    });
  }
}
