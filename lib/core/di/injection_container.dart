import 'package:dio/dio.dart';
import 'package:exercise_app/core/network/api_client.dart';
import 'package:exercise_app/core/services/local_storage_service.dart';
import 'package:exercise_app/core/services/shared_preferences_service.dart';
import 'package:exercise_app/feature/Auth/data/repository/auth_repository_imp.dart';
import 'package:exercise_app/feature/Auth/data/sources/auth_remote_data_source.dart';
import 'package:exercise_app/feature/Auth/domain/repository/auth_repository.dart';
import 'package:exercise_app/feature/Auth/domain/usecases/get_user.dart';
import 'package:exercise_app/feature/Auth/domain/usecases/google_sign_in_usecase.dart';
import 'package:exercise_app/feature/Auth/domain/usecases/login_usecase.dart';
import 'package:exercise_app/feature/Auth/domain/usecases/sign_up_usecase.dart';
import 'package:exercise_app/feature/home/data/repositories/exercise_repository.dart';
import 'package:exercise_app/feature/home/data/repositories/favorites_repository_imp.dart';
import 'package:exercise_app/feature/home/domain/repositories/exercise_repo.dart';
import 'package:exercise_app/feature/home/bloc/exercise_bloc.dart';
import 'package:exercise_app/feature/home/bloc/search_bloc.dart';
import 'package:exercise_app/feature/onboarding/bloc/on_boarding_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exercise_app/feature/home/domain/repositories/favorites_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../feature/Auth/domain/usecases/logout_usecase.dart';

final locator = GetIt.instance;
bool _isInitialized = false;

Future<void> init() async {
  if (_isInitialized) return;

  
  final sharedPrefs = await SharedPreferences.getInstance();
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  locator.registerLazySingleton<FirebaseFirestore>(() =>  FirebaseFirestore.instance);
  locator.registerLazySingleton<LocalStorageService>(() => SharedPreferencesService(sharedPrefs));
  locator.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSource());
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImp(
     
     ),
  );
  locator.registerLazySingleton<FavoritesRepository>(() => FavoritesRepositoryImp());

  locator.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(),
  );
  locator.registerLazySingleton<SignUpUsecase>(
    () => SignUpUsecase(),
  );
  locator.registerLazySingleton<GoogleSignInUsecase>(
    () => GoogleSignInUsecase(),
  );
  locator.registerLazySingleton<LogoutUsecase>(
    () => LogoutUsecase(),
  );
  locator.registerLazySingleton<GetCurrentUSerUSeCase>(
    () => GetCurrentUSerUSeCase(),
  );

 
  

  // if (!locator.isRegistered<AuthBloc>()) {
  //   locator.registerLazySingleton<AuthBloc>(() => AuthBloc());
  // }

  locator.registerLazySingleton<Dio>(() => Dio());

  locator.registerLazySingleton<ApiClient>(() => ApiClient());  
  
  locator.registerLazySingleton<ExerciseRepository>(
    () => ExerciseRepositoryImp(),
  );
  locator.registerFactory<ExerciseBloc>(
    () => ExerciseBloc()
  );
  locator.registerFactory<SearchBloc>(
    () => SearchBloc()
  );
  locator.registerFactory<OnBoardingBloc>(
    () => OnBoardingBloc()
  );

 

  _isInitialized = true;
}