///
/// [IStorage]
///
abstract class IStorage {
  ///
  /// Save an item
  ///
  Future<void> save(String key, dynamic content);

  ///
  /// Retrieve an item by [key]
  ///
  Future<dynamic> retrieve(String key);

  ///
  /// Retrieve an item by [key]
  ///
  Future<String?> retrieveString(String key);

  ///
  /// Retrieve as bool by [key]
  ///
  Future<bool?> retrieveBool(String key);

  ///
  /// Retrieve as int by [key]
  ///
  Future<int?> retrieveInt(String key);

  ///
  /// Retrieve as double as [String] by [key]
  ///
  Future<double?> retrieveDouble(String key);

  ///
  /// Retrieve an List of String by [key]
  ///
  Future<List<String>?> retrieveStringList(String key);

  ///
  /// Delete an item by [key]
  ///
  Future<bool> delete(String? key);

  ///
  /// Check if an item exists
  ///
  Future<bool> exists(String key);
}
