import 'package:app/application/routing/app.router.dart';
import 'package:app/application/routing/router_guards.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// [locatorModule]
///
@module
abstract class InjecorModule {
  ///
  /// Allow to inject [SharedPreferences]
  ///
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  ///
  /// Allow to inject [AppRouter]
  ///
  AppRouter get appRouter =>
      AppRouter(authGuard: AuthGuard(), roomGuard: RoomGuard());
}
