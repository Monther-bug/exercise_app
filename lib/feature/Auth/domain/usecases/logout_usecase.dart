import 'package:exercise_app/feature/Auth/domain/repository/auth_repository.dart';


class LogoutUsecase {
  final AuthRepository repository;
  LogoutUsecase(this.repository);

  Future <void> call () async{
     await repository.logout();
  }
}