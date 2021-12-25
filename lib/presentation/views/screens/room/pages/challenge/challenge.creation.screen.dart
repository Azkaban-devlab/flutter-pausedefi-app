import 'package:app/domain/data/models/challenge.model.dart';
import 'package:app/domain/services/helpers/validator.helper.dart';
import 'package:app/presentation/viewmodels/challenge/challenge.viewmodel.dart';
import 'package:app/presentation/views/widgets/buttons/primary_button.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:app/presentation/views/widgets/form_fields/form_input.dart';
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
        padding:
            const EdgeInsets.only(top: 40, bottom: 60, left: 25, right: 25),
        child: Form(
          key: model.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  child: Row(
                children: [
                  Flexible(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(left: 15, bottom: 5),
                          child: const TextVariant(
                            'Titre',
                            variantType: TextVariantType.caption,
                            color: Color(0xFFB2BFE6),
                          )),
                      FormInput(
                        controller: model.titleController,
                        borderType: FormInputBorderType.outline,
                        fillColor: const Color(0xFFB2BFE6),
                        inputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        validator: (String? v) =>
                            ValidatorHelper.validateRequired(v).message,
                      ),
                    ],
                  )),
                  const Spacer(),
                  const Text('Points'),
                ],
              )),
              const SizedBox(
                height: 15,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 15, bottom: 5),
                  child: const TextVariant(
                    'Description',
                    variantType: TextVariantType.caption,
                    color: Color(0xFFB2BFE6),
                  )),
              FormInput(
                maxLines: 9999,
                controller: model.descriptionController,
                borderType: FormInputBorderType.outline,
                fillColor: const Color(0xFFB2BFE6),
                inputBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                validator: (String? v) =>
                    ValidatorHelper.validateRequired(v).message,
              ),
              const Spacer(),
              PrimaryTextButton(
                  label: 'Valider', onTap: () => model.addChallenge(context))
            ],
          ),
        ));
  }
}
