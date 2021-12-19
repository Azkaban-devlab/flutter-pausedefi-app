import 'package:app/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  /// label
  final String label;

  /// OnPressed Callback
  final VoidCallback onPressed;

  /// isOutlined
  final bool isOutlined;

  const Button(this.label, this.onPressed, {this.isOutlined = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: double.infinity,
        child: isOutlined
            ? OutlinedButton(
                style: OutlinedButton.styleFrom(
                    primary: AppColors.primaryColor,
                    side: const BorderSide(
                        color: AppColors.primaryColor, width: 2),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                onPressed: onPressed,
                child: Center(
                    child: Text(
                  label.toUpperCase(),
                  style: const TextStyle(color: AppColors.primaryColor),
                )))
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: AppColors.primaryColor,
                    side: const BorderSide(
                        color: AppColors.primaryColor, width: 2),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                onPressed: onPressed,
                child: Center(
                    child: Text(
                  label.toUpperCase(),
                  style: const TextStyle(color: Colors.white),
                ))));
  }
}
