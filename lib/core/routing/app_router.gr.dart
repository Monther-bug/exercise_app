// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:exercise_app/feature/home/presentation/pages/home.dart' as _i1;
import 'package:exercise_app/feature/splash/presentation/pages/splash_screen.dart'
    as _i2;
import 'package:flutter/material.dart' as _i4;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MyHomePageRoute.name: (routeData) {
      final args = routeData.argsAs<MyHomePageRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.MyHomePage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.MyHomePage]
class MyHomePageRoute extends _i3.PageRouteInfo<MyHomePageRouteArgs> {
  MyHomePageRoute({
    _i4.Key? key,
    required String title,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          MyHomePageRoute.name,
          args: MyHomePageRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'MyHomePageRoute';

  static const _i3.PageInfo<MyHomePageRouteArgs> page =
      _i3.PageInfo<MyHomePageRouteArgs>(name);
}

class MyHomePageRouteArgs {
  const MyHomePageRouteArgs({
    this.key,
    required this.title,
  });

  final _i4.Key? key;

  final String title;

  @override
  String toString() {
    return 'MyHomePageRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i2.SplashScreen]
class SplashScreenRoute extends _i3.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i3.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
