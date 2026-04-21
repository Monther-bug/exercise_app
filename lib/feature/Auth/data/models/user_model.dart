import 'package:exercise_app/feature/Auth/domain/entities/user_entity.dart';


class UserModel {
  final String id;
  final String? name;
  final String? email;

  UserModel({    
    required this.id,
    required this.name,
    required this.email
  });

   UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      displayName: name,
    );
  }
}

