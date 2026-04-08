import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:exercise_app/core/network/network_failure.dart';
import 'package:exercise_app/feature/home/data/repositories/exercise_repository.dart';
import 'package:exercise_app/feature/home/domain/enitites/exercise_entity.dart';
import 'package:exercise_app/feature/home/domain/repositories/exercise_repo.dart';
import 'package:meta/meta.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final ExerciseRepository repository;

  ExerciseBloc(this.repository) : super(ExerciseInitial()) {
    on<DisplayExercise>((event, emit) async{
      emit(ExerciseLoading());
      
        final result = await repository.getExercise();           
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
