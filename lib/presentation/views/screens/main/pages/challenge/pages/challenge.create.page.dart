import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/viewmodels/main/pages/challenge.viewmodel.dart';
import 'package:app/presentation/views/widgets/buttons/button.dart';
import 'package:app/presentation/views/widgets/buttons/primary_button.dart';
import 'package:app/presentation/views/widgets/custom/challenger.widget.dart';
import 'package:app/presentation/views/widgets/custom/placeholder/challenge.placeholder.dart';
import 'package:app/presentation/views/widgets/custom/separator.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:flutter/material.dart';

class ChallengeCreatePage extends StatelessWidget {
  const ChallengeCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChallengeMainViewModel model =
        ChallengeMainViewModel?.provide(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Button(
              'Créer un défi', () => model.navigateToCreateChallenge(context)),
          const SizedBox(
            height: 50,
          ),
          const Separator(text: 'Idées de défis'),
          const SizedBox(
            height: 3,
          ),
          model.challengeIdea.isEmpty
              ? const Center(
                  child: ChallengePlaceholder(type: ChallengeType.idea))
              : Expanded(
                  child: ListView.separated(
                      padding: const EdgeInsets.only(top: 25, bottom: 15),
                      itemCount: model.challengeIdea.length,
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemBuilder: (context, index) => InkWell(
                          onTap: () =>
                              model.selectChallenge(model.challengeIdea[index]),
                          child: Container(
                              height: 60,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                  color: model.selectedIdea ==
                                          model.challengeIdea[index]
                                      ? Colors.white
                                      : AppColors.primaryColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  border: Border.all(
                                      color: AppColors.primaryColor, width: 2)),
                              child: Center(
                                child: TextVariant(
                                    model.challengeIdea[index].title ?? ''),
                              )))),
                ),
          model.selectedIdea != null
              ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: SizedBox(
                          width: 190,
                          child: PrimaryButton(
                            onTap: () => model.updatePageCreateChallenge(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextVariant('Choisir qui défier'.toUpperCase()),
                                const Icon(Icons.chevron_right)
                              ],
                            ),
                          ))),
                  const SizedBox(
                    height: 20,
                  )
                ])
              : const SizedBox()
        ],
      ),
    );
  }
}

class ListChallengersPage extends StatelessWidget {
  const ListChallengersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChallengeMainViewModel model =
        ChallengeMainViewModel?.provide(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Separator(text: 'Vos challengers'),
          const SizedBox(
            height: 3,
          ),
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.only(top: 25, bottom: 15),
                itemCount: model.challengers.length,
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemBuilder: (context, index) => InkWell(
                    onTap: () =>
                        model.selectChallengers(model.challengers[index]),
                    child: ChallengerWidget(
                      user: model.challengers[index],
                      isSelected: model.selectedUsers
                          .contains(model.challengers[index]),
                    ))),
          ),
          model.selectedUsers.isNotEmpty
              ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: SizedBox(
                    width: 190,
                    child: PrimaryTextButton(
                        onTap: () => model.sendChallenge(),
                        label: 'Envoyer le défi'.toUpperCase()),
                  )),
                  const SizedBox(
                    height: 20,
                  )
                ])
              : const SizedBox()
        ],
      ),
    );
  }
}
