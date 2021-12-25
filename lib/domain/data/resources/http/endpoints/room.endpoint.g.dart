// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: all, lint_alpha, lint_beta

part of 'room.endpoint.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RoomEndpoint implements RoomEndpoint {
  _RoomEndpoint(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AccessRoomResponseDTO> createRoom(body) async {
    const _extra = <String, dynamic>{
      'authenticate': true,
      'refresh-token-not-need': true
    };
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AccessRoomResponseDTO>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/room/create',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonMapper.fromMap<AccessRoomResponseDTO>(_result.data!)!;
    return value;
  }

  @override
  Future<DataResponse> getRoomById(id) async {
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
                .compose(_dio.options, 'api/room/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonMapper.fromMap<DataResponse>(_result.data!)!;
    return value;
  }

  @override
  Future<DataResponse> accessRoom(dto) async {
    const _extra = <String, dynamic>{
      'authenticate': true,
      'refresh-token-not-need': true
    };
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(dto.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DataResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/room/access',
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
