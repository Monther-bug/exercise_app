import 'package:exercise_app/core/di/injection_container.dart';
import 'package:exercise_app/core/presentation/bloc/local_bloc.dart';
import 'package:exercise_app/core/presentation/bloc/theme_bloc.dart';
import 'package:exercise_app/core/routing/app_router.dart';
import 'package:exercise_app/core/services/local_storage_service.dart';
import 'package:exercise_app/core/theme/app_colors.dart';
import 'package:exercise_app/core/theme/app_text_styles.dart';
import 'package:exercise_app/core/utils/l10n_extension.dart';
import 'package:exercise_app/core/utils/responsive_extension.dart';
import 'package:exercise_app/feature/Auth/presentation/bloc/auth_bloc.dart';
import 'package:exercise_app/feature/home/presentation/bloc/exercise_bloc.dart';
import 'package:exercise_app/feature/home/presentation/bloc/favorites_bloc.dart';
import 'package:exercise_app/feature/home/presentation/bloc/search_bloc.dart';
import 'package:exercise_app/feature/onboarding/bloc/on_boarding_bloc.dart';
import 'package:exercise_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ...existing code...

final appRouter = AppRouter();

class MyApp extends StatelessWidget {
  final Locale? locale;

  const MyApp({super.key, this.locale});

  @override
  Widget build(BuildContext context) {
    final localStorageService = locator<LocalStorageService>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => OnBoardingBloc(localStorageService)),
        BlocProvider(
          create: (_) => locator<ExerciseBloc>()..add(DisplayExercise()),
        ),
        BlocProvider(create: (_) => locator<AuthBloc>()..add(AppStarted())),
        BlocProvider(create: (_) => locator<SearchBloc>()),
        BlocProvider(create: (_) => FavoritesBloc()..add(LoadFavorites())),        
        BlocProvider(create: (_) => LocalBloc()),                 
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              appRouter.reevaluateGuards();
            },
          ),
        ],
        child: BlocBuilder<LocalBloc, LocalState>(
          builder: (context, state) {
            return MaterialApp.router(
              routerConfig: appRouter.config(),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: state.locale,
              onGenerateTitle: (context) => context.l10n.appTitle,
              themeMode:state.themeMode,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.light(
                  primary: AppColors.primaryBlue,                  
                  onPrimary: const Color(0xFFFFFFFF),
                  secondary: AppColors.secondaryPurple,
                  onSecondary: AppColors.onSecondary,
                  background: AppColors.background,
                  surface: AppColors.lightSurface,
                  shadow: const Color.fromARGB(255,112,112,112),
                  surfaceVariant: AppColors.gradiantTop,
                  onSurfaceVariant: const Color.fromARGB(255,186,188,186)
                ),
                textTheme: TextTheme(
                  titleLarge: AppTextStyles.titleLarge.copyWith(color: Colors.black, fontSize: context.isMobile? 14: 16),
                  titleMedium: AppTextStyles.titleMedium.copyWith(color: Colors.black,fontSize: context.isMobile? 12: 14),
                  titleSmall: AppTextStyles.titleSmall.copyWith(color: Colors.black,fontSize: context.isMobile? 10: 12),
                  bodyLarge: AppTextStyles.bodyLarge.copyWith(color: Colors.black,fontSize: context.isMobile? 14: 16),
                  bodyMedium: AppTextStyles.bodyMedium.copyWith(color: Colors.black,fontSize: context.isMobile? 12: 14),
                  bodySmall: AppTextStyles.bodySmall.copyWith(color: Colors.black,fontSize: context.isMobile? 10: 12),
                )
              ),
              darkTheme: ThemeData(
                colorScheme: ColorScheme.dark(
                  primary: AppColors.primaryAction,
                  secondary: AppColors.secondaryAccent,
                  onSecondary: AppColors.onSecondaryVariant,
                  background: AppColors.darkBackground,
                  surface: AppColors.darkSurface,
                  onPrimary: const Color(0xFF121212),
                  shadow: const Color.fromARGB(255,112,112,112),
                  surfaceVariant: AppColors.gradientTopVibrant,
                  onSurfaceVariant: const Color(0xFFBABCBA)
                ),
                textTheme: TextTheme(
                   titleLarge: AppTextStyles.titleLarge.copyWith(color: Colors.white, fontSize: context.isMobile? 14: 16),
                  titleMedium: AppTextStyles.titleMedium.copyWith(color: Colors.white,fontSize: context.isMobile? 12: 14),
                  titleSmall: AppTextStyles.titleSmall.copyWith(color: Colors.white,fontSize: context.isMobile? 10: 12),
                  bodyLarge: AppTextStyles.bodyLarge.copyWith(color: Colors.white,fontSize: context.isMobile? 14: 16),
                  bodyMedium: AppTextStyles.bodyMedium.copyWith(color: Colors.white,fontSize: context.isMobile? 12: 14),
                  bodySmall: AppTextStyles.bodySmall.copyWith(color: Colors.white,fontSize: context.isMobile? 10: 12),

                )
              ),
            );
          },
        ),
      ),
    );
  }
}
