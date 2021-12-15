// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: all, lint_alpha, lint_beta

part of 'auth.endpoint.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AuthEndpoint implements AuthEndpoint {
  _AuthEndpoint(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LoginResponseDTO> login(dto) async {
    const _extra = <String, dynamic>{'authenticate': false};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(dto.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoginResponseDTO>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/auth/login',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonMapper.fromMap<LoginResponseDTO>(_result.data!)!;
    return value;
  }

  @override
  Future<RecoverResponseDTO> recover(dto) async {
    const _extra = <String, dynamic>{'authenticate': false};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(dto.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RecoverResponseDTO>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/auth/recover',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonMapper.fromMap<RecoverResponseDTO>(_result.data!)!;
    return value;
  }

  @override
  Future<ResetResponseDTO> reset(dto) async {
    const _extra = <String, dynamic>{'authenticate': false};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(dto.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResetResponseDTO>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/auth/reset',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonMapper.fromMap<ResetResponseDTO>(_result.data!)!;
    return value;
  }

  @override
  Future<LoginResponseDTO> refreshToken(refreshToken) async {
    const _extra = <String, dynamic>{'authenticate': false};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoginResponseDTO>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/auth/refresh-token/${refreshToken}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonMapper.fromMap<LoginResponseDTO>(_result.data!)!;
    return value;
  }

  @override
  Future<LoginResponseDTO> logout() async {
    const _extra = <String, dynamic>{
      'authenticate': true,
      'refresh-token-not-need': false
    };
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoginResponseDTO>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/auth/logout',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonMapper.fromMap<LoginResponseDTO>(_result.data!)!;
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
