import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/styles/roundings.dart';
import 'package:flutter/material.dart';

///
/// [DefaultButton]
///
class DefaultButton extends StatelessWidget {
  /// Child
  final Widget child;

  /// OnTap Callback
  final VoidCallback onTap;

  /// Background color
  final Color? backgroundColor;

  /// Constructor
  const DefaultButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.backgroundColor,
  }) : super(key: key);

  ///
  /// Constructor for text button
  ///
  DefaultButton.text({
    Key? key,
    required String label,
    required bool uppercase,
    TextStyle? labelStyle,
    required this.onTap,
    this.backgroundColor,
  })  : child = Center(
          child: Text(
            uppercase ? label.toUpperCase() : label,
            textAlign: TextAlign.center,
            style: labelStyle,
          ),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        color: backgroundColor ?? AppColors.buttonColor,
        elevation: 0,
        borderRadius: Roundings.buttonBorderRadius,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 36),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: child,
          ),
        ),
      ),
    );
  }
}
