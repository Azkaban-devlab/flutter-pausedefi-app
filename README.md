# Flutter App PauseDefi

DevLab Application IIM - Pause Defi based on simple template flutter app

## IMPORTANT

Run the below command to run the app.

- `flutter run -t lib/application/main/main.dart` In folder `flutter-pausedefi-app`

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Plugins specifications

Nothing for now

## Code Generation

### Build runner code generation

This command line is used to generate code from Injector, Flutter Gen, Data Json Mapper, AutoRoute and Retrofit files.

- `flutter pub run build_runner build --delete-conflicting-outputs`

#### Generators

- `Injector`: Inject all annotated classes in GetIt
- `Flutter Gen`: Generate class for assets variables. See the config in `pubspec.yaml` file section `flutter_gen`
- `Data Json Mapper`: used to serialize/deserialize objects.
- `AutoRoute`: used for routing/navigation
- `Retrofit`: Used to generated the code of your endpoints method.

### Easy Localization code generation

This command is to generate a new file containing all translations

- `flutter pub run easy_localization:generate --output-dir=lib/application/localizations --output-file=localizations.g.dart --format=json --source-dir=assets/translations`
  This command is to generate a new file containing all locales used.
- `flutter pub run easy_localization:generate -f keys --output-dir=lib/application/localizations --output-file=locale_keys.g.dart --source-dir=assets/translations`

## VSCode specifications

This project includes a `.vscode` folder where some files configured.

- `launch.json`: contains some launch configuration for `dev`, `prod` etc...
- `tasks.json`: contains some tasks configured like above code generation.

## Tests

### Unit test

To run an unit test use the command

- `flutter test test/[file_name]_test.dart`

### Widget test

To run a widget test use the command

- `flutter test test/[file_name]_test.dart`

### Integration test

To run an integration test, make sure you have an emulator or a device connected then run the command:

- `flutter drive --target=test_driver/app.dart --flavor=dev`
