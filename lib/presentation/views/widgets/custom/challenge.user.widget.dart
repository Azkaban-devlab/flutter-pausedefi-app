import 'package:app/domain/data/models/challenge.model.dart';
import 'package:app/domain/services/helpers/challenge.helper.dart';
import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/views/widgets/buttons/primary_button.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:app/presentation/views/widgets/utilities/icon/pause_defi_icon_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChallengeUserWidget extends StatelessWidget {
  final Challenge challenge;
  final VoidCallback onTap;
  const ChallengeUserWidget(
      {Key? key, required this.challenge, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(
              width: 3,
              color: challenge.state == 'failed'
                  ? CustomColors.redColor
                  : challenge.state == 'succeed'
                      ? CustomColors.greenFlashColor
                      : AppColors.primaryVariantColor),
          color: CustomColors.silver.withOpacity(0.65)),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage('https://source.unsplash.com/random'),
            radius: 16,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextVariant(challenge.userChallenge),
              const SizedBox(
                height: 5,
              ),
              TextVariant(challenge.title ?? ''),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.calendar_today_outlined,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  TextVariant(DateFormat('dd MMMM yyyy', 'fr_FR')
                      .format(challenge.datePosted!)
                      .toString())
                ],
              )),
              const Spacer(),
              challenge.state == ChallengeHelper.SUCCEED ||
                      challenge.state == ChallengeHelper.FAILED ||
                      challenge.state == ChallengeHelper.ENDED
                  ? Flexible(
                      child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          PauseDefiIcon.medal,
                          size: 24,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        TextVariant(
                            '${challenge.points?.toString() ?? ''} ${(challenge.points ?? 0) > 1 ? 'points' : 'point'}')
                      ],
                    ))
                  : Center(
                      child: SizedBox(
                          width: 190,
                          child: PrimaryTextButton(
                              label: 'Terminer le défi'.toUpperCase(),
                              onTap: onTap)))
            ],
          ),
          const Spacer(),
          challenge.state == 'failed'
              ? const CircleAvatar(
                  radius: 12,
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 18,
                  ),
                  backgroundColor: CustomColors.redColor,
                )
              : challenge.state == 'succeed'
                  ? const CircleAvatar(
                      radius: 12,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      ),
                      backgroundColor: CustomColors.greenFlashColor,
                    )
                  : const SizedBox()
        ],
      ),
    );
  }
}
