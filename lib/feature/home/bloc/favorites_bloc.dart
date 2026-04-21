

import 'package:exercise_app/core/di/injection_container.dart';
import 'package:exercise_app/feature/home/domain/enitites/exercise_entity.dart';
import 'package:exercise_app/feature/home/domain/repositories/favorites_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final repo = locator<FavoritesRepository>();
  FavoritesBloc() : super(FavoritesInitial()) {
    on<ToggleFavorites>((event, emit) async{       
      await repo.toggleFavorites(event.exercise);
      final updatedList = await repo.getFavorites();    
      emit(FavoritesLoaded(exercise: updatedList));
    });

    on<LoadFavorites>((event, emit) async {
      emit(FavoritesLoading());
      try{
        final favs = await repo.getFavorites();
        emit(FavoritesLoaded(exercise: favs));
      }catch(e){
        emit(Favoritesfailed(message: e.toString()));
      }
      
    });
  }
}
