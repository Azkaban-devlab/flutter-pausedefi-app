import 'package:dart_json_mapper/dart_json_mapper.dart';

///
/// [ResetDTO] response
///
@jsonSerializable
@Json(caseStyle: CaseStyle.snake)
class ResetResponseDTO {
  ///
  /// email
  ///
  String? email;

  ///
  /// Constructor
  ///
  ResetResponseDTO();
}
