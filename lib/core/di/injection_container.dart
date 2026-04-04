import 'package:exercise_app/core/services/local_storage_service.dart';
import 'package:exercise_app/core/services/shared_preferences_service.dart';
import 'package:exercise_app/feature/Auth/data/repository/auth_repository_imp.dart';
import 'package:exercise_app/feature/Auth/data/sources/auth_remote_data_source.dart';
import 'package:exercise_app/feature/Auth/domain/repository/auth_repository.dart';
import 'package:exercise_app/feature/Auth/domain/usecases/login_usecase.dart';
import 'package:exercise_app/feature/Auth/domain/usecases/sign_up_usecase.dart';
import 'package:exercise_app/feature/Auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final locater = GetIt.instance;

Future<void> init() async {
  locater.registerLazySingleton<LocalStorageService>(() => SharedPreferencesService());
  locater.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSource());
  locater.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImp(locater<AuthRemoteDataSource>()),
  );
  locater.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(locater<AuthRepository>()),
  );
  locater.registerLazySingleton<SignUpUsecase>(
    () => SignUpUsecase(locater<AuthRepository>()),
  );

  locater.registerFactory<AuthBloc>(
    () => AuthBloc(
      locater<AuthRepository>(),
      locater<LoginUsecase>(),
      locater<SignUpUsecase>(),
      locater<LocalStorageService>(),
    ),
  );
}
