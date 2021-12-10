import 'package:app/infrastructure/mixins/json_serializable.mixin.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

///
/// [RecoverDTO]
///
@jsonSerializable
@Json(caseStyle: CaseStyle.snake)
class RecoverRequestDTO with JsonSerializableMixin<RecoverRequestDTO> {
  ///
  /// email
  ///
  final String email;

  ///
  /// Constructor
  ///
  RecoverRequestDTO({
    required this.email,
  });
}
