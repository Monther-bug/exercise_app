import 'package:shared_preferences/shared_preferences.dart';
import 'local_storage_service.dart';
 

class SharedPreferencesService implements LocalStorageService{
  static const String _key = 'hasSeenOnboarding';
  
  final SharedPreferences prefs;
  SharedPreferencesService(this.prefs);

  @override
  Future<bool> hasSeenOnboarding() async{
    
    return prefs.getBool(_key)?? false;
  }

  @override
  Future<void> markOnboardingComplete() async{  
    await prefs.setBool(_key, true);
  }

  @override
  Future<void> resetOnboarding() async{  
    await prefs.remove(_key);
  }
  // @override
  // Future<void> saveToken(String token) async {    
  //   await prefs.setString('auth_token', token);
  // }

  // @override
  // String? getToken() {
  //   return prefs.getString('auth_token');
  // }

  // @override
  // Future<void> clear() async {
  //   await prefs.remove('auth_token');
  // }
}