import 'package:app/domain/services/helpers/validator.helper.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:flutter/material.dart';

import 'form_input.dart';

class CustomForm extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validationHelper;
  final double? height;
  final int maxLines;

  const CustomForm(this.label, this.controller,
      {Key? key, this.validationHelper, this.height, this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            padding: const EdgeInsets.only(left: 15, bottom: 5),
            child: TextVariant(
              label,
              variantType: TextVariantType.caption,
              color: const Color(0xFFB2BFE6),
            )),
        SizedBox(
            height: height ?? 40,
            child: FormInput(
              maxLines: maxLines,
              controller: controller,
              borderType: FormInputBorderType.outline,
              fillColor: const Color(0xFFB2BFE6),
              inputBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              validator: validationHelper ??
                  (String? v) => ValidatorHelper.validateRequired(v).message,
            )),
      ],
    );
  }
}
