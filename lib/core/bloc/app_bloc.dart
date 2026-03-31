
import 'package:exercise_app/core/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final LocalStorageService _storage;
  AppBloc(this._storage) : super(AppInitial()) {
    on<AppStarted>((event, emit) async{
      final hasSeenOnboarding = await _storage.hasSeenOnboarding();
      if(!hasSeenOnboarding){
        emit(AppUnonboarded());
      }
      else{emit(AppAuthenticated());}
    });

    on<OnboardingFinished>((event, emit){
      emit(AppAuthenticated());
    });
  }
}
