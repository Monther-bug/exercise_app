import 'package:shared_preferences/shared_preferences.dart';
import 'local_storage_service.dart';
 

class SharedPreferencesService implements LocalStorageService{
  static const String _key = 'hasSeenOnboarding';

  @override
  Future<bool> hasSeenOnboarding() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key)?? false;
  }

  @override
  Future<void> markOnboardingComplete() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, true);
  }

  @override
  Future<void> resetOnboarding() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}