import 'package:app/application/kernel/app_config.dart';
import 'package:app/application/kernel/app_kernel.dart';

import 'main.common.mapper.g.dart' show initializeJsonMapperAsync;

///
/// Common main for all environment
///
Future<void> mainCommon(AppConfig appConfig) async {
  // Initialize the application
  final AppKernel kernel = AppKernel(appConfig: appConfig);
  await kernel.ensureInitialized(
      initializeJsonMapperAsync: initializeJsonMapperAsync);

  // Run the application
  // Will call runApp
  kernel.run();
}

/// This method is required for data_json_mapper for class generation
void main() {
  mainCommon(const AppConfig(
    appName: 'Pause Défi',
    serverUrl: 'http://localhost:5000/',
  ));
}
