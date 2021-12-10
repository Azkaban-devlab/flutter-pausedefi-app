import 'package:app/presentation/styles/text_styles.dart';
import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs

enum TextVariantType {
  headline1,
  headline2,
  headline3,
  headline4,
  headline5,
  headline6,
  subtitle1,
  subtitle2,
  body1,
  body2,
  caption,
  overline,
  button,
  custom,
  appBarTitle,
}

class TextVariant extends StatelessWidget {
  const TextVariant(
    this.data, {
    Key? key,
    this.variantType = TextVariantType.body2,
    this.textKey,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.style,
    this.semanticsLabel,
    this.textAlign,
    this.textDirection,
    this.textScaleFactor,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.color,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  /// text
  final String data;

  /// TextVariantType
  final TextVariantType variantType;

  /// text color
  final Color? color;

  /// font size
  final double? fontSize;

  /// font weight
  final FontWeight? fontWeight;

  ///inner text key
  final Key? textKey;

  /// max lines
  final int? maxLines;

  /// text overflow
  final TextOverflow? overflow;

  /// softwrap
  final bool? softWrap;

  /// style
  final TextStyle? style;

  /// semantics label for accessibility
  final String? semanticsLabel;

  /// text align
  final TextAlign? textAlign;

  /// text direction
  final TextDirection? textDirection;

  /// textScaleFactor
  final double? textScaleFactor;

  /// textWidthBasis
  final TextWidthBasis? textWidthBasis;

  /// textHeightBehavior
  final TextHeightBehavior? textHeightBehavior;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      key: textKey,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      style: _getTextStyle(context),
      semanticsLabel: semanticsLabel,
      textAlign: textAlign,
      textDirection: textDirection,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }

  TextStyle _getTextStyle(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle textStyle = textTheme.bodyText2!;
    switch (variantType) {
      case TextVariantType.headline1:
        textStyle = textTheme.headline1!;
        break;
      case TextVariantType.headline2:
        textStyle = textTheme.headline2!;
        break;
      case TextVariantType.headline3:
        textStyle = textTheme.headline3!;
        break;
      case TextVariantType.headline4:
        textStyle = textTheme.headline4!;
        break;
      case TextVariantType.headline5:
        textStyle = textTheme.headline5!;
        break;
      case TextVariantType.headline6:
        textStyle = textTheme.headline6!;
        break;
      case TextVariantType.subtitle1:
        textStyle = textTheme.subtitle1!;
        break;
      case TextVariantType.subtitle2:
        textStyle = textTheme.subtitle2!;
        break;
      case TextVariantType.body1:
        textStyle = textTheme.bodyText1!;
        break;
      case TextVariantType.body2:
        textStyle = textTheme.bodyText2!;
        break;
      case TextVariantType.button:
        textStyle = textTheme.button!;
        break;
      case TextVariantType.caption:
        textStyle = textTheme.caption!;
        break;
      case TextVariantType.overline:
        textStyle = textTheme.overline!;
        break;
      case TextVariantType.appBarTitle:
        textStyle = style ?? TextStyles.appBarTitleStyle(context: context);
        break;
      case TextVariantType.custom:
        textStyle = style ?? textTheme.bodyText2!;
        break;
      default:
        textStyle = textTheme.bodyText2!;
    }

    if (color != null) {
      textStyle = textStyle.copyWith(color: color);
    }

    if (fontSize != null) {
      textStyle = textStyle.copyWith(fontSize: fontSize);
    }

    if (fontWeight != null) {
      textStyle = textStyle.copyWith(fontWeight: fontWeight);
    }

    return textStyle;
  }
}
