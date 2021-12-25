import 'package:app/application/routing/app.router.gr.dart';
import 'package:app/domain/services/helpers/utils.helper.dart';
import 'package:app/presentation/views/screens/room/pages/home/room/room.creation.screen.dart';
import 'package:app/presentation/views/screens/room/pages/home/room/room.join.screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///
/// [NavigationHelper]
///
class NavigationHelper {
  ///
  /// Navigate back
  ///
  static void navigateBack(BuildContext context) {
    context.router.root.pop().then((bool value) {
      if (!value) {
        context.router.root
            .pushAndPopUntil(const MainScreenRoute(), predicate: (_) => false);
      }
    });
  }

  ///
  /// Navigate to home
  ///
  static void navigateToHome(BuildContext context) {
    context.router.root
        .pushAndPopUntil(const RoomHomeScreenRoute(), predicate: (_) => false);
  }

  ///
  /// Navigate to room
  ///
  static void navigateToRoom(BuildContext context) {
    context.router.root
        .pushAndPopUntil(const MainScreenRoute(), predicate: (_) => false);
  }

  ///
  /// Navigate to creation room
  ///
  static void navigateToCreationRoom(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const RoomCreationScreen()));
  }

  ///
  /// Navigate to access room
  ///
  static void navigateToAccessRoom(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const RoomJoinScreen()));
  }
}

///
/// [TitleUpdateObserver]
///
class TitleUpdateObserver extends NavigatorObserver {
  @override
  Future<void> didPush(
      Route<dynamic> route, Route<dynamic>? previousRoute) async {
    super.didPush(route, previousRoute);
    UtilsHelper.updatePageTitle(
        getTitleForRouteName(route.settings.name) ?? '');
  }

  ///
  /// Get page title from path
  ///
  static String? getTitleForPath(String? path) {
    if (path == '/') {
      return 'Welcome';
    }
    return null;
  }

  ///
  /// Get page title from route name
  ///
  static String? getTitleForRouteName(String? routeName) {
    if (routeName == RoomHomeScreenRoute.name) {
      return 'Home';
    }
    return null;
  }
}
