import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/styles/text_styles.dart';
import 'package:flutter/material.dart';

import 'default_button.dart';

///
/// [SecondaryButton]
///
class SecondaryButton extends StatelessWidget {
  /// Child
  final Widget child;

  /// OnTap Callback
  final VoidCallback onTap;

  /// Constructor
  const SecondaryButton({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      child: child,
      onTap: onTap,
      backgroundColor: AppColors.secondaryButtonColor,
    );
  }
}

///
/// [SecondaryTextButton]
///
class SecondaryTextButton extends StatelessWidget {
  /// label
  final String label;

  ///Uppercase the label
  final bool? uppercase;

  /// OnTap Callback
  final VoidCallback onTap;

  /// Constructor
  const SecondaryTextButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.uppercase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultButton.text(
      label: label,
      uppercase: uppercase ?? true,
      labelStyle: TextStyles.buttonStyle(context: context)
          .copyWith(color: AppColors.onSecondaryButtonColor),
      onTap: onTap,
      backgroundColor: AppColors.secondaryButtonColor,
    );
  }
}
