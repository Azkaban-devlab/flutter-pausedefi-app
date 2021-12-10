import 'package:app/application/routing/app.router.gr.dart';
import 'package:app/domain/services/helpers/utils.helper.dart';
import 'package:auto_route/auto_route.dart';
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
        .pushAndPopUntil(const MainScreenRoute(), predicate: (_) => false);
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
    if (routeName == HomeScreenRoute.name) {
      return 'Home';
    }
    return null;
  }
}
