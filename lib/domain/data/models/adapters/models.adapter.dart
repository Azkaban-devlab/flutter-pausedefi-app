import 'package:dart_json_mapper/dart_json_mapper.dart';

import '../room.model.dart';
import '../user.model.dart';

final Map<Type, ValueDecoratorFunction> _userAdapterDecorators =
    <Type, ValueDecoratorFunction>{
  typeOf<List<User>>(): (dynamic value) => value.cast<User>(),
  typeOf<Set<User>>(): (dynamic value) => value.cast<User>(),
};

final Map<Type, ValueDecoratorFunction> _roomAdapterDecorators =
    <Type, ValueDecoratorFunction>{
  typeOf<List<Room>>(): (dynamic value) => value.cast<Room>(),
  typeOf<Set<Room>>(): (dynamic value) => value.cast<Room>(),
};

/// models adapter decorator
final Map<Type, ValueDecoratorFunction> modelAdapterDecorators =
    <Type, ValueDecoratorFunction>{
  ..._userAdapterDecorators,
  ..._roomAdapterDecorators
};
