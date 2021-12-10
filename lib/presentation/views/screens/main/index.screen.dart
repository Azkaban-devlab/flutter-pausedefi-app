import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

///
/// [MainScreen]
///
class MainScreen extends StatelessWidget {
  ///
  /// Constructor
  ///
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoRouter(
      builder: (BuildContext context, Widget content) => content,
    );
  }
}
