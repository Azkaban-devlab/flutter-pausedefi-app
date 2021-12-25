import 'package:app/domain/services/helpers/validator.helper.dart';
import 'package:app/presentation/viewmodels/home/room/room.join.viewmodel.dart';
import 'package:app/presentation/views/widgets/buttons/primary_button.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:app/presentation/views/widgets/form_fields/form_input.dart';
import 'package:flutter/material.dart';

class RoomJoinScreen extends StatelessWidget {
  const RoomJoinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoomJoinViewModel?.buildWithProvider(
        builder: (_, __) => Scaffold(
            appBar: AppBar(
              title: const TextVariant(
                'Rejoindre un salon',
                variantType: TextVariantType.appBarTitle,
              ),
            ),
            body: _RoomJoinBody()));
  }
}

class _RoomJoinBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RoomJoinViewModel model = RoomJoinViewModel.provide(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
                padding: const EdgeInsets.only(left: 15, bottom: 5),
                child: const TextVariant(
                  "ID du salon",
                  variantType: TextVariantType.caption,
                  color: Color(0xFFB2BFE6),
                )),
            FormInput(
              controller: model.accessCodeController,
              borderType: FormInputBorderType.outline,
              fillColor: const Color(0xFFB2BFE6),
              inputBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              validator: (String? v) =>
                  ValidatorHelper.validateRequired(v).message,
            ),
            const Spacer(),
            Center(
                child: SizedBox(
                    width: 190,
                    child: PrimaryTextButton(
                        label: 'Rejoindre'.toUpperCase(),
                        onTap: () => model.joinRoom(context)))),
            const SizedBox(
              height: 60,
            )
          ],
        ));
  }
}
