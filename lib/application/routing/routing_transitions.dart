import 'package:flutter/widgets.dart';

///
/// [RoutingTransitions] List all custom page transitions
///
class RoutingTransitions {
  ///
  /// Create the transition for modal page
  ///
  static Widget modalTransitionBuilder(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    const Offset begin = Offset(0.0, 1.0);
    const Offset end = Offset.zero;
    const Cubic curve = Curves.easeIn;

    final Tween<Offset> tween = Tween<Offset>(begin: begin, end: end);
    final CurvedAnimation curvedAnimation = CurvedAnimation(
        parent: animation, curve: curve, reverseCurve: Curves.easeOut);
    return SlideTransition(
      position: tween.animate(curvedAnimation),
      child: child,
    );
  }

  ///
  /// Create a fade transition
  ///
  static Widget fadeTransitionBuilder(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    const double begin = 0.0;
    const double end = 1.0;
    const Cubic curve = Curves.easeInExpo;

    final Tween<double> tween = Tween<double>(begin: begin, end: end);
    final CurvedAnimation curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
      reverseCurve: Curves.easeOutExpo,
    );
    return FadeTransition(
      opacity: tween.animate(curvedAnimation),
      child: child,
    );
  }
}
