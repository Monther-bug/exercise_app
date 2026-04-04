import 'package:exercise_app/feature/Auth/domain/entities/user_entity.dart';
import 'package:exercise_app/feature/Auth/domain/repository/auth_repository.dart';


class LoginUsecase {
  final AuthRepository repository;
  LoginUsecase(this.repository);

  Future <UserEntity?> call (String email, String password) async{
    return await repository.loginUser(email, password);
  }
}