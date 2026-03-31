part of 'on_boarding_bloc.dart';

@immutable
sealed class OnBoardingState {}

final class OnBoardingInitial extends OnBoardingState {}

// class OnBoardingChecked extends OnBoardingState{
//   final bool hasSeenOnboarding;
//   OnBoardingChecked(this.hasSeenOnboarding);
// }

class OnboardingCompleted extends OnBoardingState{}
