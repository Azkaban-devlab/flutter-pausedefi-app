import 'package:app/domain/data/models/room.model.dart';
import 'package:app/domain/data/models/user.model.dart';
import 'package:flutter/widgets.dart';

/// [RoomState]
///
/// Global app state that represent authentication state
///
class RoomState extends ChangeNotifier {
  Room? _room;

  /// [Room]
  Room? get room => _room;

  /// clear the state
  void clear({
    bool clearRoom = false,
  }) {
    if (clearRoom) _room = null;
    notifyListeners();
  }

  /// clear the state
  void clearAll() {
    clear(clearRoom: true);
  }

  /// fill the state
  void fill({
    Room? room,
  }) {
    if (room != null) {
      _room = room;
    }

    notifyListeners();
  }

  /// Set the room
  void setRoom(Room room) {
    _room = room;
    notifyListeners();
  }
}
