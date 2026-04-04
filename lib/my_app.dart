import 'package:exercise_app/core/di/injection_container.dart';
import 'package:exercise_app/core/routing/app_router.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/core/services/local_storage_service.dart';
import 'package:exercise_app/feature/Auth/data/repository/auth_repository_imp.dart';
import 'package:exercise_app/feature/Auth/data/sources/auth_remote_data_source.dart';
import 'package:exercise_app/feature/Auth/domain/usecases/login_usecase.dart';
import 'package:exercise_app/feature/Auth/domain/usecases/sign_up_usecase.dart';
import 'package:exercise_app/feature/Auth/presentation/bloc/auth_bloc.dart';
import 'package:exercise_app/feature/onboarding/bloc/on_boarding_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ...existing code...

final appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localStorageService = locater<LocalStorageService>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnBoardingBloc(localStorageService)),
        BlocProvider(
          create: (context) => AuthBloc(
            AuthRepositoryImp(AuthRemoteDataSource()),
            LoginUsecase(AuthRepositoryImp(AuthRemoteDataSource())),
            SignUpUsecase(AuthRepositoryImp(AuthRemoteDataSource())),
            localStorageService
          ),
        ),
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
