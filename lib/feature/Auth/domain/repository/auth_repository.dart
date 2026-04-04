
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future <User?> signUpUser(String name, String email, String password);
  Future <User?> loginUser(String email, String password);
  User? getCurrentUSer();
  Future <void> logout();
  
}