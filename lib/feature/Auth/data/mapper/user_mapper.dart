import 'package:exercise_app/feature/Auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserMapper {
  static UserModel fromFirebase(User user){
    return UserModel(
      id: user.uid, 
      email: user.email,
      name: user.displayName);
  }
}