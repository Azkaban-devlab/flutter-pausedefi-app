import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/viewmodels/home/room/room.creation.viewmodel.dart';
import 'package:app/presentation/viewmodels/main/pages/challenge.viewmodel.dart';
import 'package:app/presentation/views/widgets/buttons/button.dart';
import 'package:app/presentation/views/widgets/buttons/default_button.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:app/presentation/views/widgets/utilities/icon/pause_defi_icon_icons.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(

        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            // Alignement sur la courbe axis
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Text('Deliver features faster'),
              //Text('Craft beautiful UIs'),
              Center(
                child: Container(
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row (
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              PauseDefiIcon.target,
                              color: Colors.white,
                            ),
                          ),
                          TextVariant('Prénom', color: Colors.white, fontWeight: FontWeight.bold, textAlign:TextAlign.center,
                          ),
                          TextVariant('a accepté ton défi'),
                        ],
                      ),
                    ),
                    TextVariant("Faire des claquettes", color: Colors.white,)
                  ],
                )
                )
              ),
            SizedBox(
              height: 20,
            ),
            // 2ème block
            Center(
              child: Container(
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row (
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              PauseDefiIcon.target,
                              color: Colors.white,
                            ),
                          ),
                          TextVariant('Prénom', color: Colors.white, fontWeight: FontWeight.bold, textAlign:TextAlign.center,),

                          TextVariant("participe à l'evènement"),
                          ],
                      ),
                    ),
                    TextVariant("Escape Game - 13/11/22 14:00"),
                    Row(
                      children: [
                        Icon(
                          PauseDefiIcon.target,
                          color: Colors.white,
                        ),
                        TextVariant("12 boulevard Sébastopol, 75012 Paris"),
                      ],
                    ),
                  ]
                )
            )
            ),
              SizedBox(
                height: 20,
              ),
              // 3ème block
              Center(
                  child: Container(
                      height: 300,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row (
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      PauseDefiIcon.target,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextVariant('Prénom', color: Colors.white, fontWeight: FontWeight.bold, textAlign:TextAlign.center,),

                                  TextVariant("a terminé ton défi"),
                                ],
                              ),
                            ),
                            TextVariant("Etat : réussite"),
                            Row(
                              children: [
                                TextVariant("Preuve :"),
                                Image.network("https://cdn-icons-png.flaticon.com/512/6872/6872256.png",width: 30,
                                height: 30,
                                fit:BoxFit.fill
                                )
                              ],
                            ),
                            // FIN DU CHILDREN
                            /* Row(
                                children : [
                                  DefaultButton(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextVariant('défi validé'.toUpperCase()),
                                          const Icon(Icons.check)
                                        ],
                                      ),
                                      onTap: () => ""),
                                  DefaultButton(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextVariant('défi invalidé'.toUpperCase()),
                                          const Icon(Icons.close)
                                        ],
                                      ),
                                      onTap: () => "")

                                ]

                            )*/
                          ]

                      )
                  )
              )
          ]
        )
        );
  }
}


