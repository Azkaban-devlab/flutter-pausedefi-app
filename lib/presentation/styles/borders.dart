// ignore_for_file: public_member_api_docs

import 'package:app/presentation/styles/roundings.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'constants.dart';

class Borders {
  static const BorderStyle borderStyle = BorderStyle.solid;

  static InputBorder textfieldOutlineShapeBorder(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return OutlineInputBorder(
      borderSide: BorderSide(
          color: AppColors.buttonColor.ofBrightness(
              brightness ?? MediaQuery.platformBrightnessOf(context!)),
          width: AppConstants.inputBorderWidth),
      borderRadius: Roundings.textfieldOutlineBorderRadius,
    );
  }

  static InputBorder textfieldUnderlineShapeBorder(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return UnderlineInputBorder(
      borderSide: BorderSide(
          color: AppColors.buttonColor, width: AppConstants.inputBorderWidth),
      borderRadius: Roundings.textfieldUnderlineBorderRadius,
    );
  }

  static ShapeBorder defaultShapeBorder(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return const RoundedRectangleBorder(
      side: BorderSide(color: Colors.transparent, width: 0),
      borderRadius: Roundings.defaultBorderRadius,
    );
  }

  static ShapeBorder dialogShape(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return RoundedRectangleBorder(
      side: BorderSide(
          color: AppColors.dialogBorderColor.ofBrightness(
              brightness ?? MediaQuery.platformBrightnessOf(context!)),
          width: 0),
      borderRadius: Roundings.dialogBorderRadius,
    );
  }

  static ShapeBorder chipShapeBorder(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return RoundedRectangleBorder(
      side: BorderSide(
          color: AppColors.chipBorderColor.ofBrightness(
              brightness ?? MediaQuery.platformBrightnessOf(context!)),
          width: 0),
      borderRadius: Roundings.chipBorderRadius,
    );
  }

  static ShapeBorder fabShapeBorder(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return RoundedRectangleBorder(
      side: BorderSide(
          color: AppColors.fabBorderColor.ofBrightness(
              brightness ?? MediaQuery.platformBrightnessOf(context!)),
          width: 0),
      borderRadius: Roundings.fabBorderRadius,
    );
  }

  static ShapeBorder cardShapeBorder(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return RoundedRectangleBorder(
      side: BorderSide(
          color: AppColors.cardBorderColor.ofBrightness(
              brightness ?? MediaQuery.platformBrightnessOf(context!)),
          width: 0),
      borderRadius: Roundings.cardBorderRadius,
    );
  }

  static ShapeBorder dialogShapeBorder(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return RoundedRectangleBorder(
      side: BorderSide(
          color: AppColors.dialogBorderColor.ofBrightness(
              brightness ?? MediaQuery.platformBrightnessOf(context!)),
          width: 0),
      borderRadius: Roundings.dialogBorderRadius,
    );
  }

  static ShapeBorder drawerShapeBorder(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return RoundedRectangleBorder(
      side: BorderSide(
          color: AppColors.drawerBorderColor.ofBrightness(
              brightness ?? MediaQuery.platformBrightnessOf(context!)),
          width: 0),
      borderRadius: Roundings.drawerBorderRadius,
    );
  }

  static ShapeBorder drawerBottomShapeBorder(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return RoundedRectangleBorder(
      side: BorderSide(
          color: AppColors.drawerBottomBorderColor.ofBrightness(
              brightness ?? MediaQuery.platformBrightnessOf(context!)),
          width: 0),
      borderRadius: Roundings.drawerBottomBorderRadius,
    );
  }

  static ShapeBorder drawerRightShapeBorder(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return RoundedRectangleBorder(
      side: BorderSide(
          color: AppColors.drawerRightBorderColor.ofBrightness(
              brightness ?? MediaQuery.platformBrightnessOf(context!)),
          width: 0),
      borderRadius: Roundings.drawerRightBorderRadius,
    );
  }

  static ShapeBorder modalShapeBorder(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return RoundedRectangleBorder(
      side: BorderSide(
          color: AppColors.modalBorderColor.ofBrightness(
              brightness ?? MediaQuery.platformBrightnessOf(context!)),
          width: 0),
      borderRadius: Roundings.modalBorderRadius,
    );
  }
}
