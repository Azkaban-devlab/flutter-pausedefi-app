import 'package:app/domain/data/resources/http/dto/requests/room/access.room.dto.dart';
import 'package:app/domain/data/resources/http/endpoints/room.endpoint.dart';
import 'package:app/domain/services/injected/room.service.dart';
import 'package:app/infrastructure/abstracts/lockable_view_model.abstract.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///
/// [RoomJoinViewModel]
///
class RoomJoinViewModel extends LockableViewModel {
  ///
  /// Constructor
  ///
  RoomJoinViewModel();

  Locker joinRoomLocker = Locker();

  TextEditingController accessCodeController = TextEditingController();

  ///
  /// Build this ViewModel
  ///
  static ChangeNotifierProvider<RoomJoinViewModel> buildWithProvider(
      {required Widget Function(BuildContext context, Widget? child)? builder,
      Widget? child}) {
    return ChangeNotifierProvider<RoomJoinViewModel>(
      create: (BuildContext context) => RoomJoinViewModel(),
      builder: builder,
      lazy: false,
      child: child,
    );
  }

  ///
  /// Provide a built ViewModel
  ///
  static RoomJoinViewModel provide(BuildContext context, {bool listen = true}) {
    return Provider.of<RoomJoinViewModel>(context, listen: listen);
  }

  void joinRoom(BuildContext context) async {
    if (accessCodeController.text.isNotEmpty) {
      try {
        await RoomService.injected().accessRoomByCode(context,
            AccessRoomRequestDTO(accessCode: accessCodeController.text));
      } catch (e) {
        //
        print(e);
      }
    }
  }
}
