part of 'auth_action_bloc.dart';

@immutable
sealed class AuthActionState {}

final class AuthActionInitial extends AuthActionState {}
final class AuthActionLoading  extends AuthActionState {}

final class AuthFailure extends AuthActionState{
  final String error;
  AuthFailure(this.error);
}

final class AuthSuccess extends AuthActionState {
  final UserEntity user; 
  final AuthSource source;
  AuthSuccess({ required this.user,
  required this.source}); 
}
enum AuthSource{
  login,
  signUp,
  google,
}