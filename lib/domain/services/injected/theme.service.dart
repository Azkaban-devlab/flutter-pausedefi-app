import 'package:app/application/injections/injector.dart';
import 'package:app/application/localizations/locale_keys.g.dart';
import 'package:app/domain/services/injected/ui.service.dart';
import 'package:app/infrastructure/interfaces/storage.interface.dart';
import 'package:app/presentation/styles/themes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

///
/// [CurrentThemeMode]
///
class CurrentThemeMode extends ValueNotifier<ThemeMode?> {
  ///
  /// Constructor
  ///
  CurrentThemeMode(ThemeMode? value) : super(value);
}

///
/// [ThemeService]
///
@singleton
class ThemeService {
  ///
  /// Theme mode key
  ///
  static const String themeModeKey = 'theme-mode-key';

  ///
  /// List of available theme mode
  ///
  static const List<ThemeMode> themes = <ThemeMode>[
    ThemeMode.dark,
    ThemeMode.light,
    ThemeMode.system,
  ];

  ///
  /// [IStorage]
  ///
  final IStorage localStorage;

  ///
  /// [CurrentThemeMode]
  ///
  final CurrentThemeMode currentThemeMode;

  ///
  /// Constructor
  ///
  ThemeService(this.localStorage) : currentThemeMode = CurrentThemeMode(null);

  ///
  /// Get injected [ThemeService]
  ///
  factory ThemeService.injected() => injector<ThemeService>();

  ///
  /// Get dark theme
  ///
  ThemeData get darkTheme => buildDarkTheme();

  ///
  /// Get light theme
  ///
  ThemeData get theme => buildLightTheme();

  ///
  /// Get current theme mode
  ///
  ThemeMode get themeMode => currentThemeMode.value ?? ThemeMode.system;

  ///
  /// Format [themeMode] to `String`
  ///
  String format(BuildContext context, ThemeMode? themeMode) {
    switch (themeMode) {
      case ThemeMode.dark:
        return tr(LocaleKeys.dark);
      case ThemeMode.light:
        return tr(LocaleKeys.light);
      default:
        return tr(LocaleKeys.system);
    }
  }

  ///
  /// Format current theme mode
  ///
  String formatCurrent(BuildContext context) {
    return format(context, themeMode);
  }

  ///
  /// Initialize the service
  ///
  Future<void> initialize() async {
    currentThemeMode.value = await _getThemeMode();
  }

  ///
  /// Update the theme mode
  ///
  void updateMode(BuildContext context, ThemeMode themeMode) {
    UiService.injected().updateUiSystem(themeMode: themeMode);
    _setThemeMode(themeMode);
  }

  Future<ThemeMode> _getThemeMode() async {
    final String? themeMode = await localStorage.retrieveString(themeModeKey);
    if (themeMode == null) {
      return ThemeMode.system;
    }

    switch (themeMode) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  void _setThemeMode(ThemeMode themeMode) {
    currentThemeMode.value = themeMode;
    String themeModeStr;
    switch (themeMode) {
      case ThemeMode.dark:
        themeModeStr = 'dark';
        break;
      case ThemeMode.light:
        themeModeStr = 'light';
        break;
      default:
        themeModeStr = 'system';
    }
    localStorage.save(themeModeKey, themeModeStr);
  }
}
