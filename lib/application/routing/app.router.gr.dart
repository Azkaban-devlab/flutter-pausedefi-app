// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:app/application/routing/router_builders.dart' as _i8;
import 'package:app/application/routing/router_guards.dart' as _i7;
import 'package:app/presentation/views/screens/auth/auth.screen.dart' as _i2;
import 'package:app/presentation/views/screens/main/index.screen.dart' as _i1;
import 'package:app/presentation/views/screens/main/pages/home/index.screen.dart'
    as _i4;
import 'package:app/presentation/views/widgets/custom/component_scaffold.dart'
    as _i3;
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

class AppRouter extends _i5.RootStackRouter {
  AppRouter(
      {_i6.GlobalKey<_i6.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i7.AuthGuard authGuard;

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    MainScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.MainScreen());
    },
    AuthScreenRoute.name: (routeData) {
      final args = routeData.argsAs<AuthScreenRouteArgs>(
          orElse: () => const AuthScreenRouteArgs());
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.AuthScreen(
              key: args.key, onAuthenticated: args.onAuthenticated));
    },
    ModalScreenRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.ModalScreen(),
          customRouteBuilder:
              _i8.RouterBuilders.cupertinoModalSheetStyleBuilder,
          opaque: true,
          barrierDismissible: true);
    },
    DialogScreenRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.DialogScreen(),
          customRouteBuilder: _i8.RouterBuilders.dialogStyleBuilder,
          opaque: true,
          barrierDismissible: true);
    },
    NestedModalScreenRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.NestedModalScreen(),
          customRouteBuilder:
              _i8.RouterBuilders.cupertinoModalSheetStyleBuilder,
          opaque: true,
          barrierDismissible: true);
    },
    NestedDialogScreenRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.NestedModalScreen(),
          customRouteBuilder: _i8.RouterBuilders.dialogStyleBuilder,
          opaque: true,
          barrierDismissible: true);
    },
    HomeScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.HomeScreen());
    },
    NestedModalScreenFirstRoute.name: (routeData) {
      return _i5.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i3.NestedModalScreenFirst());
    },
    NestedModalScreenSecondRoute.name: (routeData) {
      return _i5.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i3.NestedModalScreenSecond());
    },
    NestedDialogScreenFirstRoute.name: (routeData) {
      return _i5.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i3.NestedModalScreenFirst());
    },
    NestedDialogScreenSecondRoute.name: (routeData) {
      return _i5.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i3.NestedModalScreenSecond());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(MainScreenRoute.name, path: '/', guards: [
          authGuard
        ], children: [
          _i5.RouteConfig(HomeScreenRoute.name,
              path: '', parent: MainScreenRoute.name)
        ]),
        _i5.RouteConfig(AuthScreenRoute.name, path: '/login'),
        _i5.RouteConfig(ModalScreenRoute.name, path: '/modal'),
        _i5.RouteConfig(DialogScreenRoute.name, path: '/dialog'),
        _i5.RouteConfig(NestedModalScreenRoute.name,
            path: '/nested-modals',
            children: [
              _i5.RouteConfig('#redirect',
                  path: '',
                  parent: NestedModalScreenRoute.name,
                  redirectTo: 'first',
                  fullMatch: true),
              _i5.RouteConfig(NestedModalScreenFirstRoute.name,
                  path: 'first', parent: NestedModalScreenRoute.name),
              _i5.RouteConfig(NestedModalScreenSecondRoute.name,
                  path: 'second', parent: NestedModalScreenRoute.name)
            ]),
        _i5.RouteConfig(NestedDialogScreenRoute.name,
            path: '/nested-dialogs',
            children: [
              _i5.RouteConfig('#redirect',
                  path: '',
                  parent: NestedDialogScreenRoute.name,
                  redirectTo: 'first',
                  fullMatch: true),
              _i5.RouteConfig(NestedDialogScreenFirstRoute.name,
                  path: 'first', parent: NestedDialogScreenRoute.name),
              _i5.RouteConfig(NestedDialogScreenSecondRoute.name,
                  path: 'second', parent: NestedDialogScreenRoute.name)
            ])
      ];
}

/// generated route for [_i1.MainScreen]
class MainScreenRoute extends _i5.PageRouteInfo<void> {
  const MainScreenRoute({List<_i5.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'MainScreenRoute';
}

/// generated route for [_i2.AuthScreen]
class AuthScreenRoute extends _i5.PageRouteInfo<AuthScreenRouteArgs> {
  AuthScreenRoute({_i6.Key? key, void Function()? onAuthenticated})
      : super(name,
            path: '/login',
            args: AuthScreenRouteArgs(
                key: key, onAuthenticated: onAuthenticated));

  static const String name = 'AuthScreenRoute';
}

class AuthScreenRouteArgs {
  const AuthScreenRouteArgs({this.key, this.onAuthenticated});

  final _i6.Key? key;

  final void Function()? onAuthenticated;

  @override
  String toString() {
    return 'AuthScreenRouteArgs{key: $key, onAuthenticated: $onAuthenticated}';
  }
}

/// generated route for [_i3.ModalScreen]
class ModalScreenRoute extends _i5.PageRouteInfo<void> {
  const ModalScreenRoute() : super(name, path: '/modal');

  static const String name = 'ModalScreenRoute';
}

/// generated route for [_i3.DialogScreen]
class DialogScreenRoute extends _i5.PageRouteInfo<void> {
  const DialogScreenRoute() : super(name, path: '/dialog');

  static const String name = 'DialogScreenRoute';
}

/// generated route for [_i3.NestedModalScreen]
class NestedModalScreenRoute extends _i5.PageRouteInfo<void> {
  const NestedModalScreenRoute({List<_i5.PageRouteInfo>? children})
      : super(name, path: '/nested-modals', initialChildren: children);

  static const String name = 'NestedModalScreenRoute';
}

/// generated route for [_i3.NestedModalScreen]
class NestedDialogScreenRoute extends _i5.PageRouteInfo<void> {
  const NestedDialogScreenRoute({List<_i5.PageRouteInfo>? children})
      : super(name, path: '/nested-dialogs', initialChildren: children);

  static const String name = 'NestedDialogScreenRoute';
}

/// generated route for [_i4.HomeScreen]
class HomeScreenRoute extends _i5.PageRouteInfo<void> {
  const HomeScreenRoute() : super(name, path: '');

  static const String name = 'HomeScreenRoute';
}

/// generated route for [_i3.NestedModalScreenFirst]
class NestedModalScreenFirstRoute extends _i5.PageRouteInfo<void> {
  const NestedModalScreenFirstRoute() : super(name, path: 'first');

  static const String name = 'NestedModalScreenFirstRoute';
}

/// generated route for [_i3.NestedModalScreenSecond]
class NestedModalScreenSecondRoute extends _i5.PageRouteInfo<void> {
  const NestedModalScreenSecondRoute() : super(name, path: 'second');

  static const String name = 'NestedModalScreenSecondRoute';
}

/// generated route for [_i3.NestedModalScreenFirst]
class NestedDialogScreenFirstRoute extends _i5.PageRouteInfo<void> {
  const NestedDialogScreenFirstRoute() : super(name, path: 'first');

  static const String name = 'NestedDialogScreenFirstRoute';
}

/// generated route for [_i3.NestedModalScreenSecond]
class NestedDialogScreenSecondRoute extends _i5.PageRouteInfo<void> {
  const NestedDialogScreenSecondRoute() : super(name, path: 'second');

  static const String name = 'NestedDialogScreenSecondRoute';
}
