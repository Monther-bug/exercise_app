import 'package:exercise_app/feature/Auth/data/models/user_model.dart';
import 'package:exercise_app/feature/Auth/data/sources/auth_remote_data_source.dart';
import 'package:exercise_app/feature/Auth/domain/entities/user_entity.dart';
import 'package:exercise_app/feature/Auth/domain/repository/auth_repository.dart';


class AuthRepositoryImp implements AuthRepository{
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImp(this.remoteDataSource);

  @override 
  Future <UserEntity?> signUpUser(String name, String email, String password) async{
    final firebaseUser = await remoteDataSource.singnUp(name, email, password);
    return firebaseUser?.toEntity();
  }
  
  @override 
  Future <UserEntity?> loginUser(String email, String password) async{
    final firebaseUser = await remoteDataSource.login(email, password);
    return firebaseUser?.toEntity();
  }  

  @override
  UserEntity? getCurrentUSer() {
    final firebaseUser = remoteDataSource.getCurrentUSer();
    return firebaseUser?.toEntity();
  }

  @override 
  Future <void> logout() async{
    await remoteDataSource.logout();
  }
}