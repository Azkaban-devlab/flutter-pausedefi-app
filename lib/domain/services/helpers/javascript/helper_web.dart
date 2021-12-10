// ignore: avoid_web_libraries_in_flutter
import 'dart:js' show context;

/// api url
String? apiUrl = _nullOrNotEmpty<String>('apiUrl');

/// site url
String? siteUrl = _nullOrNotEmpty<String>('siteUrl');

/// app name
String? appName = _nullOrNotEmpty<String>('appName');

/// is TV
bool isTV = _nullOrNotEmpty<bool>('isTV') ?? false;

T? _nullOrNotEmpty<T>(String key) {
  // ignore: always_specify_types
  final dynamic v = context[key];

  return v != null && v is T ? (v is String && v.isEmpty ? null : v) : null;
}

/// Update web url
void updateWebUrl(String path) {
  context.callMethod('updateUrl', <dynamic>[path]);
}

/// Update web page title
void updateWebTitle(String title) {
  context.callMethod('updateTitle', <dynamic>[title]);
}

/// Get url path
String? getUrlPath() {
  return context.callMethod('getUrlPath') as String;
}

/// Get full url path
String? getFullUrlPath() {
  return context.callMethod('getFullUrlPath') as String;
}
