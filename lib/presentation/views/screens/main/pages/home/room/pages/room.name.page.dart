import 'package:app/domain/services/helpers/validator.helper.dart';
import 'package:app/presentation/viewmodels/home/room/room.creation.viewmodel.dart';
import 'package:app/presentation/views/widgets/buttons/primary_button.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:app/presentation/views/widgets/form_fields/form_input.dart';
import 'package:flutter/material.dart';

class RoomNamePage extends StatelessWidget {
  const RoomNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RoomCreationViewModel model = RoomCreationViewModel.provide(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.only(left: 15, bottom: 5),
                child: const TextVariant(
                  'Nom du salon',
                  variantType: TextVariantType.caption,
                  color: Color(0xFFB2BFE6),
                )),
            SizedBox(
                height: 40,
                child: FormInput(
                  controller: model.roomNameController,
                  borderType: FormInputBorderType.outline,
                  fillColor: const Color(0xFFB2BFE6),
                  inputBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  validator: (String? v) =>
                      ValidatorHelper.validateRequired(v).message,
                )),
            const Spacer(),
            Center(
                child: SizedBox(
                    width: 190,
                    child: PrimaryTextButton(
                        label: 'Suivant'.toUpperCase(),
                        onTap: () => model.initRoom()))),
            const SizedBox(
              height: 60,
            )
          ],
        ));
  }
}
