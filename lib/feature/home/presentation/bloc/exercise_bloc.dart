
import 'package:exercise_app/feature/home/domain/enitites/exercise_entity.dart';
import 'package:exercise_app/feature/home/domain/repositories/exercise_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final ExerciseRepository repository;

  ExerciseBloc(this.repository) : super(ExerciseInitial()) {
    on<DisplayExercise>((event, emit) async{
      emit(ExerciseLoading());
      
        final result = await repository.getExercise(null);           
        result.fold(
        (failure) => emit(ExerciseError(failure.message)),
        (exercises) {if (exercises.isEmpty) {
            emit(ExerciseEmpty());
          } else {
            emit(ExerciseLoaded(exercises));
          }
        });
    
    });
  
  }
}
