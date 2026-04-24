
import 'package:exercise_app/core/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection_container.dart';


part 'on_boarding_event.dart';
part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
 
  OnBoardingBloc() : super(OnBoardingInitial()) {

    on<AppStarted>((event, emit) async{
      final hasSeenOnboarding = await locator<LocalStorageService>().hasSeenOnboarding();
      if(!hasSeenOnboarding){
        emit(AppUnonboarded());
      }
      else{emit(Appboarded());}
    });
    on<CompleteOnboarding>((event, emit) async{
      await locator<LocalStorageService>().markOnboardingComplete();
      emit(Appboarded());
      //emit(OnboardingCompleted());
    });
  }
}
