import 'package:exercise_app/core/di/injection_container.dart';
import 'package:exercise_app/core/routing/app_router.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/core/services/local_storage_service.dart';
import 'package:exercise_app/feature/Auth/presentation/bloc/auth_bloc.dart';
import 'package:exercise_app/feature/home/data/repositories/exercise_repository.dart';
import 'package:exercise_app/feature/home/domain/repositories/exercise_repo.dart';
import 'package:exercise_app/feature/home/presentation/bloc/exercise_bloc.dart';
import 'package:exercise_app/feature/onboarding/bloc/on_boarding_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ...existing code...

final appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localStorageService = locator<LocalStorageService>(); 
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => OnBoardingBloc(localStorageService)),
        BlocProvider(create: (_)=> locator<ExerciseBloc>()..add(DisplayExercise())),
        BlocProvider(create: (_) => locator<AuthBloc>()),
      ],
      child: MultiBlocListener(
        listeners: [
        
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {  
              
              if(state is AppUnonboarded){
                appRouter.replace(OnboardingScreenRoute());
              }
              else if (state is Appboarded){
                context.read<AuthBloc>().add(AuthCheck());
              }    
              if(state is Authenticated){
                appRouter.replace(MyHomePageRoute(title: ''));
              }   
              else if (state is Unauthenticated){                
                appRouter.replace(LoginScreenRoute());
              }
              if(state is AuthSuccess){
                appRouter.replace(MyHomePageRoute(title: ''));
              }
              
              
            },
          ),
        ],
        child: MaterialApp.router(
          routerConfig: appRouter.config(),
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          ),
        ),
      ),
    );
  }
}
