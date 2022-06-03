import 'dart:io';

import 'package:app/application/injections/injector.dart';
import 'package:app/application/kernel/app_helpers.dart';
import 'package:app/domain/data/resources/http/dio/dio.client.dart';
import 'package:app/domain/data/resources/http/models/data.response.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'user.endpoint.g.dart';

/// [UserEndpoint]
/// Just an example class to show how to use it
@RestApi(parser: Parser.DartJsonMapper)
abstract class UserEndpoint {
  /// Factory to create an instance
  factory UserEndpoint() {
    final DioClient dio = injector<DioClient>();
    return _UserEndpoint(dio, baseUrl: appConfig().serverUrl);
  }

  /// Authentication
  @GET('/api/me/profile')
  @Extra(<String, Object>{
    DioClient.extraDataAutenticateKey: true,
    DioClient.extraDataRefreskTokenNotNeedKey: true
  })
  Future<DataResponse> me();

  /// Authentication
  @GET('/api/me/rooms')
  @Extra(<String, Object>{
    DioClient.extraDataAutenticateKey: true,
    DioClient.extraDataRefreskTokenNotNeedKey: true
  })
  Future<DataResponse> myRooms();

  /// Authentication
  @POST('/users/me')
  @MultiPart()
  @Extra(<String, Object>{
    DioClient.extraDataAutenticateKey: true,
    DioClient.extraDataRefreskTokenNotNeedKey: true
  })
  Future<DataResponse> updateMe(@Part() String name, @Part() File file);
}
