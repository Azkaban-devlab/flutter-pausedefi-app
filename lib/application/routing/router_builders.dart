import 'package:app/presentation/styles/borders.dart';
import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/styles/constants.dart';
import 'package:app/presentation/styles/spacings.dart';
import 'package:app/presentation/views/widgets/utilities/modals/bottom_sheet_with_input.dart';
import 'package:app/presentation/views/widgets/utilities/modals/cupertino_bottom_sheet_container.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

///
/// [RouterBuilders] List all custom page transitions
///
class RouterBuilders {
  /// Route builder to open modal page/screen
  /// like in cupertino design
  static Route<T> cupertinoModalSheetStyleBuilder<T>(
      BuildContext context, Widget child, CustomPage<T> page) {
    return CupertinoModalBottomSheetRoute<T>(
      bounce: true,
      containerBuilder:
          (BuildContext context, Animation<double> animation, Widget child) =>
              CupertinoBottomSheetContainer(
        child: child,
        topRadius: const Radius.circular(12),
      ),
      isDismissible: true,
      settings: page,
      closeProgressThreshold: 0.6,
      builder: (BuildContext context) => BottomSheetWithInput(
        child: child,
      ),
      expanded: false,
    );
  }

  /// Route builder to open modal page/screen
  /// like in cupertino design
  static Route<T> materialModalSheetStyleBuilder<T>(
      BuildContext context, Widget child, CustomPage<T> page) {
    return MaterialWithModalsPageRoute<T>(
      settings: page,
      builder: (BuildContext context) => BottomSheetWithInput(
        child: child,
      ),
      fullscreenDialog: page.fullscreenDialog,
      maintainState: page.maintainState,
    );
  }

  /// Route builder to open modal page/screen
  /// like in cupertino design
  static Route<T> dialogStyleBuilder<T>(
      BuildContext context, Widget child, CustomPage<T> page) {
    return DialogRoute<T>(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: child,
        backgroundColor: AppColors.dialogColor.ofContext(context),
        shape: Borders.dialogShape(context: context),
        elevation: AppConstants.dialogElevation,
        insetPadding: Spacing.dialogMargin,
      ),
      barrierColor: AppColors.barrierColor,
      settings: page,
      barrierDismissible: page.barrierDismissible,
      barrierLabel: page.barrierLabel,
    );
  }
}
