import 'package:app/application/injections/injector.dart';
import 'package:app/domain/communication/states/auth.state.dart';
import 'package:app/domain/services/injected/authentication.service.dart';
import 'package:app/domain/services/injected/theme.service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

///
/// [ProviderWrapper]
///
class ProviderWrapper {
  ///
  /// Constructor
  ///
  ProviderWrapper();

  ///
  /// Initialize this injection
  ///
  Future<void> initialize() async {}

  ///
  /// Get all provided class
  ///
  List<SingleChildWidget> provided() {
    return <SingleChildWidget>[
      ChangeNotifierProvider<AuthState>.value(
        value: injector<AuthenticationService>().authState,
      ),
      ChangeNotifierProvider<CurrentThemeMode>.value(
        value: ThemeService.injected().currentThemeMode,
      ),
    ];
  }
}
