import 'package:exercise_app/core/di/injection_container.dart';
import 'package:exercise_app/core/services/local_storage_service.dart';
import 'package:exercise_app/feature/Auth/data/mapper/user_mapper.dart';
import 'package:exercise_app/feature/Auth/data/models/request/login_request.dart';
import 'package:exercise_app/feature/Auth/data/models/request/sign_up_request.dart';
import 'package:exercise_app/feature/Auth/data/sources/auth_remote_data_source.dart';
import 'package:exercise_app/feature/Auth/domain/entities/user_entity.dart';
import 'package:exercise_app/feature/Auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthRepositoryImp extends AuthRepository{
 final  remoteDataSource = locator<AuthRemoteDataSource>();
 final storageService = locator<LocalStorageService>();

  
 
  @override
  Future<UserEntity?> signInWithGoogle() async{
    final UserCredential? credential = await remoteDataSource.signInWithGoogle();
    final firebaseUser = credential?.user;
    if(firebaseUser == null){return null;}
    final userModel = UserMapper.fromFirebase(firebaseUser);
    return userModel.toEntity();
    //return googleUser;
  }
  @override 
  Future <UserEntity?> signUpUser(SignUpRequest request) async{
    final firebaseUser = await remoteDataSource.singnUp(
      request.name,
      request.email,
      request.password
    );
    // if(firebaseUser != null){
    //   final token = await firebaseUser.getIdToken();
    //   if(token != null){
    //    await storageService.saveToken(token);
    //   }
    // }
    if(firebaseUser == null){return null;}
    final userModel = UserMapper.fromFirebase(firebaseUser);
    return userModel.toEntity();
  }
  
  @override 
  Future <UserEntity?> loginUser(LoginRequest request) async{
    final firebaseUser = await remoteDataSource.login(
      request.email, 
      request.password);
    // if(firebaseUser != null){
    //   final token = await firebaseUser.getIdToken();
    //   if(token != null){
    //    await storageService.saveToken(token);
    //   }
    // }
    if(firebaseUser == null){return null;}
    final userModel = UserMapper.fromFirebase(firebaseUser);
    return userModel.toEntity();
    
    
  }  

  @override
  UserEntity? getCurrentUSer() {
    final firebaseUser = remoteDataSource.getCurrentUSer();
    if(firebaseUser == null){return null;}
    final userModel = UserMapper.fromFirebase(firebaseUser);
    return userModel.toEntity();
  }

  @override 
  Future <void> logout() async{
    await remoteDataSource.logout();
    //await storageService.clear();
  }
}