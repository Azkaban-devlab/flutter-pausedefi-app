import 'package:app/application/injections/injector.dart';
import 'package:app/application/kernel/app_helpers.dart';
import 'package:app/domain/data/models/room.model.dart';
import 'package:app/domain/data/resources/http/dio/dio.client.dart';
import 'package:app/domain/data/resources/http/dto/requests/auth/login.dto.dart';
import 'package:app/domain/data/resources/http/dto/requests/room/access.room.dto.dart';
import 'package:app/domain/data/resources/http/dto/responses/room/access.room.dto.dart';
import 'package:app/domain/data/resources/http/models/data.response.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'room.endpoint.g.dart';

/// [RoomEndpoint]
/// Just an example class to show how to use it
@RestApi(parser: Parser.DartJsonMapper)
abstract class RoomEndpoint {
  /// Factory to create an instance
  factory RoomEndpoint() {
    final DioClient dio = injector<DioClient>();
    return _RoomEndpoint(dio, baseUrl: appConfig().serverUrl);
  }

  /// Create Room
  @POST('/api/room/create')
  @Extra(<String, Object>{
    DioClient.extraDataAutenticateKey: true,
    DioClient.extraDataRefreskTokenNotNeedKey: true,
  })
  Future<AccessRoomResponseDTO> createRoom(@Body() Room body);

  /// Get Room by ID
  @GET('api/room/{id}')
  @Extra(<String, Object>{
    DioClient.extraDataAutenticateKey: true,
    DioClient.extraDataRefreskTokenNotNeedKey: true,
  })
  Future<DataResponse> getRoomById(@Path('id') int id);

  /// Access room
  @POST('api/room/access')
  @Extra(<String, Object>{
    DioClient.extraDataAutenticateKey: true,
    DioClient.extraDataRefreskTokenNotNeedKey: true,
  })
  Future<DataResponse> accessRoom(@Body() AccessRoomRequestDTO dto);
}
