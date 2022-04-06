import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/viewmodels/home/room/room.creation.viewmodel.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:app/presentation/views/widgets/utilities/icon/pause_defi_icon_icons.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            children: [
              Text('Deliver features faster'),
              Text('Craft beautiful UIs'),
              Center(
                child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Row (
                      children: [
                        TextVariant('Prénom', color: Colors.white, fontWeight: FontWeight.bold,
                        ),
                        TextVariant('a accepté ton défi'),
                      ],
                    ),
                    TextVariant("Faire des claquettes")
                  ],
                )
                )
              )
      ]
    )
    );
  }
}


