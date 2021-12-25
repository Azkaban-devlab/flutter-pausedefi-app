import 'package:app/application/injections/injector.dart';
import 'package:app/domain/communication/states/auth.state.dart';
import 'package:app/domain/communication/states/room.state.dart';
import 'package:app/domain/data/models/room.model.dart';
import 'package:app/domain/data/resources/http/dto/requests/room/access.room.dto.dart';
import 'package:app/domain/data/resources/http/dto/responses/room/access.room.dto.dart';
import 'package:app/domain/data/resources/http/endpoints/room.endpoint.dart';
import 'package:app/domain/data/resources/http/models/data.response.dart';
import 'package:app/domain/data/resources/http/models/error.response.dart';
import 'package:app/domain/data/resources/storage/dao/room.dao.dart';
import 'package:app/domain/services/helpers/navigation.helper.dart';
import 'package:app/domain/services/ui/dialog.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

///
/// [RoomService]
///
@singleton
class RoomService {
  ///
  /// [RoomEndpoint]
  ///
  late RoomEndpoint _roomEndpoint;

  ///
  /// [RoomDAO]
  ///
  final RoomDAO roomDAO;

  ///
  /// [AuthState]
  late RoomState roomState;

  ///
  /// Constructor
  ///
  RoomService(this.roomDAO) {
    roomState = RoomState();
    _roomEndpoint = RoomEndpoint();
  }

  ///
  /// Get injected [RoomService]
  ///
  factory RoomService.injected() => injector<RoomService>();

  ///
  /// Get current room
  ///
  Room? get room => roomState.room;

  ///
  /// Authenticate
  ///
  Future<String?> createRoom(BuildContext context, Room room) async {
    DialogService.showLoadingDialog(context);
    try {
      final AccessRoomResponseDTO response =
          await _roomEndpoint.createRoom(room);
      await reload(id: response.id);
      DialogService.closeLoadingDialog(context);
      return response.accessCode;
    } catch (e) {
      //
      DialogService.closeLoadingDialog(context);
      return null;
    }
  }

  Future<void> accessRoomByCode(
      BuildContext context, AccessRoomRequestDTO accessCode) async {
    DialogService.showLoadingDialog(context);
    try {
      final DataResponse response = await _roomEndpoint.accessRoom(accessCode);
      final Room? data = response.data<Room>();
      if (data != null) {
        await _processAccessRoom(data);
      }
    } catch (e) {
      //
      print(e);
    }
    DialogService.closeLoadingDialog(context);
    if (await reload()) {
      NavigationHelper.navigateToRoom(context);
    }
  }

  ///
  /// access room
  ///
  Future<void> accessRoom(BuildContext context, Room room) async {
    await _processAccessRoom(room);
    NavigationHelper.navigateToRoom(context);
  }

  ///
  /// exit room
  ///
  Future<void> exitRoom(BuildContext context) async {
    DialogService.showLoadingDialog(context);
    await roomDAO.drop();
    roomState.clearAll();
    DialogService.closeLoadingDialog(context);
    NavigationHelper.navigateToHome(context);
  }

  ///
  /// Initialize the service
  ///
  Future<void> initialize() async {
    await reset(clear: false);
    reload();
  }

  /// reload user from api
  Future<bool> reload({int? id}) async {
    try {
      final DataResponse response =
          await _roomEndpoint.getRoomById(id ?? room!.id!);
      final Room? data = response.data<Room>();
      if (data != null) {
        roomState.setRoom(data);
        roomDAO.saveRoom(data);
        return true;
      }
    } catch (e) {
      if (e is ErrorResponse) {
        // Handle error from server
      }
    }
    return false;
  }

  ///
  /// Reset the service
  ///
  Future<void> reset({bool clear = true}) async {
    try {
      if (clear) roomState.clearAll();

      final Room? room = await roomDAO.getRoom();

      roomState.fill(room: room);
    } catch (e) {
      //
    }
  }

  /// check if the user is authenticated
  /// otherwise redirect him to the authenticatio process
  Future<bool> checkAndRedirect(BuildContext context) async {
    final bool checked = room != null;
    if (!checked) {
      // TODO Redirect the user to the authentication process
      // Await all the process using async/await before returning the
      // response true or false
    }

    return checked;
  }

  Future<bool> _processAccessRoom(Room room) async {
    try {
      roomDAO.saveRoom(room);
      await reset();
      return await reload();
    } catch (e) {
      //
    }

    return false;
  }
}
