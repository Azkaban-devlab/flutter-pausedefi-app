import 'package:app/domain/data/models/user.model.dart';
import 'package:app/domain/data/resources/storage/dao/user.dao.dart';
import 'package:app/infrastructure/abstracts/dao.abstract.dart';
import 'package:app/infrastructure/interfaces/storage.interface.dart';
import 'package:injectable/injectable.dart';

@singleton

///
/// [AuthDAO]
///
class AuthDAO extends DAO {
  static const String _authKey = 'auth_key';

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _expiresTimestampKey = 'expires_timestamp';
  static const String _hashIdKey = 'hash_id';

  ///
  /// [StorageInterface]
  ///
  final IStorage storage;

  ///
  /// [UserDAO]
  ///
  final UserDAO userDAO;

  ///
  /// Default cosntructor
  ///
  AuthDAO(this.storage, this.userDAO) : super('auth_');

  @override
  Future<bool> drop() async {
    final String? key = await storage.retrieveString(getKey(_authKey));
    await storage.delete(key);
    return await storage.delete(getKey(_accessTokenKey)) &&
        await storage.delete(getKey(_refreshTokenKey)) &&
        await storage.delete(getKey(_hashIdKey)) &&
        await storage.delete(getKey(_expiresTimestampKey)) &&
        await storage.delete(getKey(_authKey));
  }

  ///
  /// Get Access Token
  ///
  Future<String?> getAccessToken() async {
    return storage.retrieveString(getKey(_accessTokenKey));
  }

  ///
  /// Get user hash id
  ///
  Future<String?> getHashId() {
    return storage.retrieveString(getKey(_hashIdKey));
  }

  ///
  /// Get expires timestamp in milliseconds
  ///
  Future<int?> getExpiresTimestamp() {
    return storage.retrieveInt(getKey(_expiresTimestampKey));
  }

  ///
  /// Get Refresh Token
  ///
  Future<String?> getRefreshToken() async =>
      storage.retrieveString(getKey(_refreshTokenKey));

  ///
  /// Get [User]
  ///
  Future<User?> getUser() async {
    final String? key = await storage.retrieveString(getKey(_authKey));
    return key == null ? null : await userDAO.getDirectUser(key);
  }

  ///
  /// Check if the api tokens were saved
  ///
  Future<bool> hasApiTokens() async {
    return await storage.exists(getKey(
        _accessTokenKey)); //&& await storage.exists(getKey(_refreshTokenKey));
  }

  ///
  /// Save Api Tokens
  ///
  Future<void> saveApiTokens(String? accessToken,
      {String? refreshToken, int? expiresTimestamp}) async {
    await storage.save(getKey(_accessTokenKey), accessToken);
    //await storage.save(getKey(_refreshTokenKey), refreshToken);
    //await storage.save(getKey(_expiresTimestampKey), expiresTimestamp);
  }

  ///
  /// Save Hash ID
  ///
  Future<void> saveHashId(String? hashId) async {
    await storage.save(getKey(_hashIdKey), hashId);
  }

  ///
  /// Save [User]
  ///
  Future<void> saveUser(User user) async {
    final String? key = await userDAO.saveUser(user);
    await storage.save(getKey(_authKey), key);
    if (user.hashId != null) await saveHashId(user.hashId);
  }
}
