// ignore_for_file: public_member_api_docs

import 'package:app/presentation/styles/borders.dart';
import 'package:app/presentation/styles/spacings.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    this.child,
  }) : super(key: key);

  /// child
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      shape: Borders.cardShapeBorder(context: context),
      child: Padding(
        padding: Spacing.cardPadding,
        child: child,
      ),
    );
  }
}
