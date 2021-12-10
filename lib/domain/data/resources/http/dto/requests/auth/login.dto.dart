import 'package:app/infrastructure/mixins/json_serializable.mixin.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

///
/// [LoginDTO]
///
@jsonSerializable
@Json(caseStyle: CaseStyle.snake)
class LoginRequestDTO with JsonSerializableMixin<LoginRequestDTO> {
  ///
  /// email
  ///
  final String email;

  ///
  /// password
  ///
  final String password;

  ///
  /// Constructor
  ///
  LoginRequestDTO({required this.email, required this.password});
}
