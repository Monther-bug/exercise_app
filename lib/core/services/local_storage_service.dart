

abstract class LocalStorageService{
  Future<bool> hasSeenOnboarding();
  Future<void> markOnboardingComplete();
  Future<void> resetOnboarding();  
  Future<void> saveToken(String token); // The contract
  String? getToken();
  Future<void> clear();
}