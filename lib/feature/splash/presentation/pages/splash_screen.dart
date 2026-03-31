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
   void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {    
      if(!mounted) return ;
      context.read<AppBloc>().add(AppStarted()); 
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(child: Text("Splash Screen")),
    );
  }
}
