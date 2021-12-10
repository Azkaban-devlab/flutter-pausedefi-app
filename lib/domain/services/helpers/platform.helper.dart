import 'dart:io';

import 'package:flutter/foundation.dart';

///
/// [PlatformHelper]
///
class PlatformHelper {
  ///
  /// Check if the platform is Android
  ///
  static bool get isAndroid => !kIsWeb && Platform.isAndroid;

  ///
  /// Check if the platform is Fuchsia
  ///
  static bool get isFuchsia => !kIsWeb && Platform.isFuchsia;

  ///
  /// Check if the platform is iOS
  ///
  static bool get isIOS => !kIsWeb && Platform.isIOS;

  ///
  /// Check if the platform is Linux
  ///
  static bool get isLinux => !kIsWeb && Platform.isLinux;

  ///
  /// Check if the platform is MacOS
  ///
  static bool get isMacOS => !kIsWeb && Platform.isMacOS;

  ///
  /// Check if the platform is Web
  ///
  static bool get isWeb => !kIsWeb;

  ///
  /// Check if the platform is Windows
  ///
  static bool get isWindows => !kIsWeb && Platform.isWindows;
}
