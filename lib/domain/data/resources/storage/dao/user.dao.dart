import 'package:app/domain/data/models/user.model.dart';
import 'package:app/domain/services/helpers/utils.helper.dart';
import 'package:app/infrastructure/abstracts/dao.abstract.dart';
import 'package:app/infrastructure/interfaces/storage.interface.dart';
import 'package:app/infrastructure/mixins/json_serializable.mixin.dart';
import 'package:injectable/injectable.dart';

///
/// [UserDAO]
///
@singleton
class UserDAO extends DAO {
  ///
  /// [StorageInterface]
  ///
  final IStorage storage;

  ///
  /// Constructor
  ///
  UserDAO(this.storage) : super('users_');

  ///
  /// Save [user] info
  ///
  Future<String?> saveUser(User user) async {
    final String json = user.serialize();
    final String key = getKeyFromUser(user);
    await storage.save(key, json);

    return key;
  }

  ///
  /// Get saved user by hashId
  ///
  Future<User?> getUserByHashId(String hashId) {
    return getUser(hashId);
  }

  ///
  /// Get saved user by email
  ///
  Future<User?> getUserByEmail(String email) {
    return getUser(UtilsHelper.hashString(email));
  }

  ///
  /// Get saved user by [email] or [hashId]
  ///
  Future<User?> getUserBy(String email, String hashId) async {
    return await getUserByEmail(email) ?? await getUserByHashId(hashId);
  }

  ///
  /// Get saved user by key
  ///
  Future<User?> getUser(String key) async {
    final String? data = await storage.retrieveString(getKey(key));
    return data != null ? JsonSerializableMixin.fromJson<User>(data) : null;
  }

  ///
  /// Get saved user by specific key
  ///
  Future<User?> getDirectUser(String key) async {
    final String? data = await storage.retrieveString(key);
    return data != null ? JsonSerializableMixin.fromJson<User>(data) : null;
  }

  ///
  /// Get key for data saved or to save
  ///
  String getKeyFromUser(User user) {
    if (user.hashId != null) {
      return getKey(user.hashId!);
    } else {
      return getKey(UtilsHelper.hashString(user.email!));
    }
  }

  @override
  Future<bool> drop() {
    return storage.delete('users_');
  }
}
