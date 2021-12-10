import 'package:app/domain/services/injected/authentication.service.dart';
import 'package:auto_route/auto_route.dart';

import 'app.router.dart';

///
/// [AuthGuard]
///
class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (!AuthenticationService.injected().authenticated) {
      router.pushAndPopUntil(AuthScreenRoute(), predicate: (_) => false);
    } else {
      resolver.next();
    }
  }
}
