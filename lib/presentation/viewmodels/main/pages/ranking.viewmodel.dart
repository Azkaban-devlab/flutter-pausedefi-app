import 'package:app/domain/data/models/user.model.dart';
import 'package:app/domain/data/resources/http/endpoints/room.endpoint.dart';
import 'package:app/domain/data/resources/http/models/data.response.dart';
import 'package:app/domain/services/injected/room.service.dart';
import 'package:app/infrastructure/abstracts/lockable_view_model.abstract.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RankingViewModel extends LockableViewModel {
  final Locker _rankingLocker = Locker();
  final RoomEndpoint _roomEndpoint;
  List<User> podiums = [];
  List<User> rankings = [];
  ScrollController rankingController = ScrollController();

  RankingViewModel(this._roomEndpoint);

  ///
  /// Build this ViewModel
  ///
  static ChangeNotifierProvider<RankingViewModel> buildWithProvider(
      {required Widget Function(BuildContext context, Widget? child)? builder,
      Widget? child}) {
    return ChangeNotifierProvider<RankingViewModel>(
      create: (BuildContext context) =>
          RankingViewModel(RoomEndpoint())..init(context),
      builder: builder,
      lazy: false,
      child: child,
    );
  }

  ///
  /// Provide a built ViewModel
  ///
  static RankingViewModel provide(BuildContext context, {bool listen = true}) {
    return Provider.of<RankingViewModel>(context, listen: listen);
  }

  void init(BuildContext context) {
    loadData();
    AutoTabsRouter.of(context).addListener(() {
      final int activeIndex = AutoTabsRouter.of(context).activeIndex;
      if (activeIndex == 2) {
        loadData();
      }
    });
  }

  Future<void> reloadData() async => loadData();

  void loadData() async {
    if (!locked) {
      lock(_rankingLocker);
      try {
        DataResponse response = await _roomEndpoint.getUserInRoom(
            RoomService.injected().room?.id ?? 0,
            orderBy: 'points');
        List<User>? data = response.data<List<User>>();
        if (data != null) {
          if (data.length > 3) {
            podiums = data.sublist(0, 3);
            rankings = data.sublist(3);
          } else {
            podiums = data;
          }
        }
      } catch (e) {
        //
      }
      unlock(_rankingLocker);
    }
  }
}
