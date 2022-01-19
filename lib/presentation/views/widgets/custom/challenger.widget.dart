import 'package:app/domain/data/models/user.model.dart';
import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:flutter/material.dart';

class ChallengerWidget extends StatelessWidget {
  final User user;
  final bool isSelected;
  const ChallengerWidget(
      {Key? key, required this.user, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: AppColors.primaryColor, width: 2),
          color: isSelected ? Colors.white : AppColors.primaryColor),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: const DecorationImage(
                    image: NetworkImage('https://source.unsplash.com/random'),
                    fit: BoxFit.cover),
                border: Border.all(color: Colors.white)),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextVariant(user.fullName ?? ''),
              const TextVariant('Chef de projet'),
            ],
          ))
        ],
      ),
    );
  }
}
