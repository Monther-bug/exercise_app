part of 'app_bloc.dart';

@immutable
sealed class AppEvent {}

class AppStarted extends AppEvent {}


class OnboardingFinished extends AppEvent {}
