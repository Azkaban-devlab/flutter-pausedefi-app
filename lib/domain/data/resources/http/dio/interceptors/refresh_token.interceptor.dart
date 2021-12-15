import 'package:app/application/injections/injector.dart';
import 'package:app/application/kernel/app_helpers.dart';
import 'package:app/domain/data/resources/storage/dao/auth.dao.dart';
import 'package:app/domain/services/injected/authentication.service.dart';
import 'package:dio/dio.dart';

import '../dio.client.dart';
import 'interceptor_manager.dart';

///
/// [RefreshTokenInterceptor]
///
class RefreshTokenInterceptor extends InterceptorsWrapper
    with CanInterceptorEvent<void> {
  int _refreshTried = 0;

  ///
  /// [AuthDAO]
  ///
  final AuthDAO? authDAO;

  ///
  /// [dioClient]
  ///
  final DioClient? dioClient;

  ///
  /// Constructor
  ///
  RefreshTokenInterceptor(this.authDAO, this.dioClient) {
    _registerInterceptor();
  }

  void _emitLogOutEvent() {
    if (onEmit != null) onEmit!(RefreshTokenInterceptorFailedEvent());
  }

  Future<bool> _handleResfreshToken() async {
    final AuthenticationService authenticationService =
        injector<AuthenticationService>();
    final String? refreshToken = authenticationService.authState.refreshToken;

    if (refreshToken == null) {
      _emitLogOutEvent();
      return false;
    }
    if (_refreshTried >= 3) {
      _refreshTried = 0;
      _emitLogOutEvent();
      return false;
    }
    try {
      final bool succeed = false; //await authenticationService.refreshToken();
      if (!succeed) {
        _emitLogOutEvent();
      }
      return succeed;
    } on DioError catch (_) {
      _emitLogOutEvent();
    }
    return false;
  }

  Future<void> _onErrorInterceptor(
      DioError error, ErrorInterceptorHandler errorInterceptorHandler) async {
    final Map<String, dynamic> extraData = error.requestOptions.extra;
    // We check if this route doesn't need to refresh token
    if (extraData.isNotEmpty &&
        (!extraData.containsKey(DioClient.extraDataRefreskTokenNotNeedKey) ||
            extraData[DioClient.extraDataRefreskTokenNotNeedKey] == true)) {
      errorInterceptorHandler.next(error);
      return;
    }

    if (error.response?.statusCode == 401 &&
        error.requestOptions.baseUrl == appConfig().serverUrl) {
      // Invalid token, it needs to be refreshed
      //Refreshing token
      try {
        final bool succeed = await _handleResfreshToken();

        if (succeed) {
          // Successfully refreshed token, unlocking Dio and retrying request
          await dioClient!
              .authenticatedRequestWithOptions(error.response!.requestOptions);
          errorInterceptorHandler.next(error);
          return;
        } else {
          // Finally, returning the error that will logout the user
          errorInterceptorHandler.reject(error);
          return;
        }
      } catch (e) {
        //
      }
    } else {
      errorInterceptorHandler.next(error);
    }
  }

  void _registerInterceptor() {
    dioClient!.interceptors.add(QueuedInterceptorsWrapper(
      onError: _onErrorInterceptor,
      onRequest:
          (RequestOptions requestOptions, RequestInterceptorHandler handler) {
        // Do something with response data
        return handler.next(requestOptions); // continue
      },
      onResponse:
          (Response<dynamic> response, ResponseInterceptorHandler handler) {
        // Do something with response data
        return handler.next(response); // continue
      },
    ));
  }
}

///
/// Error Event emitted when the refresh token failed
///
class RefreshTokenInterceptorFailedEvent extends InterceptorEvent<void> {}
