import 'package:exercise_app/core/services/local_storage_service.dart';
import 'package:exercise_app/core/services/shared_preferences_service.dart';
import 'package:get_it/get_it.dart';

final locater = GetIt.instance;

Future <void> init() async{
  locater.registerLazySingleton<LocalStorageService>(() => SharedPreferencesService());
}