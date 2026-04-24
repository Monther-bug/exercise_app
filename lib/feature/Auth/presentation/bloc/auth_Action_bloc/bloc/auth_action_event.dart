part of 'auth_action_bloc.dart';

@immutable
sealed class AuthActionEvent {}

final class LoginSubmitted extends AuthActionEvent{
  final LoginRequest request;
  LoginSubmitted({
    required this.request
  });
}

final class SignUpSubmitted extends AuthActionEvent{
  final SignUpRequest request;
  SignUpSubmitted({    
    required this.request
  });
}


class GoogleSignInRequested extends AuthActionEvent{}

