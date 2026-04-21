part of 'favorites_bloc.dart';

@immutable
sealed class FavoritesEvent {}

final class ToggleFavorites extends FavoritesEvent{
  final ExerciseEntity exercise;

  ToggleFavorites({
    required this.exercise
  });
}

final class LoadFavorites extends FavoritesEvent{}
