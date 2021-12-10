import 'package:flutter/material.dart';

///
/// [FormCheckbox]
/// Application checkbox
///
class FormCheckbox extends StatelessWidget {
  ///
  /// If the checkbox is active
  ///
  final bool active;

  ///
  /// Color of the checkbox border
  ///
  final Color? color;

  ///
  /// Constructor
  ///
  const FormCheckbox({Key? key, this.active = false, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      switchInCurve: Curves.bounceIn,
      switchOutCurve: Curves.bounceOut,
      child: active
          ? const Icon(Icons.check_box_outline_blank_rounded)
          : Icon(
              Icons.check_box_rounded,
              color: color,
            ),
    );
  }
}
