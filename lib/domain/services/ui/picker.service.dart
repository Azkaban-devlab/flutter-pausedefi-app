import 'dart:async';
import 'dart:io';

import 'package:app/application/localizations/locale_keys.g.dart';
import 'package:app/domain/services/ui/modal.service.dart';
import 'package:app/presentation/styles/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// [PickerService]
///
class PickerService {
  ///
  /// Build the cupertino datepicker
  ///
  static Future<DateTime?> _buildCupertinoDatePicker<T>(
    BuildContext context, {
    required DateTime selectedDate,
    bool use24HourFormat = false,
    Widget? cancelText,
    Widget? doneText,
    bool useText = false,
    CupertinoDatePickerMode? mode,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    DateTime? choosedDate;
    final Completer<DateTime?> completer = Completer<DateTime?>();

    if (!useText) {
      cancelText = const Icon(CupertinoIcons.clear_circled);
    } else {
      cancelText ??= Text(
        tr(LocaleKeys.cancel),
        style: Theme.of(context).textTheme.button!.copyWith(
              color: AppColors.errorColor,
            ),
      );
    }

    if (!useText) {
      doneText = const Icon(CupertinoIcons.check_mark_circled);
    } else {
      doneText ??= Text(
        tr(LocaleKeys.ok),
        style: Theme.of(context).textTheme.button!.copyWith(
              color: AppColors.primaryColor,
            ),
      );
    }

    final CupertinoButton cancelButton = CupertinoButton(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      onPressed: () {
        completer.complete(null);
        Navigator.of(context).pop();
      },
      child: cancelText,
    );

    final CupertinoButton doneButton = CupertinoButton(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      onPressed: () {
        completer.complete(choosedDate);
        Navigator.of(context).pop();
      },
      child: doneText,
    );

    await ModalService.showAppModalBottomSheet<dynamic>(
      context,
      builder: (BuildContext context) {
        return Container(
          color: AppColors.modalColor.ofContext(context),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.5, color: Colors.black38),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    cancelButton,
                    doneButton,
                  ],
                ),
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: mode!,
                  use24hFormat: use24HourFormat,
                  maximumDate: lastDate,
                  minimumDate: firstDate,
                  onDateTimeChanged: (DateTime picked) {
                    if (mode == CupertinoDatePickerMode.time) {
                      final DateTime now = DateTime.now();
                      choosedDate = DateTime(now.year, now.month, now.day,
                          picked.hour, picked.minute);
                    } else {
                      choosedDate = picked;
                    }
                  },
                  initialDateTime: selectedDate,
                ),
              )
            ],
          ),
        );
      },
    );
    return completer.future;
  }

  ///
  /// Build material datetime picker
  ///
  static Future<TimeOfDay?> _buildMaterialTimePicker(
    BuildContext context, {
    required TimeOfDay selectedTime,
    bool useInputMode = true,
  }) async {
    return showTimePicker(
      context: context,
      initialTime: selectedTime,
      cancelText: tr(LocaleKeys.cancel),
      confirmText: tr(LocaleKeys.confirm),
      initialEntryMode:
          useInputMode ? TimePickerEntryMode.input : TimePickerEntryMode.dial,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context),
          child: child!,
        );
      },
    );
  }

  ///
  /// Show time picker
  ///
  Future<TimeOfDay?> showAppTimePicker(
    BuildContext context, {
    TimeOfDay? selectedTime,
    DateTime? firstDate,
    DateTime? lastDate,
    bool useInputMode = true,
    bool usePlatformSpecific = true,
  }) async {
    if (Platform.isIOS && usePlatformSpecific) {
      final DateTime now = DateTime.now();
      final DateTime? dateTime = await _buildCupertinoDatePicker<DateTime>(
        context,
        selectedDate: DateTime(now.year, now.month, now.day,
            selectedTime?.hour ?? now.hour, selectedTime?.minute ?? now.minute),
        use24HourFormat: true,
        mode: CupertinoDatePickerMode.time,
      );
      return dateTime != null ? TimeOfDay.fromDateTime(dateTime) : null;
    } else {
      return _buildMaterialTimePicker(
        context,
        selectedTime: selectedTime ?? TimeOfDay.now(),
        useInputMode: useInputMode,
      );
    }
  }

  ///
  /// Show iOS datetime picker
  ///
  Future<DateTime?> showiOSDateTimePicker<T>(
    BuildContext context, {
    DateTime? selectedDate,
    bool use24HourFormat = true,
    Widget? cancelText,
    Widget? doneText,
    DateTime? firstDate,
    DateTime? lastDate,
    CupertinoDatePickerMode mode = CupertinoDatePickerMode.dateAndTime,
    bool useText = false,
  }) async {
    return _buildCupertinoDatePicker<T>(
      context,
      selectedDate: selectedDate ?? DateTime.now(),
      use24HourFormat: use24HourFormat,
      firstDate: firstDate,
      lastDate: lastDate,
      useText: useText,
      mode: mode,
    );
  }

  ///
  /// Show Android datetime picker
  ///
  Future<DateTime?> showAndroidDatePicker<T>(
    BuildContext context, {
    DateTime? selectedDate,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
    DatePickerMode initialDatePickerMode = DatePickerMode.day,
    DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
  }) async {
    return showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      cancelText: tr(LocaleKeys.cancel),
      confirmText: tr(LocaleKeys.confirm),
      currentDate: selectedDate,
      initialDatePickerMode: initialDatePickerMode,
      initialEntryMode: initialEntryMode,
    );
  }

  ///
  /// Show date picker
  ///
  Future<DateTime?> showAppDatePicker<T>(
    BuildContext context, {
    DateTime? selectedDate,
    bool use24HourFormat = true,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
    bool useTextOnIOS = false,
    bool onlyDate = false,
    DatePickerMode initialDatePickerMode = DatePickerMode.day,
    DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
  }) async {
    if (Platform.isIOS) {
      return showiOSDateTimePicker(
        context,
        firstDate: firstDate,
        lastDate: lastDate,
        mode: CupertinoDatePickerMode.date,
        selectedDate: selectedDate,
        use24HourFormat: use24HourFormat,
        useText: useTextOnIOS,
      );
    }
    return showAndroidDatePicker(
      context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      selectedDate: selectedDate,
      initialDatePickerMode: initialDatePickerMode,
      initialEntryMode: initialEntryMode,
    );
  }

  ///
  /// Show datetime picker
  ///
  Future<DateTime?> showAppDateTimePicker<T>(
    BuildContext context, {
    DateTime? selectedDate,
    bool use24HourFormat = true,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
    bool useTextOnIOS = false,
    bool onlyDate = false,
    DatePickerMode initialDatePickerMode = DatePickerMode.day,
    DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
  }) async {
    if (Platform.isIOS) {
      return showiOSDateTimePicker(
        context,
        firstDate: firstDate,
        lastDate: lastDate,
        mode: CupertinoDatePickerMode.dateAndTime,
        selectedDate: selectedDate,
        use24HourFormat: use24HourFormat,
        useText: useTextOnIOS,
      );
    }
    final DateTime? date = await showAndroidDatePicker(
      context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      selectedDate: selectedDate,
      initialDatePickerMode: initialDatePickerMode,
      initialEntryMode: initialEntryMode,
    );
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initialDate),
      cancelText: tr(LocaleKeys.cancel),
      confirmText: tr(LocaleKeys.confirm),
      initialEntryMode: initialEntryMode == DatePickerEntryMode.input ||
              initialEntryMode == DatePickerEntryMode.inputOnly
          ? TimePickerEntryMode.input
          : TimePickerEntryMode.dial,
    );

    return date != null && time != null
        ? DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          )
        : null;
  }
}
