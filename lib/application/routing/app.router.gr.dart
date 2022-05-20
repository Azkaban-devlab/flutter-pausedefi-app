// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:app/application/routing/router_builders.dart' as _i14;
import 'package:app/application/routing/router_guards.dart' as _i13;
import 'package:app/presentation/views/screens/auth/auth.screen.dart' as _i2;
import 'package:app/presentation/views/screens/main/index.screen.dart' as _i1;
import 'package:app/presentation/views/screens/main/pages/challenge/index.screen.dart'
    as _i6;
import 'package:app/presentation/views/screens/main/pages/feed/index.screen.dart'
    as _i5;
import 'package:app/presentation/views/screens/main/pages/notification/index.screen.dart'
    as _i8;
import 'package:app/presentation/views/screens/main/pages/ranking/index.screen.dart'
    as _i7;
import 'package:app/presentation/views/screens/room/pages/home/index.screen.dart'
    as _i3;
import 'package:app/presentation/views/screens/room/pages/home/room/room.creation.screen.dart'
    as _i9;
import 'package:app/presentation/views/screens/room/pages/home/room/room.join.screen.dart'
    as _i10;
import 'package:app/presentation/views/widgets/custom/component_scaffold.dart'
    as _i4;
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

class AppRouter extends _i11.RootStackRouter {
  AppRouter(
      {_i12.GlobalKey<_i12.NavigatorState>? navigatorKey,
      required this.authGuard,
      required this.roomGuard})
      : super(navigatorKey);

  final _i13.AuthGuard authGuard;

  final _i13.RoomGuard roomGuard;

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    MainScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.MainScreen());
    },
    AuthScreenRoute.name: (routeData) {
      final args = routeData.argsAs<AuthScreenRouteArgs>(
          orElse: () => const AuthScreenRouteArgs());
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.AuthScreen(
              key: args.key, onAuthenticated: args.onAuthenticated));
    },
    RoomHomeScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.RoomHomeScreen());
    },
    ModalScreenRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.ModalScreen(),
          customRouteBuilder:
              _i14.RouterBuilders.cupertinoModalSheetStyleBuilder,
          opaque: true,
          barrierDismissible: true);
    },
    DialogScreenRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.DialogScreen(),
          customRouteBuilder: _i14.RouterBuilders.dialogStyleBuilder,
          opaque: true,
          barrierDismissible: true);
    },
    NestedModalScreenRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.NestedModalScreen(),
          customRouteBuilder:
              _i14.RouterBuilders.cupertinoModalSheetStyleBuilder,
          opaque: true,
          barrierDismissible: true);
    },
    NestedDialogScreenRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.NestedModalScreen(),
          customRouteBuilder: _i14.RouterBuilders.dialogStyleBuilder,
          opaque: true,
          barrierDismissible: true);
    },
    FeedScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.FeedScreen());
    },
    ChallengeMainScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.ChallengeMainScreen());
    },
    RankingScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.RankingScreen());
    },
    NotificationScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.NotificationScreen());
    },
    RoomCreationScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.RoomCreationScreen());
    },
    RoomJoinScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i10.RoomJoinScreen());
    },
    NestedModalScreenFirstRoute.name: (routeData) {
      return _i11.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i4.NestedModalScreenFirst());
    },
    NestedModalScreenSecondRoute.name: (routeData) {
      return _i11.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i4.NestedModalScreenSecond());
    },
    NestedDialogScreenFirstRoute.name: (routeData) {
      return _i11.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i4.NestedModalScreenFirst());
    },
    NestedDialogScreenSecondRoute.name: (routeData) {
      return _i11.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i4.NestedModalScreenSecond());
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(MainScreenRoute.name, path: '/', guards: [
          authGuard,
          roomGuard
        ], children: [
          _i11.RouteConfig(FeedScreenRoute.name,
              path: '', parent: MainScreenRoute.name),
          _i11.RouteConfig(ChallengeMainScreenRoute.name,
              path: '', parent: MainScreenRoute.name),
          _i11.RouteConfig(RankingScreenRoute.name,
              path: '', parent: MainScreenRoute.name),
          _i11.RouteConfig(NotificationScreenRoute.name,
              path: '', parent: MainScreenRoute.name)
        ]),
        _i11.RouteConfig(AuthScreenRoute.name, path: '/login'),
        _i11.RouteConfig(RoomHomeScreenRoute.name, path: '/home', guards: [
          authGuard
        ], children: [
          _i11.RouteConfig(RoomCreationScreenRoute.name,
              path: '', parent: RoomHomeScreenRoute.name),
          _i11.RouteConfig(RoomJoinScreenRoute.name,
              path: '', parent: RoomHomeScreenRoute.name)
        ]),
        _i11.RouteConfig(ModalScreenRoute.name, path: '/modal'),
        _i11.RouteConfig(DialogScreenRoute.name, path: '/dialog'),
        _i11.RouteConfig(NestedModalScreenRoute.name,
            path: '/nested-modals',
            children: [
              _i11.RouteConfig('#redirect',
                  path: '',
                  parent: NestedModalScreenRoute.name,
                  redirectTo: 'first',
                  fullMatch: true),
              _i11.RouteConfig(NestedModalScreenFirstRoute.name,
                  path: 'first', parent: NestedModalScreenRoute.name),
              _i11.RouteConfig(NestedModalScreenSecondRoute.name,
                  path: 'second', parent: NestedModalScreenRoute.name)
            ]),
        _i11.RouteConfig(NestedDialogScreenRoute.name,
            path: '/nested-dialogs',
            children: [
              _i11.RouteConfig('#redirect',
                  path: '',
                  parent: NestedDialogScreenRoute.name,
                  redirectTo: 'first',
                  fullMatch: true),
              _i11.RouteConfig(NestedDialogScreenFirstRoute.name,
                  path: 'first', parent: NestedDialogScreenRoute.name),
              _i11.RouteConfig(NestedDialogScreenSecondRoute.name,
                  path: 'second', parent: NestedDialogScreenRoute.name)
            ])
      ];
}

