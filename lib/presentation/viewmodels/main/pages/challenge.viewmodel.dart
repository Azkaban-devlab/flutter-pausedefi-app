import 'package:app/domain/data/models/challenge.model.dart';
import 'package:app/domain/data/models/user.model.dart';
import 'package:app/domain/data/resources/http/endpoints/room.endpoint.dart';
import 'package:app/domain/data/resources/http/models/data.response.dart';
import 'package:app/domain/services/injected/room.service.dart';
import 'package:app/domain/services/ui/dialog.service.dart';
import 'package:app/infrastructure/abstracts/extension/enum_extension.dart';
import 'package:app/infrastructure/abstracts/lockable_view_model.abstract.dart';
import 'package:app/presentation/views/screens/room/pages/challenge/challenge.creation.screen.dart';
import 'package:app/presentation/views/widgets/custom/dialog.challenge.state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retrofit/retrofit.dart';

class ChallengeMainViewModel extends LockableViewModel {
  PageController pageController = PageController();
  List<Challenge> challengeSend = [];
  List<Challenge> challengeInProgress = [];
  List<Challenge> challengeDone = [];
  List<Challenge> challengeIdea = [];
  List<User> selectedUsers = [];
  List<User> challengers = [];
  bool addChallenger = false;
  Challenge? selectedIdea;
  Challenge? newChallenge;
  final Locker _challengeLocker = Locker();
  final RoomEndpoint _roomEndpoint;
  int index = 0;

  ChallengeMainViewModel(this._roomEndpoint);

  ///
  /// Build this ViewModel
  ///
  static ChangeNotifierProvider<ChallengeMainViewModel> buildWithProvider(
      {required Widget Function(BuildContext context, Widget? child)? builder,
      Widget? child}) {
    return ChangeNotifierProvider<ChallengeMainViewModel>(
      create: (BuildContext context) =>
          ChallengeMainViewModel(RoomEndpoint())..loadData(),
      builder: builder,
      lazy: false,
      child: child,
    );
  }

  ///
  /// Provide a built ViewModel
  ///
  static ChallengeMainViewModel provide(BuildContext context,
      {bool listen = true}) {
    return Provider.of<ChallengeMainViewModel>(context, listen: listen);
  }

  void updatePage(int idx) {
    index = idx;
    notifyListeners();
    pageController.jumpToPage(idx);
  }

  void reloadData() => loadData(refresh: true);

  void loadData({bool refresh = false}) async {
    if (refresh) {
      challengeSend.clear();
      challengeIdea.clear();
      challengeDone.clear();
      challengers.clear();
      challengeInProgress.clear();
    }
    if (!locked) {
      lock(_challengeLocker);
      try {
        List<DataResponse> responses = await Future.wait([
          _roomEndpoint.getMyChallenge(RoomService.injected().room?.id ?? 0),
          _roomEndpoint.getMyChallenge(RoomService.injected().room?.id ?? 0,
              state: 'send'),
          _roomEndpoint.getIdeaChallenge(RoomService.injected().room?.id ?? 0),
          _roomEndpoint.getUserInRoom(RoomService.injected().room?.id ?? 0),
        ]);
        final List<Challenge>? userChallenge =
            responses[0].data<List<Challenge>>();
        final List<Challenge>? sendChallenge =
            responses[1].data<List<Challenge>>();
        final List<Challenge>? ideaChallenge =
            responses[2].data<List<Challenge>>();
        final List<User>? users = responses[3].data<List<User>>();
        if (userChallenge != null) {
          for (Challenge challenge in userChallenge) {
            if (challenge.state == ChallengeState.in_progress.toShortString()) {
              challengeInProgress.add(challenge);
            } else {
              challengeDone.add(challenge);
            }
          }
        }
        if (sendChallenge != null) {
          challengeSend.addAll(sendChallenge);
        }
        if (ideaChallenge != null) {
          challengeIdea.addAll(ideaChallenge);
        }
        if (users != null) {
          challengers.addAll(users);
        }
      } catch (e) {
        //
      }
      unlock(_challengeLocker);
    }
  }

  void selectChallenge(Challenge challenge) {
    if (selectedIdea == challenge) {
      selectedIdea = null;
    } else {
      selectedIdea = challenge;
    }
    notifyListeners();
  }

  void selectChallengers(User user) {
    if (selectedUsers.contains(user)) {
      selectedUsers.remove(user);
    } else {
      selectedUsers.add(user);
    }
    notifyListeners();
  }

  void updatePageCreateChallenge() {
    addChallenger = !addChallenger;
    notifyListeners();
  }

  void navigateToCreateChallenge(BuildContext context) async {
    Challenge? response = await Navigator.push(context,
        MaterialPageRoute(builder: (_) => const ChallengeCreationScreen()));
    if (response != null) {
      newChallenge = response;
      updatePageCreateChallenge();
    }
  }

  void sendChallenge() async {
    bool succeed = false;
    if (newChallenge != null) {
      newChallenge?.challengers = selectedUsers;
      HttpResponse response = await _roomEndpoint.createChallenge(
          RoomService.injected().room?.id ?? 0, newChallenge!);
      if (response.response.statusCode == 204) {
        succeed = true;
      }
    } else {
      List<int> ids = [];
      for (User user in selectedUsers) {
        ids.add(user.id!);
      }
      HttpResponse response = await _roomEndpoint.addChallengerToChallenge(
          RoomService.injected().room?.id ?? 0,
          selectedIdea?.id ?? 0,
          {'challengers': ids});
      if (response.response.statusCode == 204) {
        succeed = true;
      }
    }
    if (succeed) {
      pageController.jumpToPage(0);
      index = 0;
      updatePageCreateChallenge();
      reloadData();
    }
  }

  void openDialog(Challenge challenge, BuildContext context) async {
    var response = await DialogService.showCustomDialog(
        context, (context) => DialogChallengeState(challenge: challenge));
    if (response == true) {
      reloadData();
    }
  }
}
