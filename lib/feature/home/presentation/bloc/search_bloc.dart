import 'package:exercise_app/feature/home/domain/enitites/exercise_entity.dart';
import 'package:exercise_app/feature/home/domain/repositories/exercise_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
part 'search_event.dart';
part 'search_state.dart';


EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).switchMap(mapper);
 }

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ExerciseRepository repo;
  SearchBloc(this.repo) : super(SearchInitial()) {       
    on<SearchingEvent>((event, emit) async{
       final query = event.data.trim();
        if(query.isEmpty){     
          emit(SearchInitial());
          return;
        }
      emit(SearchLoading());
      final result = await repo.getExercise(query);
      result.fold(
        (failure) => emit(Searchfailed(failure.message)),
        (searchResult) {
          if(searchResult.isEmpty){emit(SearchEmpty());
          return;}
          else{
            emit(SearchSuccessful(data: searchResult));
          }
        }
      );      
    },
    transformer: debounce(const Duration(milliseconds: 500)),
    );
  }
  
}
