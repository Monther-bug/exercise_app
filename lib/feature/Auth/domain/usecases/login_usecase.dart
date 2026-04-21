import 'package:exercise_app/core/di/injection_container.dart';
import 'package:exercise_app/feature/Auth/data/models/request/login_request.dart';
import 'package:exercise_app/feature/Auth/domain/entities/user_entity.dart';
import 'package:exercise_app/feature/Auth/domain/repository/auth_repository.dart';


class LoginUsecase {
  final repository = locator<AuthRepository>();
  

  Future <UserEntity?> call (LoginRequest request) async{
    return await repository.loginUser(request);
  }
}