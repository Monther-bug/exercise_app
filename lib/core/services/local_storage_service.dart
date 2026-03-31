

abstract class LocalStorageService{
  Future<bool> hasSeenOnboarding();
  Future<void> markOnboardingComplete();
  Future<void> resetOnboarding();  
}