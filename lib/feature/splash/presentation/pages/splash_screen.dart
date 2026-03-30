import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/bloc/app_bloc.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  //  void initState() {
  //   super.initState();
  //   Future.delayed(Duration(seconds: 2), () {
  //     context.router.replace(MyHomePageRoute(title: ''));
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state is AppUnonboarded){
          context.router.replace(OnboardingScreenRoute());
        }
        else if (state is AppAuthenticated) {          
          context.router.replace(MyHomePageRoute(title: 'Home'));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(child: Text("Splash Screen")),
      ),
    );
  }
}
