import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/bloc/app_bloc.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/feature/onboarding/bloc/on_boarding_bloc.dart';
import 'package:exercise_app/feature/onboarding/presentation/widgets/onboarding_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnBoardingBloc, OnBoardingState>(
      listener: (context, state) {
        if (state is OnboardingCompleted) {
        context.read<AppBloc>().add(OnboardingFinished());
        context.router.replace(MyHomePageRoute(title: 'Home'));
      }
      },
      child: (OnboardingBody()),
    );
  }
}
