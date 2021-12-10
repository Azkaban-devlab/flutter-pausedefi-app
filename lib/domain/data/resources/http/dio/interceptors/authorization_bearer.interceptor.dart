import 'package:app/application/injections/injector.dart';
import 'package:app/application/kernel/app_helpers.dart';
import 'package:app/domain/data/resources/http/dio/dio.client.dart';
import 'package:app/domain/data/resources/storage/dao/auth.dao.dart';
import 'package:app/domain/services/injected/authentication.service.dart';
import 'package:dio/dio.dart';

import 'interceptor_manager.dart';

///
/// [AuthorizationBearerInterceptor]
///
class AuthorizationBearerInterceptor with CanInterceptorEvent<String> {
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
  AuthorizationBearerInterceptor(this.authDAO, this.dioClient) {
    _registerInterceptor();
  }

  Future<void> _onRequestInterceptor(RequestOptions options,
      RequestInterceptorHandler requestInterceptorHandler) async {
    final Map<String, dynamic> extraData = options.extra;
    // We check if this route doesn't need to be authenticated
    if (extraData.isNotEmpty &&
        extraData.containsKey(DioClient.extraDataAutenticateKey) &&
        extraData[DioClient.extraDataAutenticateKey] == false) {
      requestInterceptorHandler.next(options);
      return;
    }

    if (options.baseUrl == appConfig().serverUrl) {
      options.headers.addAll(<String, String>{'Accept': 'application/json'});
      final AuthenticationService authenticationService =
          injector<AuthenticationService>();
      // Fetching access token from storage and adding it to the request
      final String? accessToken = authenticationService.authState.accessToken;
      if (accessToken != null) {
        final Map<String, String> headers = <String, String>{
          'Authorization': 'Bearer $accessToken',
        };
        options.headers.addAll(headers);
        // Emit evant
        if (onEmit != null) onEmit!(AuthoriztionBearerInterceptorEvent());
      }
      requestInterceptorHandler.next(options);
    } else {
      requestInterceptorHandler.next(options);
    }
  }

  void _registerInterceptor() {
    dioClient!.interceptors.add(
      QueuedInterceptorsWrapper(
          onRequest: _onRequestInterceptor,
          onResponse:
              (Response<dynamic> response, ResponseInterceptorHandler handler) {
            // Do something with response data
            return handler.next(response); // continue
          },
          onError: (DioError e, ErrorInterceptorHandler handler) {
            return handler.next(e); //continue
          }),
    );
  }
}

///
/// Authorization Beare Event emitted when the authorization bearer token
/// is added on the headers of a request
///
class AuthoriztionBearerInterceptorEvent extends InterceptorEvent<String> {}
