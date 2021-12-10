import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs
/// Contains useful consts to reduce boilerplate and duplicate code
class Spacing {
  static const double verticalSmallSpace = 8.0;
  static const double verticalNormalSpace = 16.0;
  static const double verticalLargeSpace = 24.0;
  static const double verticalXLargeSpace = 48.0;

  static const double horizontalSmallSpace = 8.0;
  static const double horizontalNormalSpace = 16.0;
  static const double horizontalLargeSpace = 24.0;
  static const double horizontalXLargeSpace = 48.0;

  static const Widget verticalSmallSpacer =
      SizedBox(height: verticalSmallSpace);
  static const Widget verticalNormalSpacer =
      SizedBox(height: verticalNormalSpace);
  static const Widget verticalLargeSpacer =
      SizedBox(height: verticalLargeSpace);
  static const Widget verticalXLargeSpacer =
      SizedBox(height: verticalXLargeSpace);

  static const Widget horizontalSmallSpacer =
      SizedBox(width: horizontalSmallSpace);
  static const Widget horizontalNormalSpacer =
      SizedBox(width: horizontalNormalSpace);
  static const Widget horizontalLargeSpacer =
      SizedBox(width: horizontalLargeSpace);
  static const Widget horizontalXLargeSpacer =
      SizedBox(width: horizontalXLargeSpace);

  static const Widget squareSmallSpacer = SizedBox(
    width: horizontalSmallSpace,
    height: verticalSmallSpace,
  );
  static const Widget squareNormalSpacer = SizedBox(
    width: horizontalNormalSpace,
    height: verticalNormalSpace,
  );
  static const Widget squareLargeSpacer = SizedBox(
    width: horizontalLargeSpace,
    height: verticalLargeSpace,
  );
  static const Widget squareXLargeSpacer = SizedBox(
    width: horizontalXLargeSpace,
    height: verticalXLargeSpace,
  );

  // Paddings/Margins
  static const EdgeInsets dialogMargin =
      EdgeInsets.symmetric(horizontal: 40, vertical: 24);
  static const EdgeInsets dialogPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 24);

  static const EdgeInsets textfieldUnderlineContentPadding = EdgeInsets.all(16);
  static const EdgeInsets textfieldOutlineContentPadding = EdgeInsets.all(16);

  static const EdgeInsets cardPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 16);
}
