import 'package:exercise_app/feature/Auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseUserMapper on User {
  UserEntity toEntity() {
    return UserEntity(
      id: uid,
      email: email ?? '',
      displayName: displayName,     
    );
  }
}