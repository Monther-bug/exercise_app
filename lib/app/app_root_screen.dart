
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/routing/app_router.gr.dart';
import '../feature/Auth/presentation/bloc/auth_status_bloc/bloc/auth_status_bloc.dart';
import '../feature/home/bloc/favorites_bloc.dart';
import '../feature/onboarding/bloc/on_boarding_bloc.dart';

@RoutePage()
class AppRootScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        /// 1. Listen to onboarding flow
        BlocListener<OnBoardingBloc, OnBoardingState>(
          listener: (context, state) {
            if (state is AppUnonboarded) {
              context.router.push(const OnboardingScreenRoute());
            }

            if (state is Appboarded) {
              context.read<AuthStatusBloc>().add(AuthCheck());
            }
          },
        ),

        /// 2. Listen to auth state
        BlocListener<AuthStatusBloc, AuthStatusState>(
          listener: (context, state) {
            if (state is Authenticated) {
              context.read<FavoritesBloc>().add(LoadFavorites());
              context.router.replaceAll([const DashboardPageRoute()]);
            }

            if (state is Unauthenticated) {
              context.read<FavoritesBloc>().add(ClearFavorites());
              context.router.replaceAll([const LoginScreenRoute()]);
            }
          },
        ),
      ],

      child: const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
