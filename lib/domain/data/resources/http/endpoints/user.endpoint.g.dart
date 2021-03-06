// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: all, lint_alpha, lint_beta

part of 'user.endpoint.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _UserEndpoint implements UserEndpoint {
  _UserEndpoint(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<DataResponse> me() async {
    const _extra = <String, dynamic>{
      'authenticate': true,
      'refresh-token-not-need': true
    };
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DataResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/me/profile',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonMapper.fromMap<DataResponse>(_result.data!)!;
    return value;
  }

  @override
  Future<DataResponse> myRooms() async {
    const _extra = <String, dynamic>{
      'authenticate': true,
      'refresh-token-not-need': true
    };
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DataResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/me/rooms',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonMapper.fromMap<DataResponse>(_result.data!)!;
    return value;
  }

  @override
  Future<DataResponse> updateMe(name, file) async {
    const _extra = <String, dynamic>{
      'authenticate': true,
      'refresh-token-not-need': true
    };
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('name', name));
    _data.files.add(MapEntry(
        'file',
        MultipartFile.fromFileSync(file.path,
            filename: file.path.split(Platform.pathSeparator).last)));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DataResponse>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'multipart/form-data')
            .compose(_dio.options, '/users/me',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonMapper.fromMap<DataResponse>(_result.data!)!;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
