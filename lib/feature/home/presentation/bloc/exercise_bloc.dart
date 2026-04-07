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
      try{
        final data = await repository.getExercise();
        if(data.isEmpty){
          emit(ExerciseEmpty());
        }
        else{
           emit(ExerciseLoaded(data));
        }       
      }catch(e){
        if(e is DioException && e.error is NetworkFailure){
          emit(ExerciseError((e.error as NetworkFailure).message));
        }
        else{
          emit(ExerciseError(e.toString()));
        }
      }
    });
    
    // Future<void> fetch() async{
    //   emit(ExerciseLoading());
    //   try{
    //     final data = await repository.getExercise();
    //     emit(ExerciseLoaded(data));
    //   }catch(e){
    //     if(e is DioException && e.error is NetworkFailure){
    //       emit(ExerciseError((e.error as NetworkFailure).message));
    //     }
    //     else{
    //       emit(ExerciseError('Somthing went wrong'));
    //     }
    //   }
    // }
  }
}
