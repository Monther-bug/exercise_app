import 'package:exercise_app/core/services/local_storage_service.dart';
import 'package:exercise_app/feature/Auth/data/models/user_model.dart';
import 'package:exercise_app/feature/Auth/data/sources/auth_remote_data_source.dart';
import 'package:exercise_app/feature/Auth/domain/entities/user_entity.dart';
import 'package:exercise_app/feature/Auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthRepositoryImp implements AuthRepository{
  final AuthRemoteDataSource remoteDataSource;
  final LocalStorageService storageService;
  AuthRepositoryImp(
    this.remoteDataSource,
    this.storageService);

  @override
  Future<UserEntity?> signInWithGoogle() async{
    final UserCredential? credential = await remoteDataSource.signInWithGoogle();
    final firebaseUser = credential?.user;
    return firebaseUser?.toEntity();
    //return googleUser;
  }
  @override 
  Future <UserEntity?> signUpUser(String name, String email, String password) async{
    final firebaseUser = await remoteDataSource.singnUp(name, email, password);
    // if(firebaseUser != null){
    //   final token = await firebaseUser.getIdToken();
    //   if(token != null){
    //    await storageService.saveToken(token);
    //   }
    // }
    return firebaseUser?.toEntity();
  }
  
  @override 
  Future <UserEntity?> loginUser(String email, String password) async{
    final firebaseUser = await remoteDataSource.login(email, password);
    // if(firebaseUser != null){
    //   final token = await firebaseUser.getIdToken();
    //   if(token != null){
    //    await storageService.saveToken(token);
    //   }
    // }
    
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
    //await storageService.clear();
  }
}