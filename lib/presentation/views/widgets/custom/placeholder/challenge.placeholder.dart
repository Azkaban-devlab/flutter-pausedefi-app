import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChallengePlaceholder extends StatelessWidget {
  final ChallengeType type;
  const ChallengePlaceholder({Key? key, required this.type}) : super(key: key);

  String typeToString() {
    switch (type) {
      case ChallengeType.done:
        return 'terminé';
      case ChallengeType.inProgress:
        return 'en cours';
      case ChallengeType.sent:
        return 'envoyé';
      case ChallengeType.idea:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/svg/target_placeholder.svg',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: 120,
          ),
          const SizedBox(
            height: 8,
          ),
          TextVariant(type == ChallengeType.idea
              ? "Il n'y a pas d'idée de défi pour le moment"
              : "Vous n'avez aucun défi ${typeToString()}")
        ],
      ),
    );
  }
}

enum ChallengeType { sent, done, inProgress, idea }
