
import 'package:exercise_app/feature/Auth/data/models/request/login_request.dart';
import 'package:exercise_app/feature/Auth/data/models/request/sign_up_request.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future <UserEntity?> signUpUser(SignUpRequest request);
  Future <UserEntity?> loginUser(LoginRequest request);
  Future<UserEntity?> signInWithGoogle();
  UserEntity? getCurrentUSer();
  Future <void> logout();
  
}