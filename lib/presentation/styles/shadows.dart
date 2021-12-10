// ignore_for_file: public_member_api_docs

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Shadows {
  static BoxShadow modalShadow(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return const BoxShadow(
        blurRadius: 10, color: Color(0x80000000), spreadRadius: 5);
  }

  static BoxShadow dialogShadow(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return const BoxShadow(
        blurRadius: 10, color: Color(0x80000000), spreadRadius: 5);
  }
}
