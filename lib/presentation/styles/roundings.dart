// ignore_for_file: public_member_api_docs

import 'package:flutter/widgets.dart';

/// [Roundings]
class Roundings {
  // Radius
  static const Radius defaultRadius = Radius.circular(4);
  static const Radius buttonRadius = Radius.circular(20);
  static const Radius modalRadius = Radius.circular(24);
  static const Radius dialogRadius = Radius.circular(4);
  static const Radius textfieldOutlineInputRadius = Radius.circular(0);
  static const Radius textfieldUnderlineInputRadius = Radius.circular(0);

  // BorderRadius
  static const BorderRadius defaultBorderRadius =
      BorderRadius.all(defaultRadius);
  static const BorderRadius buttonBorderRadius = BorderRadius.all(buttonRadius);
  static const BorderRadius chipBorderRadius = BorderRadius.all(defaultRadius);
  static const BorderRadius fabBorderRadius = BorderRadius.all(defaultRadius);
  static const BorderRadius cardBorderRadius = BorderRadius.all(defaultRadius);

  static const BorderRadius drawerBorderRadius = BorderRadius.all(Radius.zero);
  static const BorderRadius drawerRightBorderRadius =
      BorderRadius.all(Radius.zero);
  static const BorderRadius drawerBottomBorderRadius =
      BorderRadius.all(Radius.zero);

  static const BorderRadius modalBorderRadius = BorderRadius.all(modalRadius);
  static const BorderRadius dialogBorderRadius = BorderRadius.all(dialogRadius);

  static const BorderRadius textfieldOutlineBorderRadius =
      BorderRadius.all(textfieldOutlineInputRadius);
  static const BorderRadius textfieldUnderlineBorderRadius =
      BorderRadius.all(textfieldUnderlineInputRadius);
}
