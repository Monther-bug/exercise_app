part of 'exercise_bloc.dart';

@immutable
sealed class ExerciseState {}

final class ExerciseInitial extends ExerciseState {}

final class ExerciseEmpty extends ExerciseState {}

final class ExerciseLoading extends ExerciseState{}

final class ExerciseLoaded extends ExerciseState{
  final List<ExerciseEntity> exercises;
  ExerciseLoaded(this.exercises);
}

final class ExerciseError extends ExerciseState{
  final String error;
  ExerciseError(this.error);
}
