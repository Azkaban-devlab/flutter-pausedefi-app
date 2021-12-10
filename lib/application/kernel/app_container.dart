import 'dart:async';

import 'package:app/application/kernel/app_config.dart';
import 'package:app/domain/communication/states/app.state.dart';
import 'package:flutter/widgets.dart';

///
/// [AppContainer]
///
class AppContainer {
  static AppContainer? _instance;

  /// [AppState]
  late AppState state;

  ///
  /// List of appcontainer locales
  ///
  final List<Locale> locales;

  ///
  /// [Parameters]
  ///
  final AppConfig appConfig;

  ///
  /// [AppContainer] factory constructor
  ///
  factory AppContainer() {
    if (AppContainer._instance == null) {
      throw DeferredLoadException(
          '''You are trying to access to the AppContainer instance before it was initialized.''');
    }
    return AppContainer._instance!;
  }

  /// Init constuctor
  AppContainer._({required this.appConfig})
      : state = AppState(),
        locales = <Locale>[const Locale('fr')];

  /// Initialize
  static AppContainer init(AppConfig appConfig) {
    AppContainer._instance = AppContainer._(appConfig: appConfig);
    return AppContainer._instance!;
  }
}
