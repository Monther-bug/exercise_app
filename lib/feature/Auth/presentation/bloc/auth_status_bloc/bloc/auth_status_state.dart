part of 'auth_status_bloc.dart';

@immutable
sealed class AuthStatusState {}

final class AuthStatusInitial extends AuthStatusState {}

final class AuthStatusLoading extends AuthStatusState {}

class Authenticated extends AuthStatusState{}

class Unauthenticated extends AuthStatusState{}
