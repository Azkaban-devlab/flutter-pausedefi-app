import 'package:app/presentation/viewmodels/main/pages/challenge.viewmodel.dart';
import 'package:app/presentation/views/widgets/custom/placeholder/challenge.placeholder.dart';
import 'package:app/presentation/views/widgets/custom/challenge.user.widget.dart';
import 'package:app/presentation/views/widgets/custom/separator.dart';
import 'package:flutter/material.dart';

class ChallengeUserPage extends StatelessWidget {
  const ChallengeUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChallengeMainViewModel model =
        ChallengeMainViewModel?.provide(context);
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
      children: [
        const Separator(text: 'Défis en cours'),
        model.challengeInProgress.isNotEmpty
            ? ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 25),
                itemCount: model.challengeInProgress.length,
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemBuilder: (context, index) => ChallengeUserWidget(
                      challenge: model.challengeInProgress[index],
                      onTap: () => model.openDialog(
                          model.challengeInProgress[index], context),
                    ))
            : const ChallengePlaceholder(type: ChallengeType.inProgress),
        const Separator(text: 'Défis terminés'),
        model.challengeDone.isNotEmpty
            ? ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 25),
                itemCount: model.challengeDone.length,
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemBuilder: (context, index) => ChallengeUserWidget(
                      challenge: model.challengeDone[index],
                    ))
            : const ChallengePlaceholder(type: ChallengeType.done),
      ],
    );
  }
}
