import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/feature/Auth/presentation/bloc/auth_bloc.dart';
import 'package:exercise_app/feature/onboarding/bloc/on_boarding_bloc.dart';
import 'package:exercise_app/feature/onboarding/presentation/widgets/onboarding_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<OnBoardingBloc, OnBoardingState>(
          listener: (context, state) {
            if (state is OnboardingCompleted) {
              context.read<AuthBloc>().add(OnboardingFinished());              
            }
          },
        ),
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if(state is Authenticated || state is Unauthenticated){
              context.router.replace(MyHomePageRoute(title: ''));
            }
          },
        ),
      ],
      child: (OnboardingBody()),
    );
  }
}
