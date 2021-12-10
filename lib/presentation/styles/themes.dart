import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/styles/constants.dart';
import 'package:app/presentation/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore_for_file: public_member_api_docs

ThemeData buildTheme({ThemeMode? themeMode = ThemeMode.light}) {
  return themeMode == ThemeMode.light ? buildLightTheme() : buildDarkTheme();
}

TextTheme buildTextTheme(ThemeMode themeMode, TextTheme baseTheme) {
  final Brightness brightness =
      themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light;
  return baseTheme.copyWith(
    headline1: baseTheme.headline1!.merge(
      TextStyles.headline1Style(
        brightness: brightness,
      ),
    ),
    headline2: baseTheme.headline2!.merge(
      TextStyles.headline2Style(
        brightness: brightness,
      ),
    ),
    headline3: baseTheme.headline3!.merge(
      TextStyles.headline3Style(
        brightness: brightness,
      ),
    ),
    headline4: baseTheme.headline4!.merge(
      TextStyles.headline4Style(
        brightness: brightness,
      ),
    ),
    headline5: baseTheme.headline5!.merge(
      TextStyles.headline5Style(
        brightness: brightness,
      ),
    ),
    headline6: baseTheme.headline6!.merge(
      TextStyles.headline6Style(
        brightness: brightness,
      ),
    ),
    subtitle1: baseTheme.subtitle1!.merge(
      TextStyles.subtitle1Style(
        brightness: brightness,
      ),
    ),
    subtitle2: baseTheme.subtitle2!.merge(
      TextStyles.subtitle2Style(
        brightness: brightness,
      ),
    ),
    bodyText1: baseTheme.bodyText1!.merge(
      TextStyles.bodyText1Style(
        brightness: brightness,
      ),
    ),
    bodyText2: baseTheme.bodyText2!.merge(
      TextStyles.bodyText2Style(
        brightness: brightness,
      ),
    ),
    button: baseTheme.button!.merge(
      TextStyles.buttonStyle(
        brightness: brightness,
      ),
    ),
    caption: baseTheme.caption!.merge(
      TextStyles.captionStyle(
        brightness: brightness,
      ),
    ),
    overline: baseTheme.overline!.merge(
      TextStyles.overlineStyle(
        brightness: brightness,
      ),
    ),
  );
}

ThemeData _buildBaseTheme({ThemeMode themeMode = ThemeMode.system}) {
  final ThemeData baseTheme = themeMode == ThemeMode.system
      ? ThemeData.fallback()
      : (themeMode == ThemeMode.light ? ThemeData.light() : ThemeData.dark());

  final bool isDark = themeMode == ThemeMode.dark;
  final TextTheme textTheme = buildTextTheme(
    themeMode,
    baseTheme.textTheme,
  );
  final Brightness brightness = isDark ? Brightness.dark : Brightness.light;

  return baseTheme.copyWith(
    colorScheme: baseTheme.colorScheme.copyWith(
      background: AppColors.backgroundColor.of(themeMode),
      brightness: brightness,
      error: AppColors.errorColor,
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      primaryVariant: AppColors.primaryVariantColor,
      secondaryVariant: AppColors.secondaryVariantColor,
      surface: AppColors.surfaceColor.of(themeMode),
      onBackground: AppColors.onBackgroundColor.of(themeMode),
      onError: AppColors.onErrorColor,
      onPrimary: AppColors.onPrimaryColor,
      onSecondary: AppColors.onSecondaryColor,
      onSurface: AppColors.onSurfaceColor.of(themeMode),
    ),
    backgroundColor: AppColors.backgroundColor.of(themeMode),
    brightness: isDark ? Brightness.dark : Brightness.light,
    secondaryHeaderColor: AppColors.secondaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor.of(themeMode),
    primaryColor: AppColors.primaryColor,
    toggleableActiveColor: AppColors.primaryColor,
    sliderTheme:
        baseTheme.sliderTheme.copyWith(activeTrackColor: AppColors.trackColor),
    appBarTheme: baseTheme.appBarTheme.copyWith(
      brightness: isDark ? Brightness.dark : Brightness.light,
      elevation: 0.5,
      textTheme: textTheme,
      iconTheme: baseTheme.iconTheme
          .copyWith(color: AppColors.onAppBarColor.of(themeMode)),
      color: AppColors.appBarColor.of(themeMode),
      titleTextStyle: TextStyles.appBarTitleStyle(
        brightness: brightness,
      ),
    ),
    floatingActionButtonTheme: baseTheme.floatingActionButtonTheme.copyWith(
      backgroundColor: AppColors.primaryButtonColor,
    ),
    bottomNavigationBarTheme: baseTheme.bottomNavigationBarTheme.copyWith(
      backgroundColor: AppColors.bottomNavigationBarColor.of(themeMode),
      selectedItemColor:
          AppColors.bottomNavigationBarSelectedItemColor.of(themeMode),
      unselectedItemColor:
          AppColors.bottomNavigationBarUnselectedItemColor.of(themeMode),
      unselectedLabelStyle: textTheme.button?.copyWith(
        color: AppColors.bottomNavigationBarSelectedItemColor.of(themeMode),
      ),
      selectedLabelStyle: textTheme.button?.copyWith(
        color: AppColors.bottomNavigationBarUnselectedItemColor.of(themeMode),
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      elevation: 1,
      type: BottomNavigationBarType.fixed,
    ),
    iconTheme: baseTheme.iconTheme.copyWith(
        size: AppConstants.iconSize, color: AppColors.iconColor.of(themeMode)),
    bottomSheetTheme: baseTheme.bottomSheetTheme
        .copyWith(backgroundColor: Colors.transparent, elevation: 4.0),
    textTheme: textTheme,
  );
}

ThemeData buildLightTheme() {
  final ThemeData baseTheme = _buildBaseTheme(themeMode: ThemeMode.light);

  return baseTheme;
}

ThemeData buildDarkTheme() {
  final ThemeData baseTheme = _buildBaseTheme(themeMode: ThemeMode.dark);

  return baseTheme;
}
