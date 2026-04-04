import 'package:exercise_app/feature/Auth/data/sources/auth_remote_data_source.dart';
import 'package:exercise_app/feature/Auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImp implements AuthRepository{
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImp(this.remoteDataSource);

  @override 
  Future <User?> signUpUser(String name, String email, String password) async{
    return await remoteDataSource.singnUp(name, email, password);
  }
  
  @override 
  Future <User?> loginUser(String email, String password) async{
    return await remoteDataSource.login(email, password);
  }  

  @override
  User? getCurrentUSer() {
    return remoteDataSource.getCurrentUSer();
  }

  @override 
  Future <void> logout() async{
    await remoteDataSource.logout();
  }
}