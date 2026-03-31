import 'package:exercise_app/core/bloc/app_bloc.dart';
import 'package:exercise_app/core/di/injection_container.dart';
import 'package:exercise_app/core/routing/app_router.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/core/services/local_storage_service.dart';
import 'package:exercise_app/feature/onboarding/bloc/on_boarding_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final appRouter = AppRouter();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    final localStorageService = locater<LocalStorageService>(); 
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppBloc(localStorageService)),
        BlocProvider(create: (context) => OnBoardingBloc(localStorageService)),
      ],
      child: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state is AppUnonboarded) {
            appRouter.replace( OnboardingScreenRoute());
          } else if (state is AppAuthenticated) {
            appRouter.replace(MyHomePageRoute(title: 'Home'));
          }
        },
        child: ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              child: MaterialApp.router(        
                routerConfig: appRouter.config(),
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme: .fromSeed(seedColor: Colors.deepPurple),
                ), 
              )      
            ),
      ),
    );
  }
}