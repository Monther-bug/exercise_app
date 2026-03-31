part of 'on_boarding_bloc.dart';

@immutable
sealed class OnBoardingEvent {}

// class CheckOnboarding extends OnBoardingEvent{}

class CompleteOnboarding extends OnBoardingEvent{}
