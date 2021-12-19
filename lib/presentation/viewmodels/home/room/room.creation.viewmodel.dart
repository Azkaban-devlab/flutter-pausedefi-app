import 'dart:async';

import 'package:app/domain/data/models/challenge.model.dart';
import 'package:app/domain/data/models/room.model.dart';
import 'package:app/domain/data/resources/http/dto/responses/room/access.room.dto.dart';
import 'package:app/domain/data/resources/http/endpoints/room.endpoint.dart';
import 'package:app/domain/data/resources/http/models/data.response.dart';
import 'package:app/domain/services/ui/dialog.service.dart';
import 'package:app/infrastructure/abstracts/lockable_view_model.abstract.dart';
import 'package:app/presentation/views/screens/main/pages/challenge/challenge.creation.screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///
/// [RoomCreationViewModel]
///
class RoomCreationViewModel extends LockableViewModel {
  ///
  /// Constructor
  ///
  RoomCreationViewModel(this._roomEndpoint);

  Locker creationRoomLocker = Locker();
  final RoomEndpoint _roomEndpoint;

  PageController pageController = PageController();
  TextEditingController roomNameController = TextEditingController();
  int currentIndex = 0;
  double firstTransition = 0;
  double secondTransition = 0;
  String? accessCode;

  Room newRoom = Room();
  List<Challenge> challenges = [];

  Timer? _timer;

  ///
  /// Build this ViewModel
  ///
  static ChangeNotifierProvider<RoomCreationViewModel> buildWithProvider(
      {required Widget Function(BuildContext context, Widget? child)? builder,
      Widget? child}) {
    return ChangeNotifierProvider<RoomCreationViewModel>(
      create: (BuildContext context) => RoomCreationViewModel(RoomEndpoint()),
      builder: builder,
      lazy: false,
      child: child,
    );
  }

  ///
  /// Provide a built ViewModel
  ///
  static RoomCreationViewModel provide(BuildContext context,
      {bool listen = true}) {
    return Provider.of<RoomCreationViewModel>(context, listen: listen);
  }

  void initRoom() {
    if (roomNameController.text.isNotEmpty) {
      newRoom.name = roomNameController.text;
      notifyListeners();
      pageController.nextPage(
          duration: const Duration(milliseconds: 3), curve: Curves.bounceIn);
    } // TODO handle this with a formkey
  }

  void submitRoom(BuildContext context) async {
    DialogService.showLoadingDialog(context);
    newRoom.challenges = challenges;
    try {
      final AccessRoomDTO response = await _roomEndpoint.createRoom(newRoom);
      accessCode = response.accessCode!;
    } catch (e) {
      //
      print(e);
    }
    DialogService.closeLoadingDialog(context);
    if (accessCode != null) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 3), curve: Curves.bounceIn);
    } else {
      DialogService.showAlert(
          context, 'Petite erreur', "Votre room n'a pu être créée");
    }
  }

  void addEditChallenge(BuildContext context, {Challenge? challenge}) async {
    Challenge? response = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => ChallengeCreationScreen(
                  isFromRoomCreation: true,
                  challenge: challenge,
                )));
    if (response != null && !challenges.contains(response)) {
      challenges.add(response);
      notifyListeners();
    }
  }

  void removeChallenge(Challenge challenge) {
    if (challenges.contains(challenge)) {
      challenges.remove(challenge);
      notifyListeners();
    }
  }

  void navigateBackPage(BuildContext context) {
    switch (currentIndex) {
      case 0:
        Navigator.pop(context);
        break;
      case 1:
        pageController.previousPage(
            duration: const Duration(milliseconds: 3), curve: Curves.bounceIn);
        break;
      case 2:
        pageController.previousPage(
            duration: const Duration(milliseconds: 3), curve: Curves.bounceIn);
        break;
      default:
        break;
    }
  }

  void startTransition(int index) {
    if (_timer != null) {
      _timer?.cancel();
    }
    bool isSecondTransition =
        (index == 1 && currentIndex > index) || index == 2;
    _timer = Timer.periodic(
      const Duration(milliseconds: 3),
      (Timer timer) {
        if (index == 1 && currentIndex > index) {
          secondTransition = 1 - (timer.tick.toDouble() / 60);
        } else if (index == 2) {
          secondTransition = timer.tick.toDouble() / 60;
        } else if (currentIndex > index) {
          firstTransition = 1 - (timer.tick.toDouble() / 60);
        } else {
          firstTransition = timer.tick.toDouble() / 60;
        }
        notifyListeners();
        if (isSecondTransition
            ? secondTransition == (currentIndex > index ? 0 : 1)
            : firstTransition == (currentIndex > index ? 0 : 1)) {
          currentIndex = index;
          firstTransition = 0;
          secondTransition = 0;
          timer.cancel();
          notifyListeners();
        }
      },
    );
  }
}
