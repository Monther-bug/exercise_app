import 'package:exercise_app/core/di/injection_container.dart';
import 'package:exercise_app/feature/Auth/domain/repository/auth_repository.dart';


class LogoutUsecase {
  final repository = locator<AuthRepository>();  
  Future <void> call () async{
     await repository.logout();
  }
}