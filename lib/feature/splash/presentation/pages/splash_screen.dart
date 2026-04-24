// import 'package:auto_route/auto_route.dart';
// import 'package:exercise_app/core/routing/app_router.gr.dart';
// import 'package:exercise_app/core/utils/l10n_extension.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../Auth/presentation/bloc/auth_status_bloc/bloc/auth_status_bloc.dart';
// import '../../../onboarding/bloc/on_boarding_bloc.dart';


// @RoutePage()
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//    void initState() {
//     super.initState();
//     // Future.delayed(Duration(seconds: 2), () {    
//     //   if(!mounted) return ;
//     //   //context.read<AuthBloc>().add(AppStarted()); 
//     //   context.replaceRoute(DashboardPageRoute());
//     // });
//   }
//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;
//     final textTheme = Theme.of(context).textTheme;
//     return MultiBlocListener(
//       listeners: [
//          BlocListener<OnBoardingBloc, OnBoardingState>(
//           listener: (context, state) {
//             if (state is AppUnonboarded) {
//               context.router.replace(const OnboardingScreenRoute());
//             }

//             if (state is Appboarded) {
//               context.read<AuthStatusBloc>().add(AuthCheck());
//             }
//           },
//         ),

//         /// 2. Listen to auth state
//         BlocListener<AuthStatusBloc, AuthStatusState>(
//           listener: (context, state) {
//             if (state is Authenticated) {
//               context.router.replace(const DashboardPageRoute());
//             }

//             if (state is Unauthenticated) {
//               context.router.replace(const LoginScreenRoute());
//             }
//           },
//         ),
//       ],
//       child: Scaffold(
//         backgroundColor: colorScheme.surface,
//         body: Center(child: Text(context.l10n.appTitle,
//         style: textTheme.titleLarge?.copyWith(color: colorScheme.primary))),
//       ),
//     );
//   }
// }
