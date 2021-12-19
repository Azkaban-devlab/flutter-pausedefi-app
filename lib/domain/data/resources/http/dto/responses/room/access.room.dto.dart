import 'package:dart_json_mapper/dart_json_mapper.dart';

///
/// [AccessRoomDTO] response
///
@jsonSerializable
@Json(caseStyle: CaseStyle.snake)
class AccessRoomDTO {
  ///
  /// accessCode
  ///
  String? accessCode;

  ///
  /// Constructor
  ///
  AccessRoomDTO();
}
