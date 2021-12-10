import 'package:flutter/material.dart';

import 'form_checkbox.dart';
import 'form_input_field.dart';

///
/// [FormChoice]
///
class FormChoice<T> {
  /// key/identifier
  final String? key;

  /// label
  final String label;

  /// value
  final T value;

  ///
  /// Constructor
  ///
  const FormChoice({required this.label, required this.value, this.key})
      : assert(value != null);
}

///
/// [FormChoiceInput]
/// Choice input for checkbox with validator
///
class FormChoiceInput<T> extends StatelessWidget {
  /// label
  final String label;

  /// validator
  final String Function(T?)? validator;

  /// choices
  final List<FormChoice<T>> choices;

  /// onChange callback
  final ValueChanged<FormChoice<T>>? onChange;

  /// isSelected
  final bool Function(FormChoice<T>) isSelected;

  ///
  /// Constructor
  ///
  const FormChoiceInput({
    Key? key,
    required this.choices,
    required this.isSelected,
    required this.label,
    this.onChange,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormInputField<T>(
      validator: validator,
      builder: (FormFieldState<T> field) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                ),
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                ),
              ),
            ),
            Wrap(
              runSpacing: 8,
              spacing: 8,
              children: choices
                  .map((FormChoice<T> e) => InkWell(
                        onTap: () {
                          if (onChange != null) onChange!(e);
                          field.didChange(e.value);
                        },
                        child: Row(
                          children: <Widget>[
                            FormCheckbox(
                              active: isSelected(e),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                e.label,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            )
          ],
        );
      },
    );
  }
}
