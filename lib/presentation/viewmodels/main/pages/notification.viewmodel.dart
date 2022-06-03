import 'package:app/domain/data/models/challenge.model.dart';
import 'package:app/domain/data/resources/http/models/data.response.dart';
import 'package:app/domain/services/helpers/challenge.helper.dart';
import 'package:app/infrastructure/abstracts/lockable_view_model.abstract.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/data/resources/http/endpoints/room.endpoint.dart';
import '../../../../domain/services/injected/room.service.dart';
import '../../../views/widgets/custom/notification.challenge.widget.dart';

class NotificationViewModel extends LockableViewModel {
  final Locker _notificationLocker = Locker();
  final RoomEndpoint _roomEndpoint;
  List<Challenge> challenges = [];
  bool updateState = false;

  NotificationViewModel(this._roomEndpoint);

  ///
  /// Build this ViewModel
  ///
  static ChangeNotifierProvider<NotificationViewModel> buildWithProvider(
      {required Widget Function(BuildContext context, Widget? child)? builder,
      Widget? child}) {
    return ChangeNotifierProvider<NotificationViewModel>(
      create: (BuildContext context) =>
          NotificationViewModel(RoomEndpoint())..loadData(),
      builder: builder,
      lazy: false,
      child: child,
    );
  }

  ///
  /// Provide a built ViewModel
  ///
  static NotificationViewModel provide(BuildContext context,
      {bool listen = true}) {
    return Provider.of<NotificationViewModel>(context, listen: listen);
  }

  void loadData({bool refresh = false}) async {
    if (refresh) {
      challenges.clear();
    }
    if (!locked) {
      lock(_notificationLocker);
      try {
        DataResponse response = await _roomEndpoint
            .getMyNotifications(RoomService.injected().room?.id ?? 0);
        challenges.addAll(response.many<Challenge>());
      } catch (e) {
        print(e);
      }
      unlock(_notificationLocker);
    }
  }

  void setUpdateState(bool newState) {
    updateState = newState;
    notifyListeners();
  }

  void onAccept(int index) async {
    if (!updateState) {
      setUpdateState(true);
      DataResponse response = await _roomEndpoint.updateChallengeState(
          RoomService.injected().room?.id, challenges[index].id!,
          state: ChallengeHelper.ACCEPTED);
      if (response.data<Challenge>() != null) {
        challenges[index] = response.data<Challenge>()!;
      }
      setUpdateState(false);
    }
  }

  void onRefuse(int index) async {
    if (!updateState) {
      setUpdateState(true);
      DataResponse response = await _roomEndpoint.updateChallengeState(
          RoomService.injected().room!.id, challenges[index].id!,
          state: ChallengeHelper.REFUSED);
      if (response.data<Challenge>() != null) {
        challenges[index] = response.data<Challenge>()!;
      }
      setUpdateState(false);
    }
  }

  void validate(int index) async {
    if (!updateState) {
      setUpdateState(true);
      DataResponse response = await _roomEndpoint.updateChallengeState(
          RoomService.injected().room!.id, challenges[index].id!,
          userId: challenges[index].user?.id, state: ChallengeHelper.SUCCEED);
      if (response.data<Challenge>() != null) {
        challenges.remove(challenges[index]);
      }
      setUpdateState(false);
    }
  }

  void failed(int index) async {
    if (!updateState) {
      setUpdateState(true);
      DataResponse response = await _roomEndpoint.updateChallengeState(
          RoomService.injected().room!.id, challenges[index].id!,
          userId: challenges[index].user?.id, state: ChallengeHelper.FAILED);
      if (response.data<Challenge>() != null) {
        challenges.remove(challenges[index]);
      }
      setUpdateState(false);
    }
  }

  Widget getCorrectNotificationWidget(int index) {
    Challenge challenge = challenges[index];
    switch (challenge.state) {
      case ChallengeHelper.SUCCEED:
      case ChallengeHelper.FAILED:
        return NotificationEndWidget(challenge);
      case ChallengeHelper.PENDING:
      case ChallengeHelper.ACCEPTED:
      case ChallengeHelper.REFUSED:
        return NotificationChallengeWidget(
            challenge, () => onAccept(index), () => onRefuse(index));
      case ChallengeHelper.ENDED:
        return NotificationProofWidget(
            challenge, () => validate(index), () => failed(index));
      default:
        return Container();
    }
  }
}
