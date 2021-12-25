import 'package:app/infrastructure/mixins/json_serializable.mixin.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
@Json(caseStyle: CaseStyle.snake)
class AccessRoomRequestDTO with JsonSerializableMixin<AccessRoomRequestDTO> {
  ///
  /// accessCode
  ///
  String? accessCode;

  ///
  /// Constructor
  ///
  AccessRoomRequestDTO({this.accessCode});
}
