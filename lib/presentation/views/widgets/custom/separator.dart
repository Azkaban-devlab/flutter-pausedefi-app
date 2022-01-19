import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  final String text;
  const Separator({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextVariant(text),
        const SizedBox(
          width: 5,
        ),
        Expanded(
            child: Container(
          margin: const EdgeInsets.only(bottom: 4),
          height: 1,
          color: Colors.black,
        )),
      ],
    );
  }
}
