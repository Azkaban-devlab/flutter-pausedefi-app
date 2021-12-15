import 'package:app/domain/data/models/room.model.dart';
import 'package:app/domain/data/models/user.model.dart';
import 'package:app/infrastructure/mixins/json_serializable.mixin.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:equatable/equatable.dart';

import 'converters/datetime.converter.dart';

///
/// [Challenge]
///
@jsonSerializable
@Json(caseStyle: CaseStyle.snake)
class Challenge with EquatableMixin, JsonSerializableMixin<Challenge> {
  ///
  /// ID
  ///
  int? id;

  ///
  /// title
  ///
  String? title;

  ///
  /// content
  ///
  String? content;

  ///
  /// datePosted
  ///
  @JsonProperty(
    // the line below is important otherwise the generator will throw an error
    // ignore: always_specify_types
    converterParams: {'format': 'yyyy-MM-dd', 'isUTC': true},
    converter: DateTimeConverter(),
  )
  DateTime? datePosted;

  ///
  /// challengers
  ///
  List<User>? challengers;

  ///
  /// roomId
  ///
  int? roomId;

  ///
  /// room
  ///
  Room? room;

  ///
  /// creatorId
  ///
  int? creatorId;

  ///
  /// creator
  ///
  User? creator;

  ///
  /// Constructor
  ///
  Challenge();

  @JsonProperty(ignore: true)
  @override
  List<Object?> get props => <Object?>[id, title, content, creatorId, roomId];
}
