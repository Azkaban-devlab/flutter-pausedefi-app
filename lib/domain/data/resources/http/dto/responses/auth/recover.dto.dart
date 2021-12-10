import 'package:dart_json_mapper/dart_json_mapper.dart';

///
/// [RecoverDTO] response
///
@jsonSerializable
@Json(caseStyle: CaseStyle.snake)
class RecoverResponseDTO {
  ///
  /// message
  ///
  String? message;

  ///
  /// Constructor
  ///
  RecoverResponseDTO();
}
