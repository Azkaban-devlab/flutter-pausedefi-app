import 'dart:async';
import 'dart:io';

import 'package:app/application/localizations/locale_keys.g.dart';
import 'package:app/presentation/styles/borders.dart';
import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/styles/roundings.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:app/presentation/views/widgets/utilities/circular_progress.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///
/// [DialogAction]
///
class DialogAction<T> {
  ///
  /// label
  ///
  final String label;

  ///
  /// callback
  ///
  final T Function()? callback;

  ///
  /// isDefault
  ///
  final bool isDefault;

  ///
  /// isDestructive
  ///
  final bool isDestructive;

  ///
  /// Constructor
  ///
  DialogAction(
      {required this.label,
      this.callback,
      this.isDefault = false,
      this.isDestructive = false});

  ///
  /// Callback when action button pressed
  ///
  void onPressed(BuildContext innerContext) {
    T? result;
    if (callback != null) result = callback!();
    Navigator.pop(innerContext, result);
  }
}

///
/// [DialogService]
///
class DialogService {
  static bool _isLoadingDialogOpened = false;

  ///
  /// Close the loading dialog
  ///
  static void closeLoadingDialog(BuildContext context) {
    if (_isLoadingDialogOpened) {
      Navigator.of(context, rootNavigator: true).pop();
      _isLoadingDialogOpened = false;
    }
  }

  ///
  /// Show alert dialog
  ///
  static Future<T?> showAlert<T>(
      BuildContext context, String? title, String message,
      {List<DialogAction<dynamic>>? actions, bool dismissable = false}) {
    return showDialog<T>(
        context: context,
        barrierDismissible: dismissable || actions == null,
        builder: (BuildContext dialogContext) => !kIsWeb && Platform.isIOS
            ? _buildiOSAlertDialog(dialogContext, title, message,
                actionsList: actions)
            : _buildAndroidAlertDialog(dialogContext, title, message,
                actionsList: actions));
  }

  ///
  /// Show custom dialog
  ///
  static Future<T?> showCustomDialog<T>(
      BuildContext context, WidgetBuilder builder,
      {bool barrierDismissible = false,
      bool dismissible = true,
      BorderRadius? borderRadius,
      VoidCallback? onPop}) {
    return showDialog<T>(
        barrierColor: AppColors.barrierColor,
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              if (onPop != null) onPop();
              return dismissible;
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Material(
                  elevation: 4,
                  borderRadius: borderRadius ?? Roundings.dialogBorderRadius,
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: AppColors.dialogColor.ofContext(context),
                      borderRadius:
                          borderRadius ?? Roundings.dialogBorderRadius,
                    ),
                    child: Material(
                      color: AppColors.dialogColor.ofContext(context),
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(
                            color: AppColors.dialogTextColor.ofContext(context),
                          ),
                      child: Builder(
                        builder: builder,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        barrierDismissible: barrierDismissible);
  }

  ///
  /// Show error dialog
  ///
  static Future<T?> showError<T>(BuildContext context, String message,
      {VoidCallback? callback}) {
    return showAlert<T>(context, tr(LocaleKeys.error), message,
        actions: <DialogAction<dynamic>>[
          DialogAction<dynamic>(
              label: tr(LocaleKeys.ok), isDefault: true, callback: callback)
        ]);
  }

  ///
  /// Show info dialog
  ///
  static Future<T?> showInfo<T>(BuildContext context, String message,
      {VoidCallback? callback}) {
    return showAlert<T>(context, tr(LocaleKeys.info), message,
        actions: <DialogAction<dynamic>>[
          DialogAction<dynamic>(
              label: tr(LocaleKeys.ok), isDefault: true, callback: callback)
        ]);
  }

  ///
  /// Allow to show a indefinite circular progress dialog
  /// To close the dialog if `dismissible` is set to false (default)
  /// you must call `Navigator.of(_context).pop()`
  /// otherwise you can either call it
  /// or press Back button in Android device.
  ///
  /// It returns a StreamController<String>
  /// to update text under the circular progress widget
  ///
  static StreamController<String> showLoadingDialog(BuildContext context,
      {bool dismissible = false}) {
    if (_isLoadingDialogOpened) {
      closeLoadingDialog(context);
    }

    final StreamController<String> controller = StreamController<String>();

    _isLoadingDialogOpened = true;

    showCustomDialog<dynamic>(
        context,
        (BuildContext innerContext) {
          return Container(
            color: AppColors.dialogColor.ofContext(innerContext),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: 48,
                  height: 48,
                  child: CircularProgress(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.dialogTextColor.ofContext(innerContext)),
                  ),
                ),
                StreamBuilder<String>(
                  stream: controller.stream,
                  builder: (_, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: TextVariant(
                          snapshot.data!,
                          variantType: TextVariantType.body1,
                          color:
                              AppColors.dialogTextColor.ofContext(innerContext),
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                )
              ],
            ),
          );
        },
        dismissible: dismissible,
        onPop: () {
          _isLoadingDialogOpened = false;
        });

    return controller;
  }

