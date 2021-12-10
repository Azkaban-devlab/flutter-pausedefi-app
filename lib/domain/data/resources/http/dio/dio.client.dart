import 'package:app/application/kernel/app_helpers.dart';
import 'package:app/domain/data/resources/http/dio/platforms/dio.web.dart'
// ignore: uri_does_not_exist
    if (dart.library.io) 'package:app/domain/data/resources/http/dio/platforms/dio.mobile.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

///
/// [DioClient]
///
@singleton
class DioClient extends DioPlatform {
  /// extraDataAutenticateKey
  ///
  /// use this key when you to tell that the request
  /// should add the authorization header or not
  ///
  /// without it the request will add the header
  static const String extraDataAutenticateKey = r'authenticate';

  /// extraDataRefreskTokenNotNeedKey
  ///
  /// use this key when you want to tell the request must
  /// execute the refresh token interceptor
  ///
  /// you can set to false for background request
  /// like Installation request
  static const String extraDataRefreskTokenNotNeedKey =
      r'refresh-token-not-need';

  ///
  /// Get default [BaseOptions]
  ///
  static BaseOptions baseOptions() => BaseOptions()
    ..followRedirects = true
    ..baseUrl = appConfig().serverUrl!
    ..connectTimeout = 30000
    ..maxRedirects = 5
    ..contentType = Headers.formUrlEncodedContentType;

  ///
  /// Constructor
  ///
  DioClient() : super(baseOptions());

  ///
  /// Make a new authenticated request with [options]
  ///
  Future<Response<dynamic>> authenticatedRequestWithOptions(
      RequestOptions options) {
    return request<dynamic>(
      options.path,
      queryParameters: options.queryParameters,
      data: options.data,
    );
  }
}
