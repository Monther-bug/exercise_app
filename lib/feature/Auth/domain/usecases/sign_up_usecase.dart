import 'package:exercise_app/core/di/injection_container.dart';
import 'package:exercise_app/feature/Auth/data/models/request/sign_up_request.dart';
import 'package:exercise_app/feature/Auth/domain/entities/user_entity.dart';
import 'package:exercise_app/feature/Auth/domain/repository/auth_repository.dart';


class SignUpUsecase {
 final repository = locator<AuthRepository>();
  

  Future <UserEntity?> call (SignUpRequest request) async{
    return await repository.signUpUser(request);
  }
}