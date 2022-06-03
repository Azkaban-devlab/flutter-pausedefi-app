import 'package:app/domain/data/models/challenge.model.dart';
import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/viewmodels/widgets/challenge.dialog.viewmodel.dart';
import 'package:app/presentation/views/widgets/buttons/primary_button.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:flutter/material.dart';

import '../../../../domain/services/helpers/ui.helper.dart';

class DialogChallengeState extends StatelessWidget {
  final Challenge challenge;

  const DialogChallengeState({Key? key, required this.challenge})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChallengeDialogViewModel?.buildWithProvider(
        builder: (context, widget) => _ChallengeDialogBody(),
        challenge: challenge);
  }
}

class _ChallengeDialogBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ChallengeDialogViewModel model =
        ChallengeDialogViewModel?.provide(context);
    return SizedBox(
      height: 370,
      width: 310,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppColors.primaryColor,
            height: 80,
            child: Stack(
              children: [
                Positioned(
                  top: -1,
                  right: 1,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.close,
                      size: 16,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextVariant(
                    'Terminer le défi'.toUpperCase(),
                    variantType: TextVariantType.appBarTitle,
                  ),
                )
              ],
            ),
          ),
          Flexible(
              child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextVariant('Preuve'),
                      const SizedBox(
                        height: 8,
                      ),
                      JoinFile(() => UiHelper().openBottomSheet(
                          context, model.galleryClick, model.cameraClick)),
                      const Spacer(),
                      PrimaryTextButton(
                          label: 'Valider'.toUpperCase(),
                          onTap: () => model.finishChallenge(context))
                    ],
                  )))
        ],
      ),
    );
  }
}

class JoinFile extends StatelessWidget {
  final VoidCallback onTap;
  const JoinFile(this.onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            height: 25,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: AppColors.primaryColor)),
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: 25,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: AppColors.primaryColor),
                  color: AppColors.primaryColor),
              child: const Center(child: TextVariant('Insérer un fichier')),
            )));
  }
}
