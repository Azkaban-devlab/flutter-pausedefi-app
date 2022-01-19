import 'package:app/presentation/viewmodels/main/pages/challenge.viewmodel.dart';
import 'package:app/presentation/views/screens/main/pages/challenge/pages/challenge.create.page.dart';
import 'package:app/presentation/views/screens/main/pages/challenge/pages/challenge.send.page.dart';
import 'package:app/presentation/views/screens/main/pages/challenge/pages/challenge.user.page.dart';
import 'package:app/presentation/views/widgets/custom/animated_toggle.dart';
import 'package:flutter/material.dart';

class ChallengeMainScreen extends StatelessWidget {
  const ChallengeMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChallengeMainViewModel?.buildWithProvider(
        builder: (context, widget) => _ChallengeMainBody());
  }
}

class _ChallengeMainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ChallengeMainViewModel model =
        ChallengeMainViewModel?.provide(context);
    return Column(children: [
      AnimatedToggle(
        values: const ['Mes défis', 'Défis envoyés', 'Lancer un défi'],
        navigatePageController: model.updatePage,
        index: model.index,
      ),
      model.locked
          ? const Center(child: CircularProgressIndicator())
          : Expanded(
              flex: 12,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: model.pageController,
                children: [
                  const ChallengeUserPage(),
                  const ChallengeSendPage(),
                  model.addChallenger
                      ? const ListChallengersPage()
                      : const ChallengeCreatePage()
                ],
              )),
    ]);
  }
}
