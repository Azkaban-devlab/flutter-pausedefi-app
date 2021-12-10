import 'package:app/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

const double _kPreviousPageVisibleOffset = 10;
const BoxShadow _kDefaultBoxShadow =
    BoxShadow(blurRadius: 10, color: Colors.black12, spreadRadius: 5);

/// [CupertinoBottomSheetContainer]
///
/// Cupertino style modal container
/// with little bar at the top to drag down
/// the modal
class CupertinoBottomSheetContainer extends StatelessWidget {
  /// child
  final Widget child;

  /// top radius left and right
  final Radius topRadius;

  /// modal shadow
  final BoxShadow? shadow;

  /// Color of the bar to drag down
  final Color? trackColor;

  /// constructor
  const CupertinoBottomSheetContainer({
    Key? key,
    required this.child,
    required this.topRadius,
    this.trackColor,
    this.shadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double topSafeAreaPadding = MediaQuery.of(context).padding.top;
    final double topPadding = _kPreviousPageVisibleOffset + topSafeAreaPadding;

    final BoxShadow _shadow = shadow ?? _kDefaultBoxShadow;
    final Color _backgroundColor = Theme.of(context).colorScheme.surface;
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: topRadius),
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: _backgroundColor, boxShadow: <BoxShadow>[_shadow]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: SizedBox(
                  height: 5,
                  width: 44,
                  child: Material(
                    color: trackColor ?? AppColors.trackColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: SizedBox(
                  width: double.infinity,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true, //Remove top Safe Area
                    child: child,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
