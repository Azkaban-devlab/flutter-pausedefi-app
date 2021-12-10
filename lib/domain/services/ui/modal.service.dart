import 'dart:async';

import 'package:app/presentation/styles/borders.dart';
import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/styles/constants.dart';
import 'package:app/presentation/styles/roundings.dart';
import 'package:app/presentation/styles/shadows.dart';
import 'package:app/presentation/views/widgets/utilities/modals/bottom_sheet_with_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

///
/// [ModalService]
///
class ModalService {
  ///
  /// Show app modal bottomsheet
  ///
  static Future<T?> showAppModalBottomSheet<T>(
    BuildContext context, {
    required WidgetBuilder builder,
    ShapeBorder? shape,
    bool isDismissible = true,
    bool expand = true,
    bool hasInnerInput = false,
  }) {
    return showAppMaterialModalBottomSheet<T>(
      context,
      isDismissible: isDismissible,
      expand: expand,
      elevation: AppConstants.modalElevation,
      barrierColor: AppColors.barrierColor,
      enableDrag: true,
      backgroundColor: AppColors.modalColor.ofContext(context),
      shape: shape ?? Borders.modalShapeBorder(context: context),
      builder: !hasInnerInput
          ? builder
          : (BuildContext context) {
              return BottomSheetWithInput(
                child: builder(context),
              );
            },
    );
  }

  ///
  /// Show android/material modal bottomsheet
  ///
  static Future<T?> showAppMaterialModalBottomSheet<T>(
    BuildContext context, {
    required WidgetBuilder builder,
    bool? isScrollControlled,
    ShapeBorder? shape,
    bool isDismissible = true,
    bool expand = true,
    double? elevation,
    Color? barrierColor,
    bool enableDrag = true,
    Color? backgroundColor,
  }) {
    return showMaterialModalBottomSheet<T>(
      isDismissible: isDismissible,
      expand: expand,
      context: context,
      elevation: elevation,
      barrierColor: barrierColor,
      enableDrag: enableDrag,
      backgroundColor: backgroundColor,
      shape: shape,
      bounce: true,
      builder: builder,
    );
  }

  ///
  /// Show ios/cupertino modal bottomsheet
  ///
  static Future<T?> showAppCupertinoModalBottomSheet<T>(
    BuildContext context, {
    required WidgetBuilder builder,
    bool? isScrollControlled,
    ShapeBorder? shape,
    bool isDismissible = true,
    bool expand = true,
    double? elevation,
    Color? barrierColor,
    bool enableDrag = true,
    Color? backgroundColor,
    Radius? topRadius,
    BoxShadow? shadow,
  }) {
    return showCupertinoModalBottomSheet<T>(
      isDismissible: isDismissible,
      shadow: shadow ?? Shadows.modalShadow(context: context),
      topRadius: topRadius ?? Roundings.modalBorderRadius.topLeft,
      expand: expand,
      context: context,
      elevation: elevation,
      barrierColor: barrierColor,
      enableDrag: enableDrag,
      backgroundColor: backgroundColor,
      shape: shape,
      bounce: true,
      builder: builder,
    );
  }
}
