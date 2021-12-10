import 'package:app/domain/data/resources/http/dio/dio.client.dart';
import 'package:app/domain/data/resources/http/models/error.response.dart';
import 'package:dio/dio.dart';

import 'interceptor_manager.dart';

///
/// [ErrorInterceptor]
///
class ErrorInterceptor {
  ///
  /// [dioClient]
  ///
  final DioClient? dioClient;

  ///
  /// Constructor
  ///
  ErrorInterceptor(this.dioClient) {
    _registerInterceptor();
  }

  Future<void> _onErrorInterceptor(
      DioError error, ErrorInterceptorHandler errorInterceptorHandler) async {
    errorInterceptorHandler.next(ErrorResponse(
        error.requestOptions, error.response, error.type, error.error));
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
/// Authorization Beare Event emitted when the authorization bearer token
/// is added on the headers of a request
///
class AuthoriztionBearerInterceptorEvent extends InterceptorEvent<String> {}
