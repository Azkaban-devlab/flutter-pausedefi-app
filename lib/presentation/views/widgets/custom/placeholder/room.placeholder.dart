import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoomPlaceholder extends StatelessWidget {
  const RoomPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: 220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/svg/room_placeholder.svg',
            height: 150,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 8,
          ),
          const TextVariant("Vous n'êtes présent dans aucune room...")
        ],
      ),
    );
  }
}
