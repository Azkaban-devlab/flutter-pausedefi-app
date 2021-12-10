import 'package:app/application/injections/injector.dart';
import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

///
/// [UiService]
///
@singleton
class UiService {
  final _UiSystemLock _uiSystemLock = _UiSystemLock();

  ///
  /// Constructor
  ///
  UiService();

  ///
  /// Get injected [UiService]
  ///
  factory UiService.injected() => injector<UiService>();

  ///
  /// Hide the UIOverlay
  ///
  void hideUIOverlay({bool hideTop = true, bool hideBottom = true}) {
    final List<SystemUiOverlay> systemUiOverlays = <SystemUiOverlay>[];
    if (!hideTop) systemUiOverlays.add(SystemUiOverlay.top);
    if (!hideBottom) systemUiOverlays.add(SystemUiOverlay.bottom);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: systemUiOverlays);
  }

  ///
  /// Request focus on [node] or remove focus to current focused
  ///
  void requestFocusOn(BuildContext context, FocusNode? node,
      {FocusNode? currentNode}) {
    assert(node != null);

    if (currentNode != null) currentNode.unfocus();
    FocusScope.of(context).requestFocus(node);
  }

  ///
  /// Show UIOverlay
  ///
  void showUIOverlay({bool showTop = true, bool showBottom = true}) {
    final List<SystemUiOverlay> systemUiOverlays = <SystemUiOverlay>[];
    if (showTop) systemUiOverlays.add(SystemUiOverlay.top);
    if (showBottom) systemUiOverlays.add(SystemUiOverlay.bottom);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: systemUiOverlays);
  }

  ///
  /// Unlock UiSystem
  ///
  void unlockUiSystem(Object locker) {
    if (_uiSystemLock.uiSystemLocker == locker) {
      _uiSystemLock.uiSystemLocked = false;
      _uiSystemLock.uiSystemLocker = null;

      updateUiSystem(
        color: _uiSystemLock.previousColor,
      );
    }
  }

  ///
  /// Update UiSystem
  ///
  void updateUiSystem(
      {Color? color,
      Color? navigationBarColor,
      ThemeMode? themeMode,
      Object? locker}) {
    if (_uiSystemLock.uiSystemLocked) return;

    color ??= AppColors.statusBarColor.of(themeMode ?? ThemeMode.light);

    if (locker == null) {
      _uiSystemLock.previousColor = color;
    }

    final Brightness brightness = themeMode != null
        ? (themeMode == ThemeMode.dark ? Brightness.light : Brightness.dark)
        : (color == Colors.transparent
            ? AppConstants.defaultBrightness
            : ThemeData.estimateBrightnessForColor(color));

    navigationBarColor ??= AppColors.navigationBarColor.of(themeMode ??
        (brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light));
    // //Forcing the portrait mode
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    //Setting the status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarIconBrightness: brightness,
      systemNavigationBarColor: navigationBarColor,
      systemNavigationBarIconBrightness: brightness,
      statusBarBrightness: brightness,
    ));

    if (locker != null) {
      _lockUiSystem(locker);
    }
  }

  void _lockUiSystem(Object locker) {
    if (!_uiSystemLock.uiSystemLocked) {
      _uiSystemLock.uiSystemLocked = true;
      _uiSystemLock.uiSystemLocker = locker;
    }
  }

  ///
  /// Get the `Brightness` from [themeMode]
  ///
  static Brightness getBrightnessFromThemeMode(ThemeMode? themeMode) {
    return themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light;
  }
}

class _UiSystemLock {
  bool uiSystemLocked = false;
  Object? uiSystemLocker;
  Color? previousColor;
  Brightness? previousBrightness;
}
