import 'dart:io';

import 'package:app/domain/data/models/challenge.model.dart';
import 'package:app/domain/data/resources/http/endpoints/room.endpoint.dart';
import 'package:app/domain/data/resources/http/models/data.response.dart';
import 'package:app/domain/services/helpers/challenge.helper.dart';
import 'package:app/domain/services/injected/room.service.dart';
import 'package:app/infrastructure/abstracts/lockable_view_model.abstract.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ChallengeDialogViewModel extends LockableViewModel {
  final Locker _challengeLocker = Locker();
  final RoomEndpoint _roomEndpoint;
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  Challenge challenge;

  ChallengeDialogViewModel(this._roomEndpoint, this.challenge);

  ///
  /// Build this ViewModel
  ///
  static ChangeNotifierProvider<ChallengeDialogViewModel> buildWithProvider(
      {required Widget Function(BuildContext context, Widget? child)? builder,
      Widget? child,
      required challenge}) {
    return ChangeNotifierProvider<ChallengeDialogViewModel>(
      create: (BuildContext context) =>
          ChallengeDialogViewModel(RoomEndpoint(), challenge),
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

  void finishChallenge(BuildContext context) async {
    if (!locked) {
      lock(_challengeLocker);
      DataResponse response = await _roomEndpoint.updateChallengeState(
          RoomService.injected().room?.id, challenge.id!,
          state: ChallengeHelper.ENDED, proof: File(image?.path ?? ''));
      Challenge? data = response.data<Challenge>();
      unlock(_challengeLocker);
      if (data != null) {
        Navigator.pop(context, true);
      }
    }
  }

  void galleryClick() async {
    // Pick an image
    image = await _picker.pickImage(source: ImageSource.gallery);
  }

  void cameraClick() async {
    // Capture a photo
    image = await _picker.pickImage(source: ImageSource.camera);
  }
}
