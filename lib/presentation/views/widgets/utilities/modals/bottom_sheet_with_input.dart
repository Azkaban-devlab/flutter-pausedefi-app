// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class BottomSheetWithInput extends StatelessWidget {
  const BottomSheetWithInput({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 250),
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: child,
    );
  }
}
