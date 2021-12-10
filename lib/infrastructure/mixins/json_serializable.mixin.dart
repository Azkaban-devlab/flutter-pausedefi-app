import 'package:dart_json_mapper/dart_json_mapper.dart';

///
mixin JsonSerializableMixin<T> {
  ///
  static T? fromJson<T>(dynamic json) {
    return JsonMapper.deserialize<T>(json);
  }

  ///
  Map<String, dynamic> toJson() {
    final Map<String, dynamic>? json = JsonMapper.toMap(this);
    return json ?? <String, dynamic>{};
  }

  ///
  String serialize() {
    return JsonMapper.serialize(this);
  }
}
