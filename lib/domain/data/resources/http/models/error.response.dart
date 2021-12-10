import 'dart:convert';

import 'package:dio/dio.dart';

/// ErrorResponse
class ErrorResponse extends DioError {
  ///
  ErrorResponse(
    /// Request info.
    RequestOptions requestOptions,

    /// Response info, it may be `null` if the request can't reach to
    /// the http server, for example, occurring a dns error, network is not available.
    Response<dynamic>? response,
    DioErrorType type,

    /// The original error/exception object; It's usually not null when `type`
    /// is DioErrorType.DEFAULT
    dynamic error,
  ) : super(
          requestOptions: requestOptions,
          response: response,
          type: type,
          error: error,
        );

  ///
  /// Check if the errors in the response body has a property [field]
  ///
  bool hasErrorField(String field) {
    final Map<String, dynamic>? errorJson = errorResponseJson;
    if (errorJson != null && errorJson.containsKey('errors')) {
      return (errorJson['errors'] as Map<String, dynamic>).containsKey(field);
    }

    return false;
  }

  ///
  /// Check if it's a Dio timeout error
  ///
  bool get isTimeoutError => <DioErrorType>[
        DioErrorType.connectTimeout,
        DioErrorType.receiveTimeout,
        DioErrorType.sendTimeout
      ].contains(error.type);

  ///
  /// Get Dio error message
  ///
  String get dioErrorMessage => error.message.toString();

  ///
  /// Get error message
  ///
  String? get errorMessage {
    final Map<String, dynamic>? errorJson = errorResponseJson;
    if (errorJson != null && errorJson.containsKey('errors')) {
      final List<dynamic> errors =
          (errorJson['errors'] as Map<String, dynamic>).values.toList();

      if (errors.isNotEmpty) {
        if (errors.first is List) {
          return errors.first.first.toString();
        }
      }
    }

    if ((statusCode == 422 ||
            statusCode == 400 ||
            statusCode == 401 ||
            statusCode == 402 ||
            statusCode == 403) &&
        errorJson != null &&
        errorJson.containsKey('message')) {
      return errorJson['message'].toString();
    }

    return null;
  }

  ///
  /// Get error message as Map
  ///
  Map<String, dynamic>? get errorResponseJson {
    try {
      return response?.data != null
          ? (response!.data is String
              ? jsonDecode(error.response!.data as String)
                  as Map<String, dynamic>
              : error.response!.data as Map<String, dynamic>)
          : null;
    } catch (e) {
      return null;
    }
  }

  ///
  /// Check if there's errors in response
  ///
  bool get hasErrors =>
      errorResponseJson != null && errorResponseJson!.containsKey('errors');

  ///
  /// Check if it's a Dio cancelled error
  ///
  bool get isCancelledError => <dynamic>[
        DioErrorType.cancel,
      ].contains(error.type);

  /// Get status code
  int? get statusCode => response?.statusCode;

  ///
  /// Get error message as String from dynamic response
  ///
  String? handleErrorResponse() {
    if (response != null) {
      if (response!.data == null) return null;
      dynamic jsonValue = response!.data;
      if ((jsonValue is List && jsonValue.isEmpty) ||
          (jsonValue is Iterable && jsonValue.isEmpty)) return null;
      Map<String, dynamic>? errorJson =
          (jsonValue is List || jsonValue is Iterable
              ? jsonValue[0]
              : jsonValue) as Map<String, dynamic>?;
      if (errorJson != null && errorJson.isNotEmpty) {
        if (errorJson.containsKey('data') && errorJson['data'] != null) {
          final Map<String, dynamic>? messageJson =
              errorJson['data'] as Map<String, dynamic>;
          if (messageJson!.containsKey('message') &&
              messageJson['message'] != null &&
              messageJson['message'] is String) {
            return messageJson['message'] as String?;
          }
        }
      }
    }
    return null;
  }
}
