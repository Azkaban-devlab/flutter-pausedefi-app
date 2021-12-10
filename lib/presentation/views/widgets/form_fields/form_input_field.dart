import 'package:flutter/material.dart';

///
/// [FormInputField]
///
/// Make any input validable.
/// It will wrap it in a `FormField` and will allow to access
/// to some property like `validator`
///
class FormInputField<T> extends StatelessWidget {
  ///
  /// input builder
  ///
  final Widget Function(FormFieldState<T> fieldState) builder;

  ///
  /// validator
  ///
  final String Function(T?)? validator;

  ///
  /// initial value
  final T? initialValue;

  ///
  /// padding
  ///
  final EdgeInsetsGeometry? padding;

  ///
  /// Constructor
  ///
  const FormInputField({
    Key? key,
    required this.builder,
    this.validator,
    this.initialValue,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      validator: validator,
      initialValue: initialValue,
      builder: (FormFieldState<T> field) {
        return Padding(
          padding: padding ??
              const EdgeInsets.only(
                bottom: 16,
              ),
          child: InputDecorator(
            decoration: InputDecoration(
              errorText: field.errorText,
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              errorMaxLines: 2,
              isDense: true,
            ),
            child: builder(field),
          ),
        );
      },
    );
  }
}
