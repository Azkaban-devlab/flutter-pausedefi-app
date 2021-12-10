import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'index.desktop.dart';
import 'index.mobile.dart';

///
/// [HomeCommonScreen]
///
class HomeScreen extends StatelessWidget {
  ///
  /// Constructor
  ///
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const HomeMobileScreen(),
      tablet: (BuildContext context) => const HomeDesktopScreen(),
    );
  }
}
