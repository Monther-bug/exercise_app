
import 'package:exercise_app/core/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'on_boarding_event.dart';
part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final LocalStorageService localStorageService;
  OnBoardingBloc(this.localStorageService) : super(OnBoardingInitial()) {

    // on<CheckOnboarding>((event, emit) async{
    //   final hasSeen = await localStorageService.hasSeenOnboarding();
    //   emit(OnBoardingChecked(hasSeen));
    // });

    on<CompleteOnboarding>((event, emit) async{
      await localStorageService.markOnboardingComplete();
      emit(OnboardingCompleted());
    });
  }
}
