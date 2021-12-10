import 'package:app/infrastructure/interfaces/storage.interface.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Uncomment the line below if there's another
// service that must be instanciate for
// StorageInterface
///
/// [LocalStorage]
///
@Singleton(as: IStorage)
class LocalStorage implements IStorage {
  ///
  /// [SharedPreferences]
  ///
  final SharedPreferences preferences;

  ///
  /// Constructor
  ///
  LocalStorage(this.preferences);

  @override
  Future<void> save(String key, dynamic content) async {
    if (content is String) {
      await preferences.setString(key, content);
    }
    if (content is bool) {
      await preferences.setBool(key, content);
    }
    if (content is int) {
      await preferences.setInt(key, content);
    }
    if (content is double) {
      await preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      await preferences.setStringList(key, content);
    }
  }

  /// Get data from storage
  ///
  dynamic get(String key) {
    return preferences.get(key);
  }

  @override
  Future<bool> delete(String? key) {
    return preferences.remove(key!);
  }

  @override
  Future<bool> exists(String key) {
    return Future<bool>.sync(() => preferences.containsKey(key));
  }

  @override
  Future<dynamic> retrieve(String key) {
    return Future<dynamic>.sync(() => get(key));
  }

  @override
  Future<bool?> retrieveBool(String key) {
    return Future<bool?>.sync(() => preferences.getBool(key));
  }

  @override
  Future<double?> retrieveDouble(String key) {
    return Future<double?>.sync(() => preferences.getDouble(key));
  }

  @override
  Future<int?> retrieveInt(String key) {
    return Future<int?>.sync(() => preferences.getInt(key));
  }

  @override
  Future<String?> retrieveString(String key) {
    return Future<String?>.sync(() => preferences.getString(key));
  }

  @override
  Future<List<String>?> retrieveStringList(String key) {
    return Future<List<String>?>.sync(() => preferences.getStringList(key));
  }
}
