import 'package:app/domain/data/models/user.model.dart';
import 'package:flutter/widgets.dart';

/// [AuthState]
///
/// Global app state that represent authentication state
///
class AuthState extends ChangeNotifier {
  User? _user;
  String? _accessToken;
  String? _refreshToken;

  /// Access token for authenticated request
  String? get accessToken => _accessToken;

  /// Refresh token to refesh access token
  String? get refreshToken => _refreshToken;

  /// [User]
  /// Authenticated user
  User? get user => _user;

  /// clear the state
  void clear({
    bool clearUser = false,
    bool clearAccessToken = false,
    bool clearRefreshToken = false,
  }) {
    if (clearUser) _user = null;
    if (clearAccessToken) _accessToken = null;
    if (clearRefreshToken) _refreshToken = null;

    notifyListeners();
  }

  /// clear the state
  void clearAll() {
    clear(clearAccessToken: true, clearRefreshToken: true, clearUser: true);
  }

  /// fill the state
  void fill({
    User? user,
    String? accessToken,
    String? refreshToken,
  }) {
    if (user != null) {
      _user = user;
    }
    if (accessToken != null) {
      _accessToken = accessToken;
    }
    if (refreshToken != null) {
      _refreshToken = refreshToken;
    }

    notifyListeners();
  }

  /// Set the access token
  void setAccessToken(String accessToken) {
    _accessToken = accessToken;
    notifyListeners();
  }

  /// Set the access token
  void setRefreshToken(String refreshToken) {
    _refreshToken = refreshToken;
    notifyListeners();
  }

  /// Set the user
  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
