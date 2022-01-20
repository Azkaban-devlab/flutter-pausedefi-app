import 'package:app/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs
class TextStyles {
  static TextStyle headline1Style(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 40,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
      color: AppColors.headingColor.ofBrightness(
          brightness ?? MediaQuery.platformBrightnessOf(context!)),
    );
  }

  static TextStyle headline2Style(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 38,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
      color: AppColors.headingColor.ofBrightness(
          brightness ?? MediaQuery.platformBrightnessOf(context!)),
    );
  }

  static TextStyle headline3Style(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 32,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
      color: AppColors.headingColor.ofBrightness(
          brightness ?? MediaQuery.platformBrightnessOf(context!)),
    );
  }

  static TextStyle headline4Style(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 24,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
      color: AppColors.headingColor.ofBrightness(
          brightness ?? MediaQuery.platformBrightnessOf(context!)),
    );
  }

  static TextStyle headline5Style(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 20,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
      color: AppColors.headingColor.ofBrightness(
          brightness ?? MediaQuery.platformBrightnessOf(context!)),
    );
  }

  static TextStyle headline6Style(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
      color: AppColors.headingColor.ofBrightness(
          brightness ?? MediaQuery.platformBrightnessOf(context!)),
    );
  }

  static TextStyle subtitle1Style(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
      color: AppColors.subtitleColor.ofBrightness(
          brightness ?? MediaQuery.platformBrightnessOf(context!)),
    );
  }

  static TextStyle subtitle2Style(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: AppColors.subtitleColor.ofBrightness(
          brightness ?? MediaQuery.platformBrightnessOf(context!)),
    );
  }

  static TextStyle bodyText1Style(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: AppColors.textColor.ofBrightness(
          brightness ?? MediaQuery.platformBrightnessOf(context!)),
    );
  }

  static TextStyle bodyText2Style(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 12,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
      color: AppColors.textColor.ofBrightness(
          brightness ?? MediaQuery.platformBrightnessOf(context!)),
    );
  }

  static TextStyle buttonStyle(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: AppColors.textColor.ofBrightness(
          brightness ?? MediaQuery.platformBrightnessOf(context!)),
    );
  }

  static TextStyle captionStyle(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 12,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: AppColors.textColor.ofBrightness(
          brightness ?? MediaQuery.platformBrightnessOf(context!)),
    );
  }

  static TextStyle overlineStyle(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      color: AppColors.textColor.ofBrightness(
          brightness ?? MediaQuery.platformBrightnessOf(context!)),
    );
  }

  static TextStyle hintStyle({BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      color: AppColors.hintColor.ofBrightness(
          brightness ?? MediaQuery.platformBrightnessOf(context!)),
    );
  }

  static TextStyle labelStyle({BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      color: AppColors.labelColor.ofBrightness(
          brightness ?? MediaQuery.platformBrightnessOf(context!)),
    );
  }

  static TextStyle helperStyle(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      color: AppColors.textColor.ofBrightness(
          brightness ?? MediaQuery.platformBrightnessOf(context!)),
    );
  }

  static TextStyle appBarTitleStyle(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return TextStyle(
      fontFamily: 'Righteous',
      fontSize: 16,
      letterSpacing: 0,
      color: AppColors.onAppBarColor.ofBrightness(
          brightness ?? MediaQuery.platformBrightnessOf(context!)),
    );
  }

  static TextStyle expandedAppBarTitleStyle(
      {BuildContext? context, Brightness? brightness}) {
    assert(context != null || brightness != null);
    return appBarTitleStyle(
      brightness: brightness,
      context: context,
    ).copyWith(fontSize: 48);
  }
}
