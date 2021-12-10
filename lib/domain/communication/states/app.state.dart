import 'package:flutter/widgets.dart';

/// [AppState]
///
/// Global app state that represent application state
///
class AppState extends ChangeNotifier {
  bool? _launching;

  bool? _launched;

  AppLifecycleState? _appLifecycleState;

  /// constructor
  AppState() {
    _launching = true;
    _launched = false;
    _appLifecycleState = AppLifecycleState.resumed;
  }

  ///
  set launched(bool v) {
    _launched = v;
    notifyListeners();
  }

  ///
  set launching(bool v) {
    _launching = v;
    notifyListeners();
  }

  ///
  set appLifecycleState(AppLifecycleState v) {
    _appLifecycleState = v;
    notifyListeners();
  }

  /// If the app launched so the first screen was already built
  bool get launched => _launched ?? false;

  /// If the app is launching so the application is still initializing
  bool get launching => _launching ?? true;

  /// Get the current [AppLifecycleState]
  AppLifecycleState get appLifecycleState =>
      _appLifecycleState ?? AppLifecycleState.resumed;
}
