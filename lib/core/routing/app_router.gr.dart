// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:exercise_app/feature/Auth/presentation/page/login_screen.dart'
    as _i3;
import 'package:exercise_app/feature/Auth/presentation/page/sign_up_screen.dart'
    as _i6;
import 'package:exercise_app/feature/error/presentation/empty_view.dart' as _i1;
import 'package:exercise_app/feature/error/presentation/global_error_view.dart'
    as _i2;
import 'package:exercise_app/feature/home/presentation/pages/home.dart' as _i4;
import 'package:exercise_app/feature/onboarding/presentation/pages/onboarding_screen.dart'
    as _i5;
import 'package:exercise_app/feature/splash/presentation/pages/splash_screen.dart'
    as _i7;
import 'package:flutter/material.dart' as _i9;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    EmptyViewRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyView(),
      );
    },
    GlobalErrorViewRoute.name: (routeData) {
      final args = routeData.argsAs<GlobalErrorViewRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.GlobalErrorView(
          message: args.message,
          key: args.key,
        ),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    MyHomePageRoute.name: (routeData) {
      final args = routeData.argsAs<MyHomePageRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.MyHomePage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    OnboardingScreenRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.OnboardingScreen(),
      );
    },
    SignUpScreenRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SignUpScreen(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.EmptyView]
class EmptyViewRoute extends _i8.PageRouteInfo<void> {
  const EmptyViewRoute({List<_i8.PageRouteInfo>? children})
      : super(
          EmptyViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyViewRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.GlobalErrorView]
class GlobalErrorViewRoute extends _i8.PageRouteInfo<GlobalErrorViewRouteArgs> {
  GlobalErrorViewRoute({
    required String message,
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          GlobalErrorViewRoute.name,
          args: GlobalErrorViewRouteArgs(
            message: message,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'GlobalErrorViewRoute';

  static const _i8.PageInfo<GlobalErrorViewRouteArgs> page =
      _i8.PageInfo<GlobalErrorViewRouteArgs>(name);
}

class GlobalErrorViewRouteArgs {
  const GlobalErrorViewRouteArgs({
    required this.message,
    this.key,
  });

  final String message;

  final _i9.Key? key;

  @override
  String toString() {
    return 'GlobalErrorViewRouteArgs{message: $message, key: $key}';
  }
}

/// generated route for
/// [_i3.LoginScreen]
class LoginScreenRoute extends _i8.PageRouteInfo<void> {
  const LoginScreenRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LoginScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginScreenRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MyHomePage]
class MyHomePageRoute extends _i8.PageRouteInfo<MyHomePageRouteArgs> {
  MyHomePageRoute({
    _i9.Key? key,
    required String title,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          MyHomePageRoute.name,
          args: MyHomePageRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'MyHomePageRoute';

  static const _i8.PageInfo<MyHomePageRouteArgs> page =
      _i8.PageInfo<MyHomePageRouteArgs>(name);
}

class MyHomePageRouteArgs {
  const MyHomePageRouteArgs({
    this.key,
    required this.title,
  });

  final _i9.Key? key;

  final String title;

  @override
  String toString() {
    return 'MyHomePageRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i5.OnboardingScreen]
class OnboardingScreenRoute extends _i8.PageRouteInfo<void> {
  const OnboardingScreenRoute({List<_i8.PageRouteInfo>? children})
      : super(
          OnboardingScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingScreenRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SignUpScreen]
class SignUpScreenRoute extends _i8.PageRouteInfo<void> {
  const SignUpScreenRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SignUpScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpScreenRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SplashScreen]
class SplashScreenRoute extends _i8.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
