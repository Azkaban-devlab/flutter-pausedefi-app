import 'dart:async';

import 'package:app/application/injections/injector.dart';
import 'package:app/application/injections/provider_wrapper.dart';
import 'package:app/application/localizations/localizations.g.dart';
import 'package:app/domain/services/injected/authentication.service.dart';
import 'package:app/domain/services/injected/theme.service.dart';
import 'package:app/presentation/views/screens/app.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:dart_json_mapper_flutter/dart_json_mapper_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart' as FlutterFoundation;
import 'package:flutter/widgets.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app_config.dart';
import 'app_container.dart';

///
/// [AppKernel]
///
class AppKernel with WidgetsBindingObserver {
  ///
  /// [AppConfig]
  ///
  final AppConfig appConfig;

  ///
  /// [ProviderWrapper]
  ///
  final ProviderWrapper providerWrapper;

  ///
  /// [AppContainer]
  ///
  final AppContainer appContainer;

  /// constructor
  AppKernel({required this.appConfig})
      : providerWrapper = ProviderWrapper(),
        appContainer = AppContainer.init(appConfig);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    appContainer.state.appLifecycleState = state;
  }

  ///
  /// Run the application
  ///
  /// It will execute runApp
  /// It must be after [Application.initialize] static method
  void run() {
    appContainer.state.launching = false;
    runApp(
      EasyLocalization(
        supportedLocales: appContainer.locales,
        path: 'assets/translations',
        assetLoader: const CodegenLoader(),
        child: App(
          onLaunch: _appLaunched,
          onDispose: _appDisposed,
          providerWrapper: providerWrapper,
        ),
      ),
    );
  }

  void _appDisposed() {
    WidgetsBinding.instance!.removeObserver(this);
  }

  void _appLaunched() {
    appContainer.state.launched = true;
  }

  Future<void> _initialize() async {
    if (FlutterFoundation.kIsWeb) {
      setPathUrlStrategy();
    }
    WidgetsBinding.instance!.addObserver(this);
    await initializeInjections();
    await _initializeServices();
    await providerWrapper.initialize();
  }

  Future<void> _initializeServices() async {
    await AuthenticationService.injected().initialize();
    await ThemeService.injected().initialize();
  }

  ///
  /// Initialize the application
  ///
  Future<void> ensureInitialized(
      {required Future<JsonMapper> Function(
              {Iterable<JsonMapperAdapter> adapters})
          initializeJsonMapperAsync}) async {
    // Initialize widgets
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize translations
    await EasyLocalization.ensureInitialized();

    // Initialize generated serializable classes
    await initializeJsonMapperAsync(
        adapters: <JsonMapperAdapter>[flutterAdapter]);
    await _initialize();
  }
}
