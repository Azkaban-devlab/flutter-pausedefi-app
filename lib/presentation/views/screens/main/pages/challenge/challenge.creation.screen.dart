import 'package:app/domain/data/models/challenge.model.dart';
import 'package:app/presentation/viewmodels/challenge/challenge.viewmodel.dart';
import 'package:app/presentation/views/widgets/buttons/button.dart';
import 'package:app/presentation/views/widgets/buttons/primary_button.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:app/presentation/views/widgets/form_fields/custom_form.dart';
import 'package:flutter/material.dart';

class ChallengeCreationScreen extends StatelessWidget {
  final bool isFromRoomCreation;
  final Challenge? challenge;
  const ChallengeCreationScreen(
      {this.challenge, this.isFromRoomCreation = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextVariant(
          isFromRoomCreation ? 'Créer un salon ' : 'Créer un défi',
          variantType: TextVariantType.appBarTitle,
        ),
      ),
      body: ChallengeViewModel?.buildWithProvider(
          builder: (_, __) => _ChallengeCreationBody(), challenge: challenge),
    );
  }
}

class _ChallengeCreationBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ChallengeViewModel model = ChallengeViewModel.provide(context);
    return Container(
      padding: const EdgeInsets.only(top: 40, bottom: 60, left: 25, right: 25),
      child: Column(
        children: [
          Flexible(
              child: Row(
            children: [
              Flexible(child: CustomForm('Titre', model.titleController)),
              const Spacer(),
              const Text('Points'),
            ],
          )),
          const SizedBox(
            height: 15,
          ),
          CustomForm(
            'Description',
            model.descriptionController,
            height: 140,
            maxLines: 9999,
          ),
          const Spacer(),
          PrimaryTextButton(
              label: 'Valider', onTap: () => model.addChallenge(context))
        ],
      ),
    );
  }
}
