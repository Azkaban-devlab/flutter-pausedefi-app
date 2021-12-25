import 'dart:async';

import 'package:app/domain/data/models/challenge.model.dart';
import 'package:app/domain/data/models/room.model.dart';
import 'package:app/domain/data/resources/http/dto/responses/room/access.room.dto.dart';
import 'package:app/domain/data/resources/http/endpoints/room.endpoint.dart';
import 'package:app/domain/data/resources/http/models/data.response.dart';
import 'package:app/domain/services/helpers/navigation.helper.dart';
import 'package:app/domain/services/injected/room.service.dart';
import 'package:app/domain/services/ui/dialog.service.dart';
import 'package:app/infrastructure/abstracts/lockable_view_model.abstract.dart';
import 'package:app/presentation/views/screens/room/pages/challenge/challenge.creation.screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///
/// [RoomCreationViewModel]
///
class RoomCreationViewModel extends LockableViewModel {
  ///
  /// Constructor
  ///
  RoomCreationViewModel();

  Locker creationRoomLocker = Locker();

  PageController pageController = PageController();
  TextEditingController roomNameController = TextEditingController();
  int currentIndex = 0;
  double firstTransition = 0;
  double secondTransition = 0;
  String? accessCode;

  Room newRoom = Room();
  List<Challenge> challenges = [];

  Timer? _timer;

  final GlobalKey<FormState> formKey = GlobalKey();

  ///
  /// Build this ViewModel
  ///
  static ChangeNotifierProvider<RoomCreationViewModel> buildWithProvider(
      {required Widget Function(BuildContext context, Widget? child)? builder,
      Widget? child}) {
    return ChangeNotifierProvider<RoomCreationViewModel>(
      create: (BuildContext context) => RoomCreationViewModel(),
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
    if (formKey.currentState!.validate()) {
      newRoom.name = roomNameController.text;
      //notifyListeners();
      pageController.nextPage(
          duration: const Duration(seconds: 1), curve: Curves.ease);
    } // TODO handle this with a formkey
  }

  void submitRoom(BuildContext context) async {
    newRoom.challenges = challenges;
    try {
      accessCode = await RoomService.injected().createRoom(context, newRoom);
    } catch (e) {
      //
    }
    if (accessCode != null) {
      pageController.nextPage(
          duration: const Duration(seconds: 1), curve: Curves.ease);
    } else {
      DialogService.showAlert(
          context, 'Petite erreur', "Votre room n'a pu être créée");
    }
  }

  void accessRoom(BuildContext context) async {
    NavigationHelper.navigateToRoom(context);
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
            duration: const Duration(seconds: 1), curve: Curves.ease);
        break;
      case 2:
        Navigator.pop(context, true);
        break;
      default:
        Navigator.pop(context);
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
      const Duration(milliseconds: 3, microseconds: 1000),
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
