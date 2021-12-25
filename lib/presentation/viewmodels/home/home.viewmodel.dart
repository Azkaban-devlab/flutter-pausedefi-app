import 'package:app/domain/data/models/room.model.dart';
import 'package:app/domain/data/resources/http/endpoints/user.endpoint.dart';
import 'package:app/domain/data/resources/http/models/data.response.dart';
import 'package:app/domain/services/injected/room.service.dart';
import 'package:app/infrastructure/abstracts/lockable_view_model.abstract.dart';
import 'package:app/presentation/views/screens/room/pages/home/room/room.creation.screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///
/// [HomeViewModel]
///
class HomeViewModel extends LockableViewModel {
  ///
  /// Constructor
  ///
  HomeViewModel(this._userEndpoint);

  final UserEndpoint _userEndpoint;

  Locker homeLocker = Locker();

  List<Room> rooms = [];

  ///
  /// Build this ViewModel
  ///
  static ChangeNotifierProvider<HomeViewModel> buildWithProvider(
      {required Widget Function(BuildContext context, Widget? child)? builder,
      Widget? child}) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (BuildContext context) =>
          HomeViewModel(UserEndpoint())..loadData(),
      builder: builder,
      lazy: false,
      child: child,
    );
  }

  ///
  /// Provide a built ViewModel
  ///
  static HomeViewModel provide(BuildContext context, {bool listen = true}) {
    return Provider.of<HomeViewModel>(context, listen: listen);
  }

  ///
  /// Load Data
  ///
  void loadData({bool refresh = true}) async {
    if (!locked) {
      lock(homeLocker);
      try {
        DataResponse response = await _userEndpoint.myRooms();
        final List<Room>? data = response.data<List<Room>>();
        if (data != null) {
          if (refresh) {
            rooms.clear();
          }
          rooms.addAll(data);
        }
      } catch (e, s) {
        print(e);
        print(s);
      }
      unlock(homeLocker);
    }
  }

  void reloadData() => loadData(refresh: true);

  void selectRoom(BuildContext context, Room room) async {
    try {
      await RoomService.injected().accessRoom(context, room);
    } catch (e) {
      //
    }
  }
}
