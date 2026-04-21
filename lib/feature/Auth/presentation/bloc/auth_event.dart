part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthCheck extends AuthEvent{}

final class LoginSubmitted extends AuthEvent{
  final LoginRequest request;
  LoginSubmitted({
    required this.request
  });
}

final class SignUpSubmitted extends AuthEvent{
  final SignUpRequest request;
  SignUpSubmitted({    
    required this.request
  });
}

final class LogoutRequested extends AuthEvent{}

class AppStarted extends AuthEvent {}

class OnboardingFinished extends AuthEvent {}

class GoogleSignInRequested extends AuthEvent{}



