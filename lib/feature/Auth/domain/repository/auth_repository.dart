
import 'package:exercise_app/feature/Auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future <UserEntity?> signUpUser(String name, String email, String password);
  Future <UserEntity?> loginUser(String email, String password);
  UserEntity? getCurrentUSer();
  Future <void> logout();
  
}