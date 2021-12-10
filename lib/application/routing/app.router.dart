import 'package:app/presentation/views/screens/auth/auth.screen.dart';
import 'package:app/presentation/views/screens/main/index.screen.dart';
import 'package:app/presentation/views/screens/main/pages/home/index.screen.dart';
import 'package:app/presentation/views/widgets/custom/component_scaffold.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import 'router_builders.dart';
import 'router_guards.dart';

export 'app.router.gr.dart';

@AdaptiveAutoRouter(replaceInRouteName: 'Page', routes: <AutoRoute<dynamic>>[
  AdaptiveRoute<dynamic>(
    page: MainScreen,
    path: '/',
    initial: true,
    guards: <Type>[AuthGuard],
    children: <AutoRoute<dynamic>>[
      AdaptiveRoute<dynamic>(page: HomeScreen, path: ''),
    ],
  ),
  AdaptiveRoute<dynamic>(
    page: AuthScreen,
    path: '/login',
  ),
  CustomRoute<dynamic>(
    page: ModalScreen,
    path: '/modal',
    barrierDismissible: true,
    customRouteBuilder: RouterBuilders.cupertinoModalSheetStyleBuilder,
  ),
  CustomRoute<dynamic>(
    page: DialogScreen,
    path: '/dialog',
    barrierDismissible: true,
    customRouteBuilder: RouterBuilders.dialogStyleBuilder,
  ),
  CustomRoute<dynamic>(
    page: NestedModalScreen,
    path: '/nested-modals',
    barrierDismissible: true,
    customRouteBuilder: RouterBuilders.cupertinoModalSheetStyleBuilder,
    children: <AutoRoute<dynamic>>[
      CupertinoRoute<dynamic>(
        page: NestedModalScreenFirst,
        initial: true,
        path: 'first',
      ),
      CupertinoRoute<dynamic>(
        page: NestedModalScreenSecond,
        initial: true,
        path: 'second',
      ),
    ],
  ),
  CustomRoute<dynamic>(
    page: NestedModalScreen,
    path: '/nested-dialogs',
    name: 'NestedDialogScreenRoute',
    barrierDismissible: true,
    customRouteBuilder: RouterBuilders.dialogStyleBuilder,
    children: <AutoRoute<dynamic>>[
      CupertinoRoute<dynamic>(
        page: NestedModalScreenFirst,
        initial: true,
        name: 'NestedDialogScreenFirstRoute',
        path: 'first',
      ),
      CupertinoRoute<dynamic>(
        page: NestedModalScreenSecond,
        initial: true,
        name: 'NestedDialogScreenSecondRoute',
        path: 'second',
      ),
    ],
  ),
]) //CustomAutoRoute(..config)

///
/// [$AppRouter]
///
class $AppRouter {}
