import 'package:exercise_app/feature/Auth/domain/entities/user_entity.dart';
import 'package:exercise_app/feature/Auth/domain/repository/auth_repository.dart';


class SignUpUsecase {
  final AuthRepository repository;
  SignUpUsecase(this.repository);

  Future <UserEntity?> call (String name, String email, String password) async{
    return await repository.signUpUser(name,email, password);
  }
}