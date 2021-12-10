import 'package:app/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

///
/// [PageLoader]
///
class PageLoader extends StatelessWidget {
  ///
  /// Constructor
  ///
  const PageLoader({Key? key, this.height, this.width}) : super(key: key);

  /// height
  final double? height;

  /// width
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? MediaQuery.of(context).size.height,
        width: width ?? MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            SizedBox(
                width: 32.0,
                height: 32.0,
                child: CircularProgressIndicator(
                  strokeWidth: 1.0,
                  backgroundColor: AppColors.trackBackgroundColor,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(AppColors.trackColor),
                ))
          ],
        ));
  }
}
