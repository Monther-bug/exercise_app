import 'package:exercise_app/feature/Auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginUsecase {
  final AuthRepository repository;
  LoginUsecase(this.repository);

  Future <User?> call (String email, String password) async{
    return await repository.loginUser(email, password);
  }
}