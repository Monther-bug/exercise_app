import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/core/routing/gaurds/auth_guard.dart';
import 'package:exercise_app/core/routing/gaurds/onboarding_guard.dart';


@AutoRouterConfig(replaceInRouteName: 'Page')

class AppRouter extends $AppRouter  {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: AppRootScreenRoute.page , path: '/', initial: true),    
    AutoRoute(
      page: DashboardPageRoute.page,
      guards:  [OnboardingGuard()],
      children: [ 
        AutoRoute(page: MyHomePageRoute.page, path: 'home/:title'),
        AutoRoute(page: FavoritesPageRoute.page,path: 'favorites')
      ]),
    AutoRoute(page: OnboardingScreenRoute.page, ),
    AutoRoute(page: LoginScreenRoute.page, ),
    AutoRoute(page: SignUpScreenRoute.page, ),
    AutoRoute(page: GlobalErrorViewRoute.page, ),
    AutoRoute(page: EmptyViewRoute.page, ),
    CustomRoute(page: ExerciseDetailsRoute.page,
    transitionsBuilder: TransitionsBuilders.slideLeftWithFade, // Smooth slide from right
      durationInMilliseconds: 700,),
    // AutoRoute(page: FavoritesPageRoute.page,)
  ];
}