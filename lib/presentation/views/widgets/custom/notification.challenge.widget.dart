import 'package:app/domain/data/models/challenge.model.dart';
import 'package:app/domain/services/helpers/challenge.helper.dart';
import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/views/widgets/buttons/default_button.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:app/presentation/views/widgets/utilities/icon/pause_defi_icon_icons.dart';
import 'package:flutter/material.dart';

class NotificationChallengeWidget extends StatelessWidget {
  final Challenge challenge;
  final VoidCallback onAccept;
  final VoidCallback onRefuse;
  const NotificationChallengeWidget(
      this.challenge, this.onAccept, this.onRefuse,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(
                  height: 36,
                  width: 36,
                  child: Icon(
                    PauseDefiIcon.target,
                    color: Colors.white,
                  )),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextVariant(
                    challenge.userChallenge,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextVariant(
                    challenge.content ?? '',
                    color: Colors.white,
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          challenge.state == ChallengeHelper.PENDING
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DefaultButton(
                      child: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          TextVariant(
                            'ACCEPTER',
                            color: Colors.white,
                          )
                        ],
                      ),
                      onTap: onAccept,
                      backgroundColor: CustomColors.greenAppleColor,
                    ),
                    DefaultButton(
                      child: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.cancel_outlined,
                            color: Colors.white,
                          ),
                          TextVariant(
                            'REFUSER',
                            color: Colors.white,
                          )
                        ],
                      ),
                      onTap: onRefuse,
                      backgroundColor: CustomColors.redColor,
                    )
                  ],
                )
              : challenge.state == ChallengeHelper.ACCEPTED
                  ? Row(
                      children: const <Widget>[
                        SizedBox(
                          width: 48,
                        ),
                        Icon(
                          Icons.check,
                          color: CustomColors.greenAppleColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        TextVariant(
                          'DEFI ACCEPTE',
                          color: Colors.white,
                        )
                      ],
                    )
                  : Row(
                      children: const <Widget>[
                        SizedBox(
                          width: 48,
                        ),
                        Icon(
                          Icons.cancel_outlined,
                          color: CustomColors.redColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        TextVariant(
                          'DEFI REFUSE',
                          color: Colors.white,
                        )
                      ],
                    )
        ],
      ),
    );
  }
}

class NotificationProofWidget extends StatelessWidget {
  final Challenge challenge;
  final VoidCallback validate;
  final VoidCallback failed;
  const NotificationProofWidget(this.challenge, this.validate, this.failed,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                  height: 36,
                  width: 36,
                  child: Icon(
                    PauseDefiIcon.target,
                    color: Colors.white,
                  )),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextVariant(
                    challenge.endedChallenge,
                    color: Colors.white,
                  ),
                  TextVariant(
                    challenge.content ?? '',
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Preuve :',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      const SizedBox(width: 8),
                      Image.network(
                        challenge.proof ?? '',
                        height: 60,
                        width: 80,
                        errorBuilder: (BuildContext context, Object object,
                                StackTrace? stackTrace) =>
                            Container(
                                height: 60,
                                width: 80,
                                color: CustomColors.lightGrey,
                                child: const Center(
                                  child: Icon(Icons.camera),
                                )),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DefaultButton(
                child: Row(
                  children: const <Widget>[
                    Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    TextVariant(
                      'DEFI VALIDE',
                      color: Colors.white,
                    )
                  ],
                ),
                onTap: validate,
                backgroundColor: CustomColors.greenAppleColor,
              ),
              DefaultButton(
                child: Row(
                  children: const <Widget>[
                    Icon(
                      Icons.cancel,
                      color: Colors.white,
                    ),
                    TextVariant(
                      'DEFI INVALIDE',
                      color: Colors.white,
                    )
                  ],
                ),
                onTap: failed,
                backgroundColor: CustomColors.redColor,
              )
            ],
          )
        ],
      ),
    );
  }
}

class NotificationEndWidget extends StatelessWidget {
  final Challenge challenge;
  const NotificationEndWidget(this.challenge, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(
                  height: 36,
                  width: 36,
                  child: Icon(
                    PauseDefiIcon.target,
                    color: Colors.white,
                  )),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextVariant(
                    challenge.state == ChallengeHelper.SUCCEED
                        ? challenge.succeedChallenge
                        : challenge.failedChallenge,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextVariant(
                    'Récompense : ${challenge.state == ChallengeHelper.SUCCEED ? challenge.points : '0'} points',
                    color: Colors.white,
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
