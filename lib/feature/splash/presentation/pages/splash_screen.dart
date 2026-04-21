import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/core/utils/l10n_extension.dart';

import 'package:flutter/material.dart';


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
      context.replaceRoute(DashboardPageRoute());
    });
  }
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Center(child: Text(context.l10n.appTitle,
      style: textTheme.titleLarge?.copyWith(color: colorScheme.primary))),
    );
  }
}
