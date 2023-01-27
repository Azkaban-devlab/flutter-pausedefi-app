import 'dart:ffi';
import 'package:app/domain/data/models/challenge.model.dart';
import 'package:app/domain/services/helpers/validator.helper.dart';
import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/viewmodels/challenge/challenge.viewmodel.dart';
import 'package:app/presentation/views/widgets/buttons/add_button.dart';
import 'package:app/presentation/views/widgets/buttons/button.dart';
import 'package:app/presentation/views/widgets/buttons/default_button.dart';
import 'package:app/presentation/views/widgets/buttons/new_button.dart';
import 'package:app/presentation/views/widgets/buttons/primary_button.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:app/presentation/views/widgets/form_fields/form_input.dart';
import 'package:app/presentation/views/widgets/form_fields/form_new_input_field.dart';
import 'package:flutter/cupertino.dart';
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
        isFromRoomCreation ? 'Créer un salon ' : 'Création de défis',
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
                  child: ListView(
                    scrollDirection: Axis.vertical,
                children: [
                  Flexible(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: const TextVariant(
                            'Type de défi',
                            variantType: TextVariantType.headline5,
                          )
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Row(
                          children: [
                             Expanded(child:
                             SizedBox(
                               width: 150,
                               height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: NewButton(
                                    'Gage', () => {
                                      null
                                    },

                                  ),
                                ),
                            ),
                             ),
                            Expanded(child:
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: NewButton(
                                    'Bataille', () => {
                                      null
                                    },
                                    isOutlined: true
                                ),
                              ),
                            ),
                            ),
                          ], // Children of row
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: const TextVariant(
                            'Nom du défi',
                            variantType: TextVariantType.headline5,
                          )
                      ),
                       FormNewInputField(
                          builder: (FormFieldState field) {
                            return TextField(
                              onChanged: (value) => field.didChange(value),
                              decoration: const InputDecoration(
                                  hintText: 'Nommer votre défi',
                                contentPadding: EdgeInsets.all(10.0),
                              ),
                              style: TextStyle(fontSize: 16),
                            );
                          },
                        ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: const TextVariant(
                            'Description du défi',
                            variantType: TextVariantType.headline5,
                          )
                      ),
                      FormNewInputField(
                          builder: (FormFieldState field) {
                            return TextField(
                                onChanged: (value) => field.didChange(value),
                                decoration: const InputDecoration(
                                  hintText: 'Expliquer votre défi',
                                  contentPadding: EdgeInsets.only(top:10.0, left:10.0, bottom: 80.0),
                                ),
                                maxLines: 5, //
                                minLines: 1,
                                style: TextStyle(fontSize: 16),
                            );
                          },
                        ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        heightFactor: 2,
                        widthFactor: 2,
                        child: SizedBox(
                            width: 200,
                            height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: NewButton('Suggestion de défis', () => {
                                  null
                                  }
                                ),
                              ),
                            ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          padding: const EdgeInsets.only(left: 15, bottom: 5),
                          child: const TextVariant(
                            'Nombre de points',
                            variantType: TextVariantType.headline5,
                          )
                      ),
                      Row(
                        //mainAxisSize:MainAxisSize.min ,
                        children: [
                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: NewButton(
                                    '10', () => {
                                  null
                                }
                                ),
                              ),
                            ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: NewButton(
                                  '25', () => {
                                null
                              },
                              isOutlined: true
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: NewButton(
                                  '50', () => {
                                null
                              },isOutlined: true
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: NewButton(
                                  '100', () => {
                                null
                              },isOutlined: true
                              ),
                            ),
                          ),
                        ], // Children of row
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          padding: const EdgeInsets.only(left: 15, bottom: 5),
                          child: const TextVariant(
                            'Participants',
                            //style: TextStyle(.toUpperCase()),
                            variantType: TextVariantType.headline5,
                            // color: Color(0xFFffffff),
                          )
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AddButton(
                                          () =>
                                        {
                                          null
                                        }
                                )
                              ),
                          ),
                          Expanded(
                            child: Card(
                              shape: RoundedRectangleBorder( //<-- SEE HERE
                                side: BorderSide(
                                  color: AppColors.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              elevation: 1,
                              color: AppColors.onPrimaryColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircleAvatar(
                                    radius: 48, // Image radius
                                    backgroundImage: NetworkImage('https://source.unsplash.com/random',
                                      ),
                                    ),
                                    SizedBox(
                                      height:50,
                                    ),
                                    Text('Jason Perra',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Deuxième ligne
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              shape: RoundedRectangleBorder( //<-- SEE HERE
                                side: BorderSide(
                                  color: AppColors.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              elevation: 1,
                              color: AppColors.onPrimaryColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircleAvatar(
                                      radius: 48, // Image radius
                                      backgroundImage: NetworkImage('https://source.unsplash.com/random',
                                      ),
                                    ),
                                    SizedBox(
                                      height:50,
                                    ),
                                    Text('Jason Perra',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              shape: RoundedRectangleBorder( //<-- SEE HERE
                                side: BorderSide(
                                  color: AppColors.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              elevation: 1,
                              color: AppColors.onPrimaryColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircleAvatar(
                                        radius: 48, // Image radius
                                        backgroundImage: NetworkImage('https://source.unsplash.com/random',
                                        ),
                                      ),
                                      SizedBox(
                                        height:50,
                                      ),
                                      Text('Jason Perra',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
                ],
              )),
              PrimaryTextButton(
                  label: 'Envoyer le défi', onTap: () => model.addChallenge(context)
              )
            ],
          ),
        ));
  }
}
