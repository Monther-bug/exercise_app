part of 'favorites_bloc.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class Favorited extends FavoritesState {}

final class FavoritesLoaded extends FavoritesState {
  final List<ExerciseEntity> exercise;
  FavoritesLoaded({required this.exercise});
}
final class Favoritesfailed extends FavoritesState {
  final String message;
  Favoritesfailed({required this.message});
}
