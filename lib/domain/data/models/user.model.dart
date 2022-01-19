import 'package:app/infrastructure/mixins/json_serializable.mixin.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:equatable/equatable.dart';

///
/// [User]
///
@jsonSerializable
@Json(caseStyle: CaseStyle.snake)
class User with EquatableMixin, JsonSerializableMixin<User> {
  ///
  /// ID
  ///
  int? id;

  ///
  /// HashID
  ///
  String? hashId;

  ///
  /// firstName
  ///
  String? firstName;

  ///
  /// lastName
  ///
  String? lastName;

  ///
  /// email
  ///
  String? email;

  ///
  /// password
  ///
  String? password;

  ///
  /// points
  ///
  int? points;

  ///
  /// Constructor
  ///
  User();

  @JsonProperty(ignore: true)
  @override
  List<Object?> get props => <Object?>[id, firstName, lastName, email, points];

  @JsonProperty(ignore: true)
  String? get fullName => '$firstName $lastName';
}
