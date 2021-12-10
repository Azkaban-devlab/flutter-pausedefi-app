import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/styles/constants.dart';
import 'package:app/presentation/styles/spacings.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:flutter/material.dart';

/// You can use [IconText] like this:
///
/// ```
/// var iconText = IconText(
///                 iconData: Icons.heart,
///                 textString: "Heart",
///                 textStyle: TextStyle(color: Colors.red));
/// var iconText2 = IconText(iconData: Icons.heart, iconColor: Colors.red);
/// var iconText3 = IconText(icon: Icon(Icons.heart), text: Text("Heart"));
/// ```
///
/// Throws an [AssertionError] if there is neither option [iconData]
/// nor option [icon]
class IconText extends StatelessWidget {
  ///
  /// Constructor
  ///
  const IconText(
      {Key? key,
      this.iconData,
      this.iconColor,
      this.iconSize = AppConstants.iconSize,
      this.textString,
      this.textStyle,
      this.textPadding = Spacing.horizontalSmallSpace,
      this.icon,
      this.text,
      this.iconFirst = false,
      this.isVertical = false,
      this.full = false,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.crossAxisAlignment = CrossAxisAlignment.center})
      : assert(iconData != null ||
            icon != null ||
            textString != null ||
            text != null),
        super(key: key);

  /// IconData
  final IconData? iconData;

  /// color of the icon
  final Color? iconColor;

  /// Size of the icon
  final double iconSize;

  /// text aside the icon
  final String? textString;

  /// Style of the text
  final TextStyle? textStyle;

  /// Space around the text
  final double textPadding;

  /// text as Widget
  final Widget? text;

  /// icon as Widget
  final Widget? icon;

  /// render the icon before the text
  final bool iconFirst;

  /// render vertically
  final bool isVertical;

  /// mainAxisAlignment
  final MainAxisAlignment mainAxisAlignment;

  /// crossAxisAlignment
  final CrossAxisAlignment crossAxisAlignment;

  /// fill the space
  final bool full;

  @override
  Widget build(BuildContext context) {
    return isVertical
        ? Column(
            // If renderVertically then use Column to render vertically
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            mainAxisSize: full ? MainAxisSize.max : MainAxisSize.min,
            children: _getChildren(),
          )
        : Row(
            // otherwise use Row
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            mainAxisSize: full ? MainAxisSize.max : MainAxisSize.min,
            children: _getChildren(),
          );
  }

  /// Get the widgets
  /// Icon will always be present
  /// add Text if present
  List<Widget> _getChildren() {
    final List<Widget> children = <Widget>[];

    if (iconFirst) {
      // add Icon to the children first than text content
      if (icon is Icon || icon is Image || iconData != null) {
        children.add(_getIconContent());
      }
      if (text != null || textString != null) {
        children.add(_getTextContent());
      }
    } else {
      // add text content first then icon content
      if (text != null || textString != null) {
        children.add(_getTextContent());
      }
      if (icon is Icon || icon is Image || iconData != null) {
        children.add(_getIconContent());
      }
    }

    return children;
  }

  /// Get the Icon widget
  Widget _getIconContent() {
    if (icon is Icon || icon is Image) {
      return icon!;
    }

    return Icon(
      iconData,
      color: iconColor ??
          (textStyle != null ? textStyle!.color : AppColors.iconColor),
      size: iconSize,
    );
  }

  /// Get the text content
  /// Wrap it in Padding widget
  /// to put space between this widget
  /// and the icon
  Widget _getTextContent() {
    Widget? _text;
    if (text is Text || text is RichText || text is TextVariant) {
      _text = text;
    } else {
      _text = Text(
        textString ?? '',
        style: textStyle,
        textAlign: mainAxisAlignment == MainAxisAlignment.center
            ? TextAlign.center
            : TextAlign.start,
      );
    }

    return Flexible(
      child: Padding(
        padding: icon is Icon || icon is Image
            ? _getTextEdgeInsets()
            : const EdgeInsets.all(0.0),
        child: _text,
      ),
    );
  }

  /// Get the correct EdgeInsets
  /// depending on the icon position
  /// and the direction
  EdgeInsets _getTextEdgeInsets() {
    if (iconFirst) {
      return isVertical
          ? EdgeInsets.only(top: textPadding)
          : EdgeInsets.only(left: textPadding);
    } else {
      return isVertical
          ? EdgeInsets.only(bottom: textPadding)
          : EdgeInsets.only(right: textPadding);
    }
  }
}
