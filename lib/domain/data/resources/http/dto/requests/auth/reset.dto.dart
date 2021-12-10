import 'package:app/infrastructure/mixins/json_serializable.mixin.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

///
/// [ResetDTO]
///
@jsonSerializable
@Json(caseStyle: CaseStyle.snake)
class ResetRequestDTO with JsonSerializableMixin<ResetRequestDTO> {
  ///
  /// token
  ///
  final String token;

  ///
  /// email
  ///
  final String email;

  ///
  /// termsAccepted
  ///
  final bool termsAccepted;

  ///
  /// password
  ///
  final String password;

  ///
  /// passwordConfirmation
  ///
  final String passwordConfirmation;

  ///
  /// Constructor
  ///
  ResetRequestDTO(
      {required this.token,
      required this.email,
      required this.password,
      required this.termsAccepted,
      required this.passwordConfirmation});
}
