///
/// [Environment]
///
enum Environment {
  /// Development Environment
  development,

  /// Production Environment
  production,

  /// test Environment
  test,
}

///
/// [Parameters]
///
class AppConfig {
  /// App Name
  final String? appName;

  /// Server url
  final String? serverUrl;

  ///
  /// Constructor
  ///
  const AppConfig({
    this.appName,
    this.serverUrl,
  });
}
