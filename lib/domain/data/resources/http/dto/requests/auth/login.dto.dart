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

  /// first_name
  final String? firstName;

  /// last_name
  final String? lastName;

  ///
  /// Constructor
  ///
  LoginRequestDTO(
      {required this.email,
      required this.password,
      this.firstName,
      this.lastName});
}
