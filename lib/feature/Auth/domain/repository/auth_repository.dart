
import 'package:exercise_app/feature/Auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future <UserEntity?> signUpUser(String name, String email, String password);
  Future <UserEntity?> loginUser(String email, String password);
  Future<UserEntity?> signInWithGoogle();
  UserEntity? getCurrentUSer();
  Future <void> logout();
  
}