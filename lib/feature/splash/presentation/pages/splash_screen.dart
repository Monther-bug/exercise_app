import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/core/theme/app_colors.dart';
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
      //context.read<AuthBloc>().add(AppStarted()); 
      context.pushRoute(MyHomePageRoute(title: ''));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutural,
      body: Center(child: Text("Exercise app",
      style: AppTextStyles.titleLarge.copyWith(color:AppColors.primary))),
    );
  }
}
