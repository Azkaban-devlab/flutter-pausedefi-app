import 'package:app/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

///
/// [CircularProgress]
///
class CircularProgress extends StatelessWidget {
  /// background color
  final Color? backgroundColor;

  /// track color
  final Animation<Color>? valueColor;

  /// track width
  final double? strokeWidth;

  /// track position
  final double? value;

  ///
  /// Constructor
  ///
  const CircularProgress(
      {Key? key,
      this.value,
      this.backgroundColor,
      this.strokeWidth = 1.0,
      this.valueColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: value,
      strokeWidth: strokeWidth ?? 1.0,
      backgroundColor: backgroundColor ?? AppColors.trackBackgroundColor,
      valueColor: valueColor ??
          const AlwaysStoppedAnimation<Color>(AppColors.trackColor),
    );
  }
}