/// generated route for
/// [_i1.MainScreen]
class MainScreenRoute extends _i11.PageRouteInfo<void> {
  const MainScreenRoute({List<_i11.PageRouteInfo>? children})
      : super(MainScreenRoute.name, path: '/', initialChildren: children);

  static const String name = 'MainScreenRoute';
}

/// generated route for
/// [_i2.AuthScreen]
class AuthScreenRoute extends _i11.PageRouteInfo<AuthScreenRouteArgs> {
  AuthScreenRoute({_i12.Key? key, void Function()? onAuthenticated})
      : super(AuthScreenRoute.name,
            path: '/login',
            args: AuthScreenRouteArgs(
                key: key, onAuthenticated: onAuthenticated));

  static const String name = 'AuthScreenRoute';
}

class AuthScreenRouteArgs {
  const AuthScreenRouteArgs({this.key, this.onAuthenticated});

  final _i12.Key? key;

  final void Function()? onAuthenticated;

  @override
  String toString() {
    return 'AuthScreenRouteArgs{key: $key, onAuthenticated: $onAuthenticated}';
  }
}

/// generated route for
/// [_i3.RoomHomeScreen]
class RoomHomeScreenRoute extends _i11.PageRouteInfo<void> {
  const RoomHomeScreenRoute({List<_i11.PageRouteInfo>? children})
      : super(RoomHomeScreenRoute.name,
            path: '/home', initialChildren: children);

  static const String name = 'RoomHomeScreenRoute';
}

/// generated route for
/// [_i4.ModalScreen]
class ModalScreenRoute extends _i11.PageRouteInfo<void> {
  const ModalScreenRoute() : super(ModalScreenRoute.name, path: '/modal');

  static const String name = 'ModalScreenRoute';
}

/// generated route for
/// [_i4.DialogScreen]
class DialogScreenRoute extends _i11.PageRouteInfo<void> {
  const DialogScreenRoute() : super(DialogScreenRoute.name, path: '/dialog');

