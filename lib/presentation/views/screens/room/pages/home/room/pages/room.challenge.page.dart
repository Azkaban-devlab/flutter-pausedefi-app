import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/viewmodels/home/room/room.creation.viewmodel.dart';
import 'package:app/presentation/views/widgets/buttons/button.dart';
import 'package:app/presentation/views/widgets/buttons/primary_button.dart';
import 'package:app/presentation/views/widgets/custom/separator.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:flutter/material.dart';

class RoomChallengePage extends StatelessWidget {
  const RoomChallengePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RoomCreationViewModel model = RoomCreationViewModel.provide(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Button('Créer un défi', () => model.addEditChallenge(context)),
          const SizedBox(
            height: 50,
          ),
          const Separator(text: 'Idées de défis'),
          const SizedBox(
            height: 3,
          ),
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.only(top: 25, bottom: 15),
                itemCount: model.challenges.length,
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemBuilder: (context, index) => Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      children: [
                        TextVariant(model.challenges[index].title ?? ''),
                        const Spacer(),
                        InkWell(
                          onTap: () => model.addEditChallenge(context,
                              challenge: model.challenges[index]),
                          child: const Icon(Icons.edit),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                            onTap: () =>
                                model.removeChallenge(model.challenges[index]),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      ],
                    ))),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
              child: SizedBox(
                  width: 190,
                  child: PrimaryTextButton(
                      label: 'Suivant'.toUpperCase(),
                      onTap: () => model.submitRoom(context)))),
          const SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
