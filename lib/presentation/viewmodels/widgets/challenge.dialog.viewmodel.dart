import 'package:app/domain/data/models/challenge.model.dart';
import 'package:app/domain/data/resources/http/endpoints/user.endpoint.dart';
import 'package:app/domain/data/resources/http/models/data.response.dart';
import 'package:app/domain/services/injected/room.service.dart';
import 'package:app/infrastructure/abstracts/lockable_view_model.abstract.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChallengeDialogViewModel extends LockableViewModel {
  final Locker _challengeLocker = Locker();
  final UserEndpoint _userEndpoint;
  Challenge challenge;

  ChallengeDialogViewModel(this._userEndpoint, this.challenge) {
    challenge.state = 'failed';
  }

  ///
  /// Build this ViewModel
  ///
  static ChangeNotifierProvider<ChallengeDialogViewModel> buildWithProvider(
      {required Widget Function(BuildContext context, Widget? child)? builder,
      Widget? child,
      required challenge}) {
    return ChangeNotifierProvider<ChallengeDialogViewModel>(
      create: (BuildContext context) =>
          ChallengeDialogViewModel(UserEndpoint(), challenge),
      builder: builder,
      lazy: false,
      child: child,
    );
  }

  ///
  /// Provide a built ViewModel
  ///
  static ChallengeDialogViewModel provide(BuildContext context,
      {bool listen = true}) {
    return Provider.of<ChallengeDialogViewModel>(context, listen: listen);
  }

  void updateChallengeState() {
    if (challenge.state == 'succeed') {
      challenge.state = 'failed';
    } else {
      challenge.state = 'succeed';
    }
    notifyListeners();
  }

  void finishChallenge(BuildContext context) async {
    if (!locked) {
      lock(_challengeLocker);
      DataResponse response = await _userEndpoint.updateChallengeState(
          challenge.id!, {
        'state': challenge.state ?? 'failed',
        'room_id': RoomService.injected().room?.id
      });
      Challenge? data = response.data<Challenge>();
      unlock(_challengeLocker);
      if (data != null) {
        Navigator.pop(context, true);
      }
    }
  }
}
