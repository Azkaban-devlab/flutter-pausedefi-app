import 'dart:ui';

import 'package:app/application/kernel/app_config.dart';
import 'package:app/application/kernel/app_container.dart';
import 'package:app/domain/communication/states/app.state.dart';

/// Get application locales
List<Locale> appLocales() {
  return AppContainer().locales;
}

/// Get application config
AppConfig appConfig() {
  return AppContainer().appConfig;
}

/// Get application state
AppState appState() {
  return AppContainer().state;
}
