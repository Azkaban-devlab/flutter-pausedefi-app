import 'dart:convert';
import 'dart:math';

import 'package:app/application/kernel/app_helpers.dart';
import 'package:app/domain/services/helpers/javascript/helper.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart' show Color, Colors;

///
/// Here you must have all helpers function
/// NOT depending of the context (BuildContext)
///
class UtilsHelper {
  ///
  /// Get random [Color]
  ///
  static Color get randomColor =>
      Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  ///
  /// Convert [hexColorStr] to `Color`
  ///
  static Color colorFromHex(String? hexColorStr,
      {String alpha = 'FF', Color defaultColor = Colors.white}) {
    if (hexColorStr == null) return defaultColor;
    String hexColor = hexColorStr;
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = alpha + hexColor;
    }

    return Color(int.parse(hexColor, radix: 16));
  }

  ///
  /// Get web page url
  ///
  static String? getPageUrlPath() {
    return getUrlPath();
  }

  ///
  /// Hash string using sha256 algo
  ///
  static String hashString(String str) {
    final List<int> bytes = utf8.encode(str);
    return sha256.convert(bytes).toString();
  }

  ///
  /// Join array
  ///
  static String joinArray(List<dynamic> array, {String glue = ' '}) {
    return array
        .where((dynamic element) =>
            element != null && element.toString().isNotEmpty)
        .join(glue);
  }

  ///
  /// Update web page title
  ///
  static void updatePageTitle(String title) {
    updateWebTitle('$title | ${appConfig().appName!}');
  }

  ///
  /// Update web page url
  ///
  static void updatePageUrl(String path) {
    updateWebUrl(path);
  }
}
