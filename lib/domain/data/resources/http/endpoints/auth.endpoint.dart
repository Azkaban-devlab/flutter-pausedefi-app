import 'package:app/application/injections/injector.dart';
import 'package:app/application/kernel/app_helpers.dart';
import 'package:app/domain/data/resources/http/dio/dio.client.dart';
import 'package:app/domain/data/resources/http/dto/requests/auth/login.dto.dart';
import 'package:app/domain/data/resources/http/dto/requests/auth/recover.dto.dart';
import 'package:app/domain/data/resources/http/dto/requests/auth/reset.dto.dart';
import 'package:app/domain/data/resources/http/dto/responses/auth/login.dto.dart';
import 'package:app/domain/data/resources/http/dto/responses/auth/recover.dto.dart';
import 'package:app/domain/data/resources/http/dto/responses/auth/reset.dto.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'auth.endpoint.g.dart';

/// [AuthEndpoint]
/// Just an example class to show how to use it
@RestApi(parser: Parser.DartJsonMapper)
abstract class AuthEndpoint {
  /// Factory to create an instance
  factory AuthEndpoint() {
    final DioClient dio = injector<DioClient>();
    return _AuthEndpoint(dio, baseUrl: appConfig().serverUrl);
  }

  /// Authentication
  @POST('/auth/login')
  @Extra(<String, Object>{DioClient.extraDataAutenticateKey: false})
  Future<LoginResponseDTO> login(@Body() LoginRequestDTO dto);

  /// Authentication
  @POST('/auth/register')
  @Extra(<String, Object>{DioClient.extraDataAutenticateKey: false})
  Future<LoginResponseDTO> register(@Body() LoginRequestDTO dto);

  /// Recover
  @POST('/auth/recover')
  @Extra(<String, Object>{DioClient.extraDataAutenticateKey: false})
  Future<RecoverResponseDTO> recover(@Body() RecoverRequestDTO dto);

  /// Reset
  @POST('/auth/reset')
  @Extra(<String, Object>{DioClient.extraDataAutenticateKey: false})
  Future<ResetResponseDTO> reset(@Body() ResetRequestDTO dto);

  /// Reset
  @POST('/auth/refresh-token/{refresh_token}')
  @Extra(<String, Object>{DioClient.extraDataAutenticateKey: false})
  Future<LoginResponseDTO> refreshToken(
      @Path('refresh_token') String refreshToken);

  /// Logout
  @POST('/auth/logout')
  @Extra(<String, Object>{
    DioClient.extraDataAutenticateKey: true,
    DioClient.extraDataRefreskTokenNotNeedKey: false
  })
  Future<LoginResponseDTO> logout();
}
