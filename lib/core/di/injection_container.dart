import 'package:dio/dio.dart';
import 'package:exercise_app/core/network/api_client.dart';
import 'package:exercise_app/core/services/local_storage_service.dart';
import 'package:exercise_app/core/services/shared_preferences_service.dart';
import 'package:exercise_app/feature/Auth/data/repository/auth_repository_imp.dart';
import 'package:exercise_app/feature/Auth/data/sources/auth_remote_data_source.dart';
import 'package:exercise_app/feature/Auth/domain/repository/auth_repository.dart';
import 'package:exercise_app/feature/Auth/domain/usecases/login_usecase.dart';
import 'package:exercise_app/feature/Auth/domain/usecases/sign_up_usecase.dart';
import 'package:exercise_app/feature/Auth/presentation/bloc/auth_bloc.dart';
import 'package:exercise_app/feature/home/data/repositories/exercise_repository.dart';
import 'package:exercise_app/feature/home/domain/repositories/exercise_repo.dart';
import 'package:exercise_app/feature/home/presentation/bloc/exercise_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> init() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  locator.registerLazySingleton<LocalStorageService>(() => SharedPreferencesService(sharedPrefs));
  locator.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSource());
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImp(
      locator<AuthRemoteDataSource>(),
      locator<LocalStorageService>()),
  );
  locator.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(locator<AuthRepository>()),
  );
  locator.registerLazySingleton<SignUpUsecase>(
    () => SignUpUsecase(locator<AuthRepository>()),
  );

  locator.registerFactory<AuthBloc>(
    () => AuthBloc(
      locator<AuthRepository>(),
      locator<LoginUsecase>(),
      locator<SignUpUsecase>(),
      locator<LocalStorageService>(),
    ),
  );

  locator.registerLazySingleton<Dio>(() => Dio());
  locator.registerLazySingleton<ApiClient>(() => ApiClient());
  locator<ApiClient>().getDio();
  locator.registerLazySingleton<ExerciseRepository>(
    () => ExerciseRepositoryImp(locator<ApiClient>()),
  );
  locator.registerFactory<ExerciseBloc>(
    () => ExerciseBloc(locator<ExerciseRepository>())
  );
}
