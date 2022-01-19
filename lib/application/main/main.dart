import 'package:app/application/kernel/app_config.dart';
import 'package:app/application/main/main.common.dart' show mainCommon;
import 'package:app/domain/services/helpers/javascript/helper.dart';

void main() {
  mainCommon(AppConfig(
    appName: appName ?? 'Pause Défi',
    serverUrl: apiUrl ?? 'http://pausedefi.online',
  ));
}
