import 'package:app/application/injections/injector.dart';
import 'package:app/application/kernel/app_helpers.dart';
import 'package:app/domain/communication/states/auth.state.dart';
import 'package:app/domain/data/models/user.model.dart';
import 'package:app/domain/data/resources/http/dto/responses/auth/login.dto.dart';
import 'package:app/domain/data/resources/http/endpoints/auth.endpoint.dart';
import 'package:app/domain/data/resources/http/endpoints/user.endpoint.dart';
import 'package:app/domain/data/resources/http/models/data.response.dart';
import 'package:app/domain/data/resources/http/models/error.response.dart';
import 'package:app/domain/data/resources/storage/dao/auth.dao.dart';
import 'package:app/domain/services/helpers/navigation.helper.dart';
import 'package:app/domain/services/ui/dialog.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

///
/// [AuthenticationService]
///
@singleton
class AuthenticationService {
  ///
  /// Authentication key
  ///
  static const String authenticationKey = 'authentication-key';

  ///
  /// [AuthDAO]
  ///
  final AuthDAO authDAO;

  ///
  /// [AuthEndpoint]
  ///
  late AuthEndpoint authEndpoint;

  ///
  /// [UserEndpoint]
  late UserEndpoint userEndpoint;

  ///
  /// [AuthState]
  late AuthState authState;

  ///
  /// Constructor
  ///
  AuthenticationService(this.authDAO) {
    authState = AuthState();
    authEndpoint = AuthEndpoint();
    userEndpoint = UserEndpoint();
  }

  ///
  /// Get injected [AuthenticationService]
  ///
  factory AuthenticationService.injected() => injector<AuthenticationService>();

  ///
  /// Check user is authenticated
  ///
  /// TODO Update this section to match your work
  ///
  bool get authenticated => authState.user != null;

  ///
  /// Get authenticated user
  ///
  User? get user => authState.user;

  ///
  /// Authenticate
  ///
  Future<void> authenticate(
      BuildContext context, AuthenticationData data) async {
    DialogService.showLoadingDialog(context);
    try {
      final User user = User();
      user.email = data.email;
      user.firstName = data.email;
      await authDAO.saveUser(user);
      await reset();
    } catch (e) {
      // Beware. This just example. In real you should not emitted for every kind of error.
    }
    // try {
    //   final LoginResponseDTO response = await authEndpoint
    //       .login(LoginRequestDTO(email: data.email, password: data.password));
    //   await _processAuthentication(
    //     response.accessToken!,
    //     response.refreshToken!,
    //     response.expriresIn!,
    //   );
    // } catch (e) {
    //   //
    // }
    DialogService.closeLoadingDialog(context);
    NavigationHelper.navigateToHome(context);
  }

  ///
  /// Initialize the service
  ///
  Future<void> initialize() async {
    await reset(clear: false);
    reload();
  }

  ///
  /// Logout
  ///
  Future<void> logout(BuildContext context) async {
    DialogService.showLoadingDialog(context);
    try {
      await authEndpoint.logout();
    } catch (e) {
      //
    }
    await authDAO.drop();
    authState.clearAll();
    DialogService.closeLoadingDialog(context);
    NavigationHelper.navigateToHome(context);
  }

  ///
  /// Reset the service
  ///
  Future<void> reset({bool clear = true}) async {
    try {
      if (clear) authState.clearAll();

      final User? user = await authDAO.getUser();
      final String? accessToken = await authDAO.getAccessToken();
      final String? refreshToken = await authDAO.getRefreshToken();

      authState.fill(
          accessToken: accessToken, refreshToken: refreshToken, user: user);
    } catch (e) {
      //
    }
  }

  /// reload user from api
  Future<bool> reload() async {
    if (await authDAO.hasApiTokens()) {
      try {
        final DataResponse response = await userEndpoint.me();
        _checkRefreshToken();
        final User? data = response.data<User>();
        if (data != null) {
          authState.setUser(data);
          return true;
        }
      } catch (e) {
        if (e is ErrorResponse) {
          // Handle error from server
        }
      }
    }
    return false;
  }

  /// refresh user tokens
  Future<bool> refreshToken() async {
    final String? refreshToken = await authDAO.getRefreshToken();
    if (refreshToken != null) {
      try {
        final LoginResponseDTO response =
            await authEndpoint.refreshToken(refreshToken);
        return _processAuthentication(response.accessToken!,
            response.refreshToken!, response.expriresIn!);
      } catch (e) {
        if (e is ErrorResponse) {
          // Handle error from server
        }
      }
    }
    return false;
  }

  void _checkRefreshToken() async {
    try {
      final int? expiresTimestamp = await authDAO.getExpiresTimestamp();
      if (expiresTimestamp != null &&
          expiresTimestamp <
              (DateTime.now()
                  .add(const Duration(hours: 1))
                  .millisecondsSinceEpoch)) {
        // the tokens will expire in less than 1 hour so we try to refresh them
        refreshToken();
      }
    } catch (e) {
      //
    }
  }

  /// check if the user is authenticated
  /// otherwise redirect him to the authenticatio process
  Future<bool> checkAndRedirect(BuildContext context) async {
    final bool checked = authenticated;
    if (!checked) {
      // TODO Redirect the user to the authentication process
      // Await all the process using async/await before returning the
      // response true or false
    }

    return checked;
  }

  Future<bool> _processAuthentication(
      String accessToken, String refreshToken, int expiresIn) async {
    try {
      authDAO.saveApiTokens(accessToken, refreshToken,
          DateTime.now().millisecondsSinceEpoch + expiresIn);
      await reset();
      return await reload();
    } catch (e) {
      //
    }

    return false;
  }
}

/// [AuthenticationData]
class AuthenticationData {
  /// email
  final String email;

  /// password
  final String password;

  /// Constructor
  AuthenticationData({
    required this.email,
    required this.password,
  });
}