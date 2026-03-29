import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';


@AutoRouterConfig(replaceInRouteName: 'Page')

class AppRouter extends $AppRouter  {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashScreenRoute.page , path: '/',initial: true),
    AutoRoute(page: MyHomePageRoute.page, path: '/home' )
  ];
}