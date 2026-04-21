import 'package:exercise_app/core/di/injection_container.dart';
import 'package:exercise_app/feature/Auth/domain/entities/user_entity.dart';
import 'package:exercise_app/feature/Auth/domain/repository/auth_repository.dart';

class GoogleSignInUsecase {
  final repository = locator<AuthRepository>();
  
  Future<UserEntity?> call() async {
    return await repository.signInWithGoogle();
  }
}