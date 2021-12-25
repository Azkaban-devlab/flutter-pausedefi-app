import 'dart:ui';

import 'package:app/presentation/styles/borders.dart';
import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/styles/constants.dart';
import 'package:app/presentation/styles/spacings.dart';
import 'package:app/presentation/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore_for_file: public_member_api_docs

/// Border type of [FormInput]
enum FormInputBorderType {
  /// line on all borders
  outline,

  /// line on bottom border
  underline
}

///
/// [FormInput]
///
class FormInput extends StatelessWidget {
  ///
  /// Constructor
  ///
  const FormInput({
    Key? key,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.borderType = FormInputBorderType.underline,
    this.validator,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
    this.textAlign = TextAlign.start,
    this.textInputAction,
    this.enabled = true,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.readOnly = false,
    this.autoCorrect = false,
    this.helperText,
    this.prefixIcon,
    this.prefixText,
    this.suffixIcon,
    this.suffixText,
    this.prefixStyle,
    this.suffixStyle,
    this.onTap,
    this.focusNode,
    this.isDense = true,
    this.autofillHints,
    this.fillColor,
    this.inputFormatters,
    this.hintStyle,
    this.labelStyle,
    this.autofocus = false,
    this.style,
    this.inputBorder,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  /// initialValue
  final String? initialValue;

  /// hintText
  final String? hintText;

  /// labelText
  final String? labelText;

  /// borderType
  final FormInputBorderType borderType;

  /// validator
  final String? Function(String?)? validator;

  /// controller
  final TextEditingController? controller;

  /// onChanged
  final ValueChanged? onChanged;

  /// keyboardType
  final TextInputType? keyboardType;

  /// readOnly
  final bool readOnly;
  final int? maxLength;
  final int maxLines;
  final int minLines;
  final bool enabled;
  final bool autoCorrect;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final bool obscureText;
  final String? helperText;
  final Widget? prefixIcon;
  final String? prefixText;
  final Widget? suffixIcon;
  final String? suffixText;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final TextCapitalization textCapitalization;
  final TextStyle? prefixStyle;
  final TextStyle? suffixStyle;
  final Iterable<String>? autofillHints;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final bool isDense;
  final TextStyle? style;
  final bool autofocus;
  final InputBorder? inputBorder;

  @override
  Widget build(BuildContext context) {
    final TextStyle styleOfLabel =
        labelStyle ?? TextStyles.labelStyle(context: context);
    final TextStyle styleOfHint =
        labelStyle ?? TextStyles.hintStyle(context: context);
    final TextStyle styleOfHelper =
        labelStyle ?? TextStyles.helperStyle(context: context);
    final Color bgColor = fillColor ??
        (borderType == FormInputBorderType.outline
            ? AppColors.textfieldOutlineBackgroundColor.ofContext(context)
            : AppColors.textfieldUnderlineBackgroundColor.ofContext(context));
    return TextFormField(
        style: style ?? Theme.of(context).textTheme.bodyText1,
        cursorColor: styleOfLabel.color,
        cursorHeight: styleOfLabel.fontSize,
        controller: controller,
        onChanged: onChanged,
        initialValue: initialValue,
        keyboardType: keyboardType,
        readOnly: readOnly,
        maxLength: maxLength,
        maxLines: obscureText ? 1 : maxLines,
        enabled: enabled,
        textInputAction: textInputAction,
        textAlign: textAlign,
        obscureText: obscureText,
        inputFormatters: inputFormatters,
        onTap: onTap,
        autocorrect: autoCorrect,
        focusNode: focusNode,
        textCapitalization: textCapitalization,
        autofillHints: autofillHints,
        minLines: minLines,
        autofocus: autofocus,
        decoration: InputDecoration(
          isDense: isDense,
          helperText: helperText,
          errorMaxLines: 3,
          helperMaxLines: 3,
          errorStyle: styleOfHelper.copyWith(
            color: AppColors.errorColor,
          ),
          helperStyle: styleOfHelper,
          prefixIcon: _buildFieldIcon(prefixIcon),
          prefixText: prefixText,
          prefixStyle: prefixStyle,
          suffixIcon: _buildFieldIcon(suffixIcon),
          suffixText: suffixText,
          suffixStyle: suffixStyle,
          hintText: hintText,
          hintStyle: styleOfHint,
          prefixIconConstraints: const BoxConstraints(maxHeight: 40),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          labelText: labelText,
          labelStyle: styleOfLabel,
          suffixIconConstraints: const BoxConstraints(maxHeight: 40),
          fillColor: bgColor,
          filled: bgColor != Colors.transparent,
          focusedBorder: _buildBorder(
            context,
            color: borderType == FormInputBorderType.outline
                ? AppColors.textfieldOutlineBorderColor
                : AppColors.textfieldUnderlineBorderColor,
          ),
          focusedErrorBorder:
              _buildBorder(context, color: AppColors.errorColor),
          errorBorder: _buildBorder(context, color: AppColors.errorColor),
          enabledBorder: _buildBorder(
            context,
            color: borderType == FormInputBorderType.outline
                ? AppColors.textfieldOutlineBorderColor
                : AppColors.textfieldUnderlineBorderColor,
          ),
        ),
        validator: validator);
  }

  InputBorder _buildBorder(
    BuildContext context, {
    required Color color,
    double? width,
  }) {
    return (inputBorder ??
            (borderType == FormInputBorderType.outline
                ? Borders.textfieldOutlineShapeBorder(context: context)
                : Borders.textfieldUnderlineShapeBorder(context: context)))
        .copyWith(
            borderSide: BorderSide(
                color: color, width: width ?? AppConstants.inputBorderWidth));
  }

  Widget? _buildFieldIcon(Widget? icon) {
    return icon is Icon
        ? Padding(
            padding: const EdgeInsetsDirectional.only(start: 12.0, end: 12.0),
            child: icon // myIcon is a 48px-wide widget.
            )
        : (icon is Widget
            ? icon is Text
                ? Padding(
                    padding: const EdgeInsetsDirectional.only(end: 12.0),
                    child: icon // myIcon is a 48px-wide widget.
                    )
                : icon
            : null);
  }
}