  ///
  /// Show prompt dialog
  ///
  static Future<bool?> showPrompt(
      BuildContext context, String title, String message,
      {bool dismissable = false, String? cancelText, String? validText}) {
    final List<DialogAction<bool>> actions = <DialogAction<bool>>[
      DialogAction<bool>(
          label: validText ?? tr(LocaleKeys.yes),
          isDestructive: true,
          callback: () => true),
      DialogAction<bool>(
          label: cancelText ?? tr(LocaleKeys.no),
          isDefault: true,
          callback: () => false)
    ];
    return showDialog<bool>(
        context: context,
        barrierDismissible: dismissable,
        builder: (BuildContext dialogContext) => !kIsWeb && Platform.isIOS
            ? _buildiOSAlertDialog(dialogContext, title, message,
                actionsList: actions)
            : _buildAndroidAlertDialog(dialogContext, title, message,
                actionsList: actions));
  }

  ///
  /// Show success dialog
  ///
  static Future<T?> showSuccess<T>(BuildContext context, String message,
      {VoidCallback? callback}) {
    return showAlert<T>(context, tr(LocaleKeys.success), message,
        actions: <DialogAction<dynamic>>[
          DialogAction<dynamic>(
              label: tr(LocaleKeys.ok), isDefault: true, callback: callback)
        ]);
  }

  ///
  /// Show warning dialog
  ///
  static Future<T?> showWarning<T>(BuildContext context, String message,
      {VoidCallback? callback}) {
    return showAlert<T>(context, tr(LocaleKeys.warning), message,
        actions: <DialogAction<dynamic>>[
          DialogAction<dynamic>(
              label: tr(LocaleKeys.ok), isDefault: true, callback: callback)
        ]);
  }

  static Widget _buildAndroidAlertDialog(
      BuildContext context, String? title, String message,
      {List<DialogAction<dynamic>>? actionsList}) {
    final List<TextButton> actions = <TextButton>[];
    if (actionsList != null) {
      // ignore: avoid_function_literals_in_foreach_calls
      actionsList.forEach((DialogAction<dynamic> action) {
        actions.add(TextButton(
          onPressed: () => action.onPressed(context),
          child: TextVariant(
            action.label.toUpperCase(),
            color: AppColors.dialogButtonColor.ofContext(context),
            variantType: TextVariantType.button,
          ),
        ));
      });
    }

    return AlertDialog(
        title: title != null
            ? TextVariant(
                title,
                variantType: TextVariantType.headline5,
                color: AppColors.dialogTitleColor.ofContext(context),
              )
            : null,
        backgroundColor: AppColors.dialogColor.ofContext(context),
        shape: Borders.dialogShapeBorder(context: context),
        content: TextVariant(
          message,
          variantType: TextVariantType.body1,
          color: AppColors.dialogTextColor.ofContext(context),
        ),
        actions: actions);
  }

  static Widget _buildiOSAlertDialog(
      BuildContext context, String? title, String message,
      {List<DialogAction<dynamic>>? actionsList}) {
    final List<CupertinoDialogAction> actions = <CupertinoDialogAction>[];
    if (actionsList != null) {
      // ignore: avoid_function_literals_in_foreach_calls
      actionsList.forEach((DialogAction<dynamic> action) {
        actions.add(CupertinoDialogAction(
          onPressed: () => action.onPressed(context),
          isDefaultAction: action.isDefault,
          isDestructiveAction: action.isDestructive,
          child: Text(action.label),
        ));
      });
    }

    return CupertinoAlertDialog(
        title: title != null ? Text(title) : null,
        content: Text(message),
        actions: actions);
  }
}
