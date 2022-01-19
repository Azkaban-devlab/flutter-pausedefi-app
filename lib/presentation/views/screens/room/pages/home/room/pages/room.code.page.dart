import 'package:app/domain/services/helpers/validator.helper.dart';
import 'package:app/presentation/viewmodels/home/room/room.creation.viewmodel.dart';
import 'package:app/presentation/views/widgets/buttons/primary_button.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:app/presentation/views/widgets/form_fields/form_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoomCodePage extends StatelessWidget {
  const RoomCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RoomCreationViewModel model = RoomCreationViewModel.provide(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.only(bottom: 5),
                child: const TextVariant(
                  "Code d'accès au salon",
                  variantType: TextVariantType.caption,
                  color: Color(0xFFB2BFE6),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.only(left: 15, bottom: 5),
                    child: TextVariant(
                      model.accessCode ?? '',
                      variantType: TextVariantType.headline3,
                    )),
                IconButton(
                    onPressed: () =>
                        Clipboard.setData(ClipboardData(text: model.accessCode))
                            .then((value) {
                          //only if ->
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Le code d'accès a été copié"),
                          )); // -> show a notification
                        }),
                    icon: const Icon(Icons.copy))
              ],
            ),
            const Spacer(),
            Center(
                child: SizedBox(
                    width: 190,
                    child: PrimaryTextButton(
                        label: 'Terminer'.toUpperCase(),
                        onTap: () => model.accessRoom(context)))),
            const SizedBox(
              height: 60,
            )
          ],
        ));
  }
}
