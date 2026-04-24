part of 'auth_status_bloc.dart';

@immutable
sealed class AuthStatusEvent {}

final class AuthCheck extends AuthStatusEvent{}

final class LogoutRequested extends AuthStatusEvent{}
