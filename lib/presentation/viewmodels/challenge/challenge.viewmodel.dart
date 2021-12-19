import 'package:app/domain/data/models/challenge.model.dart';
import 'package:app/domain/services/injected/authentication.service.dart';
import 'package:app/infrastructure/abstracts/lockable_view_model.abstract.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChallengeViewModel extends LockableViewModel {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  Challenge? challenge;

  ChallengeViewModel(this.challenge) {
    if (challenge != null) {
      titleController.text = challenge?.title ?? '';
      descriptionController.text = challenge?.content ?? '';
    }
  }

  ///
  /// Build this ViewModel
  ///
  static ChangeNotifierProvider<ChallengeViewModel> buildWithProvider(
      {required Widget Function(BuildContext context, Widget? child)? builder,
      Widget? child,
      Challenge? challenge}) {
    return ChangeNotifierProvider<ChallengeViewModel>(
      create: (BuildContext context) => ChallengeViewModel(challenge),
      builder: builder,
      lazy: false,
      child: child,
    );
  }

  ///
  /// Provide a built ViewModel
  ///
  static ChallengeViewModel provide(BuildContext context,
      {bool listen = true}) {
    return Provider.of<ChallengeViewModel>(context, listen: listen);
  }

  void addChallenge(BuildContext context) {
    if (challenge != null) {
      challenge?.title = titleController.text;
      challenge?.content = descriptionController.text;
    } else {
      challenge = Challenge();
      challenge?.title = titleController.text;
      challenge?.content = descriptionController.text;
    }
    challenge?.creatorId = AuthenticationService.injected().user?.id;
    //TODO handle this in better way
    Navigator.pop(context, challenge);
  }
}
