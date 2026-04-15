import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/core/routing/gaurds/auth_guard.dart';
import 'package:exercise_app/core/routing/gaurds/onboarding_guard.dart';


@AutoRouterConfig(replaceInRouteName: 'Page')

class AppRouter extends $AppRouter  {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashScreenRoute.page , path: '/', initial: true),    
    AutoRoute(
      page: DashboardPageRoute.page,
      guards:  [OnboardingGuard() ,AuthGuard()],
      children: [ 
        AutoRoute(page: MyHomePageRoute.page, path: 'home'),
        AutoRoute(page: FavoritesPageRoute.page,path: 'favorites')
      ]),
    AutoRoute(page: OnboardingScreenRoute.page, ),
    AutoRoute(page: LoginScreenRoute.page, ),
    AutoRoute(page: SignUpScreenRoute.page, ),
    AutoRoute(page: GlobalErrorViewRoute.page, ),
    AutoRoute(page: EmptyViewRoute.page, ),
    AutoRoute(page: ExerciseDetailsRoute.page,),
    // AutoRoute(page: FavoritesPageRoute.page,)
  ];
}