///
/// [DAO] Data Access Object
///
abstract class DAO {
  ///
  /// Prefix of the table
  ///
  final String prefix;

  ///
  /// Constructor
  ///
  DAO(this.prefix);

  ///
  /// Get a key for each item
  ///
  String getKey(String baseKey) {
    return prefix + baseKey;
  }

  ///
  /// Drop the table in the database
  ///
  Future<bool> drop();
}
