import 'dart:io';

import 'package:app/application/injections/injector.dart';
import 'package:app/application/kernel/app_helpers.dart';
import 'package:app/domain/data/models/room.model.dart';
import 'package:app/domain/data/resources/http/dio/dio.client.dart';
import 'package:app/domain/data/resources/http/dto/responses/room/access.room.dto.dart';
import 'package:app/domain/data/resources/http/models/data.response.dart';
import 'package:retrofit/dio.dart';
import 'package:dio/dio.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:retrofit/http.dart' as http;

part 'room.endpoint.g.dart';

/// [RoomEndpoint]
/// Just an example class to show how to use it
@http.RestApi(parser: http.Parser.DartJsonMapper)
abstract class RoomEndpoint {
  /// Factory to create an instance
  factory RoomEndpoint() {
    final DioClient dio = injector<DioClient>()
      ..options.contentType = Headers.jsonContentType;
    return _RoomEndpoint(dio, baseUrl: appConfig().serverUrl);
  }

  /// Create Room
  @http.POST('/api/room/create')
  @Extra(<String, Object>{
    DioClient.extraDataAutenticateKey: true,
    DioClient.extraDataRefreskTokenNotNeedKey: true,
  })
  Future<AccessRoomDTO> createRoom(@http.Body() Room body);
}