  static const String name = 'DialogScreenRoute';
}

/// generated route for
/// [_i4.NestedModalScreen]
class NestedModalScreenRoute extends _i11.PageRouteInfo<void> {
  const NestedModalScreenRoute({List<_i11.PageRouteInfo>? children})
      : super(NestedModalScreenRoute.name,
            path: '/nested-modals', initialChildren: children);

  static const String name = 'NestedModalScreenRoute';
}

/// generated route for
/// [_i4.NestedModalScreen]
class NestedDialogScreenRoute extends _i11.PageRouteInfo<void> {
  const NestedDialogScreenRoute({List<_i11.PageRouteInfo>? children})
      : super(NestedDialogScreenRoute.name,
            path: '/nested-dialogs', initialChildren: children);

  static const String name = 'NestedDialogScreenRoute';
}

/// generated route for
/// [_i5.FeedScreen]
class FeedScreenRoute extends _i11.PageRouteInfo<void> {
  const FeedScreenRoute() : super(FeedScreenRoute.name, path: '');

  static const String name = 'FeedScreenRoute';
}

/// generated route for
/// [_i6.ChallengeMainScreen]
class ChallengeMainScreenRoute extends _i11.PageRouteInfo<void> {
  const ChallengeMainScreenRoute()
      : super(ChallengeMainScreenRoute.name, path: '');

  static const String name = 'ChallengeMainScreenRoute';
}

/// generated route for
/// [_i7.RankingScreen]
class RankingScreenRoute extends _i11.PageRouteInfo<void> {
  const RankingScreenRoute() : super(RankingScreenRoute.name, path: '');

  static const String name = 'RankingScreenRoute';
}

/// generated route for
/// [_i8.NotificationScreen]
class NotificationScreenRoute extends _i11.PageRouteInfo<void> {
  const NotificationScreenRoute()
      : super(NotificationScreenRoute.name, path: '');

  static const String name = 'NotificationScreenRoute';
}

/// generated route for
/// [_i9.RoomCreationScreen]
class RoomCreationScreenRoute extends _i11.PageRouteInfo<void> {
  const RoomCreationScreenRoute()
      : super(RoomCreationScreenRoute.name, path: '');

  static const String name = 'RoomCreationScreenRoute';
}

/// generated route for
/// [_i10.RoomJoinScreen]
class RoomJoinScreenRoute extends _i11.PageRouteInfo<void> {
  const RoomJoinScreenRoute() : super(RoomJoinScreenRoute.name, path: '');

  static const String name = 'RoomJoinScreenRoute';
}

/// generated route for
/// [_i4.NestedModalScreenFirst]
class NestedModalScreenFirstRoute extends _i11.PageRouteInfo<void> {
  const NestedModalScreenFirstRoute()
      : super(NestedModalScreenFirstRoute.name, path: 'first');

  static const String name = 'NestedModalScreenFirstRoute';
}

/// generated route for
/// [_i4.NestedModalScreenSecond]
class NestedModalScreenSecondRoute extends _i11.PageRouteInfo<void> {
  const NestedModalScreenSecondRoute()
      : super(NestedModalScreenSecondRoute.name, path: 'second');

  static const String name = 'NestedModalScreenSecondRoute';
}

/// generated route for
/// [_i4.NestedModalScreenFirst]
class NestedDialogScreenFirstRoute extends _i11.PageRouteInfo<void> {
  const NestedDialogScreenFirstRoute()
      : super(NestedDialogScreenFirstRoute.name, path: 'first');

  static const String name = 'NestedDialogScreenFirstRoute';
}

/// generated route for
/// [_i4.NestedModalScreenSecond]
class NestedDialogScreenSecondRoute extends _i11.PageRouteInfo<void> {
  const NestedDialogScreenSecondRoute()
      : super(NestedDialogScreenSecondRoute.name, path: 'second');

  static const String name = 'NestedDialogScreenSecondRoute';
}
