part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final User? user; 
  AuthSuccess(this.user); 
}

final class AuthFailure extends AuthState{
  final String error;
  AuthFailure(this.error);
}

class Authenticated extends AuthState{}

class Unauthenticated extends AuthState{}

class AppUnonboarded extends AuthState{}

class Appboarded extends AuthState{}
