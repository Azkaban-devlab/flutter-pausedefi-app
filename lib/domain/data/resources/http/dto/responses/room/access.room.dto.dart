import 'package:dart_json_mapper/dart_json_mapper.dart';

///
/// [AccessRoomResponseDTO] response
///
@jsonSerializable
@Json(caseStyle: CaseStyle.snake)
class AccessRoomResponseDTO {
  ///
  /// accessCode
  ///
  String? accessCode;

  ///
  /// id
  ///
  int? id;

  ///
  /// Constructor
  ///
  AccessRoomResponseDTO();
}
