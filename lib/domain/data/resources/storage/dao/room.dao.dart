import 'package:app/domain/data/models/room.model.dart';
import 'package:app/domain/data/models/user.model.dart';
import 'package:app/domain/services/helpers/utils.helper.dart';
import 'package:app/infrastructure/abstracts/dao.abstract.dart';
import 'package:app/infrastructure/interfaces/storage.interface.dart';
import 'package:app/infrastructure/mixins/json_serializable.mixin.dart';
import 'package:injectable/injectable.dart';

///
/// [RoomDAO]
///
@singleton
class RoomDAO extends DAO {
  ///
  /// [StorageInterface]
  ///
  final IStorage storage;
  static const String _roomKey = 'room_key';

  ///
  /// Constructor
  ///
  RoomDAO(this.storage) : super('rooms_');

  ///
  /// Save [room] info
  ///
  Future<String?> saveRoom(Room room) async {
    final String json = room.serialize();
    await storage.save(getKey(_roomKey), json);

    return _roomKey;
  }

  ///
  /// Get saved room by key
  ///
  Future<Room?> getRoom() async {
    final String? data = await storage.retrieveString(getKey(_roomKey));
    return data != null ? JsonSerializableMixin.fromJson<Room>(data) : null;
  }

  @override
  Future<bool> drop() {
    return storage.delete('rooms_');
  }
}
