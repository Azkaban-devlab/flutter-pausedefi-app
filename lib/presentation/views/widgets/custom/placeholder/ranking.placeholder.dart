import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RankingPlaceholder extends StatelessWidget {
  const RankingPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      height: 250,
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/svg/ranking_placeholder.svg',
            height: 170,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 8,
          ),
          const TextVariant("Il n'y a pas d'autre participant dans la room")
        ],
      ),
    );
  }
}
