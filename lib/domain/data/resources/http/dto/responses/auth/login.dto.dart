import 'package:dart_json_mapper/dart_json_mapper.dart';

///
/// [LoginDTO] Response
///
@jsonSerializable
@Json(caseStyle: CaseStyle.snake)
class LoginResponseDTO {
  ///
  /// accessToken
  ///
  String? accessToken;

  ///
  /// refreshToken
  ///
  String? refreshToken;

  ///
  /// expriresIn
  ///
  int? expriresIn;

  ///
  /// Constructor
  ///
  LoginResponseDTO();
}
