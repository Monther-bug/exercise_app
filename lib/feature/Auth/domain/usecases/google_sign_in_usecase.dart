import 'package:exercise_app/feature/Auth/domain/entities/user_entity.dart';
import 'package:exercise_app/feature/Auth/domain/repository/auth_repository.dart';

class GoogleSignInUsecase {
  final AuthRepository repository;

  GoogleSignInUsecase(this.repository);

  Future<UserEntity?> call() async {
    return await repository.signInWithGoogle();
  }
}