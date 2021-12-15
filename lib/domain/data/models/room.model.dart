import 'package:app/domain/data/models/challenge.model.dart';
import 'package:app/domain/data/models/user.model.dart';
import 'package:app/infrastructure/mixins/json_serializable.mixin.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:equatable/equatable.dart';

///
/// [Room]
///
@jsonSerializable
@Json(caseStyle: CaseStyle.snake)
class Room with EquatableMixin, JsonSerializableMixin<Room> {
  ///
  /// ID
  ///
  int? id;

  ///
  /// name
  ///
  String? name;

  ///
  /// bio
  ///
  String? bio;

  ///
  /// access
  ///
  String? access;

  ///
  /// users
  ///
  List<User>? users;

  ///
  /// creatorId
  ///
  int? creatorId;

  ///
  /// creator
  ///
  User? creator;

  ///
  /// challenges
  ///
  List<Challenge>? challenges;

  ///
  /// Constructor
  ///
  Room();

  @JsonProperty(ignore: true)
  @override
  List<Object?> get props => <Object?>[id, name, bio, creatorId];
}
