part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthCheck extends AuthEvent{}

final class LoginSubmitted extends AuthEvent{
  final String email;
  final String password;
  LoginSubmitted({
    required this.email,
    required this.password
  });
}

final class SignUpSubmitted extends AuthEvent{
  final String name;
  final String email;
  final String password;
  SignUpSubmitted({
    required this.name,
    required this.email,
    required this.password
  });
}

final class LogoutRequested extends AuthEvent{}

class AppStarted extends AuthEvent {}

class OnboardingFinished extends AuthEvent {}

class GoogleSignInRequested extends AuthEvent{}



