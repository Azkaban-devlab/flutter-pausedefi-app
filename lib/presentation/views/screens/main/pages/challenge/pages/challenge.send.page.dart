import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/viewmodels/main/pages/challenge.viewmodel.dart';
import 'package:app/presentation/views/widgets/custom/placeholder/challenge.placeholder.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChallengeSendPage extends StatelessWidget {
  const ChallengeSendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChallengeMainViewModel model =
        ChallengeMainViewModel?.provide(context);
    return model.challengeSend.isEmpty
        ? const ChallengePlaceholder(type: ChallengeType.sent)
        : ListView.separated(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            itemCount: model.challengeSend.length,
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemBuilder: (context, index) => Container(
                  height: 105,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                        color: AppColors.primaryVariantColor, width: 3),
                    color: CustomColors.silver.withOpacity(0.65),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextVariant(model.challengeSend[index].launchChallenge),
                      const SizedBox(
                        height: 5,
                      ),
                      TextVariant(model.challengeSend[index].title ?? ''),
                      const SizedBox(
                        height: 10,
                      ),
                      Flexible(
                          child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.calendar_today_outlined),
                          const SizedBox(width: 5),
                          TextVariant(DateFormat('dd MMMM yyyy', 'fr_FR')
                              .format(model.challengeSend[index].datePosted!)
                              .toString())
                        ],
                      ))
                    ],
                  ),
                ));
  }
}
