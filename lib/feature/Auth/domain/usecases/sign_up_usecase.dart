import 'package:exercise_app/feature/Auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpUsecase {
  final AuthRepository repository;
  SignUpUsecase(this.repository);

  Future <User?> call (String name, String email, String password) async{
    return await repository.signUpUser(name,email, password);
  }
}