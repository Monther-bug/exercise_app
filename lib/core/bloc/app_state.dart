part of 'app_bloc.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

class AppUnonboarded extends AppState{}

class AppAuthenticated extends AppState{}
