import 'package:dart_json_mapper/dart_json_mapper.dart';

import '../user.model.dart';

final Map<Type, ValueDecoratorFunction> _userAdapterDecorators =
    <Type, ValueDecoratorFunction>{
  typeOf<List<User>>(): (dynamic value) => value.cast<User>(),
  typeOf<Set<User>>(): (dynamic value) => value.cast<User>(),
};

/// models adapter decorator
final Map<Type, ValueDecoratorFunction> modelAdapterDecorators =
    <Type, ValueDecoratorFunction>{..._userAdapterDecorators};
