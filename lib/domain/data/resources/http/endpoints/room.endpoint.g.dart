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
  Future<AccessRoomResponseDTO> createRoom(name, bio,
      {challenges, avatar}) async {
    const _extra = <String, dynamic>{
      'authenticate': true,
      'refresh-token-not-need': true
    };
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('name', name));
    _data.fields.add(MapEntry('bio', bio));
    _data.fields.add(MapEntry('challenges', jsonEncode(challenges)));
    if (avatar != null) {
      _data.files.add(MapEntry(
          'avatar',
          MultipartFile.fromFileSync(avatar.path,
              filename: avatar.path.split(Platform.pathSeparator).last)));
    }
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AccessRoomResponseDTO>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'multipart/form-data')
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
                .compose(_dio.options, '/api/room/${id}',
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
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/room/access',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonMapper.fromMap<DataResponse>(_result.data!)!;
    return value;
  }

  @override
  Future<DataResponse> getUserInRoom(id, {orderBy}) async {
    const _extra = <String, dynamic>{
      'authenticate': true,
      'refresh-token-not-need': true
    };
    final queryParameters = <String, dynamic>{r'order_by': orderBy};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DataResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/room/${id}/users',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonMapper.fromMap<DataResponse>(_result.data!)!;
    return value;
  }

  @override
  Future<HttpResponse<dynamic>> addChallengerToChallenge(
      roomId, challengeId, challengers) async {
    const _extra = <String, dynamic>{
      'authenticate': true,
      'refresh-token-not-need': true
    };
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(challengers);
    final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options,
                '/api/room/${roomId}/challenge/${challengeId}/challenger',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<dynamic>> createChallenge(id, challenge) async {
    const _extra = <String, dynamic>{
      'authenticate': true,
      'refresh-token-not-need': true
    };
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(challenge.toJson());
    final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/api/room/${id}/challenge',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<DataResponse> getMyChallenge(id, {state}) async {
    const _extra = <String, dynamic>{
      'authenticate': true,
      'refresh-token-not-need': true
    };
    final queryParameters = <String, dynamic>{r'state': state};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DataResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/room/${id}/challenge/me',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonMapper.fromMap<DataResponse>(_result.data!)!;
    return value;
  }

  @override
  Future<DataResponse> getIdeaChallenge(id) async {
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
                .compose(_dio.options, '/api/room/${id}/challenge/idea',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonMapper.fromMap<DataResponse>(_result.data!)!;
    return value;
  }

  @override
  Future<DataResponse> updateChallengeState(id, challengeId,
      {required state, proof, userId}) async {
    const _extra = <String, dynamic>{
      'authenticate': true,
      'refresh-token-not-need': true
    };
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('state', state));
    if (proof != null) {
      _data.files.add(MapEntry(
          'proof',
          MultipartFile.fromFileSync(proof.path,
              filename: proof.path.split(Platform.pathSeparator).last)));
    }
    if (userId != null) {
      _data.fields.add(MapEntry('user_id', userId.toString()));
    }
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DataResponse>(Options(
                method: 'PATCH',
                headers: _headers,
                extra: _extra,
                contentType: 'multipart/form-data')
            .compose(_dio.options, '/api/room/${id}/challenge/${challengeId}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonMapper.fromMap<DataResponse>(_result.data!)!;
    return value;
  }

  @override
  Future<DataResponse> getMyNotifications(id) async {
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
                .compose(_dio.options, '/api/room/${id}/notification',
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
