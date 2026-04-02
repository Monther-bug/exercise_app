import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/theme/app_text_styles.dart';

import 'package:exercise_app/feature/Auth/presentation/bloc/auth_bloc.dart';
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
      context.read<AuthBloc>().add(AppStarted()); 
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(child: Text("Splash Screen",
      style: AppTextStyles.titleLarge.copyWith(color:Colors.white))),
    );
  }
}
