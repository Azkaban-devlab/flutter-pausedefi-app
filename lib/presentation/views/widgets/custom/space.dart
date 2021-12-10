import 'package:app/presentation/styles/constants.dart';
import 'package:app/presentation/styles/spacings.dart';
import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs

enum SpaceType {
  /// [AppConstants.spacingSmall]
  small,

  /// [AppConstants.spacing]
  normal,

  /// [AppConstants.spacingLarge]
  large,

  /// [AppConstants.spacingXLarge]
  xLarge,
}

enum SpaceDirection {
  vertical,
  horizontal,
  all,
}

class Space extends StatelessWidget {
  const Space({
    Key? key,
    this.direction = SpaceDirection.all,
    this.space,
    this.type,
    this.child,
  }) : super(key: key);

  /// child
  final Widget? child;

  /// direction
  final SpaceDirection direction;

  /// Space type
  final SpaceType? type;

  /// space
  final double? space;

  @override
  Widget build(BuildContext context) {
    final double spacing = _getSpace();
    return SizedBox(
      height: direction == SpaceDirection.horizontal ||
              SpaceDirection.all == direction
          ? spacing
          : null,
      width: direction == SpaceDirection.vertical ||
              SpaceDirection.all == direction
          ? spacing
          : null,
      child: child,
    );
  }

  double _getSpace() {
    if (space != null) {
      return space!;
    }

    switch (type) {
      case SpaceType.xLarge:
        return Spacing.horizontalXLargeSpace;
      case SpaceType.large:
        return Spacing.horizontalLargeSpace;
      case SpaceType.small:
        return Spacing.horizontalSmallSpace;
      default:
        return Spacing.horizontalLargeSpace;
    }
  }
}
