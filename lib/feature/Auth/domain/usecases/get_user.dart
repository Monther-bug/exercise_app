import 'package:exercise_app/core/di/injection_container.dart';
import 'package:exercise_app/feature/Auth/domain/repository/auth_repository.dart';

import '../entities/user_entity.dart';


class GetCurrentUSerUSeCase {
  
  UserEntity? call () {
      return locator<AuthRepository>().getCurrentUSer();
  }
}
