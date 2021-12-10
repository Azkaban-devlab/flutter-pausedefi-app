import 'package:app/application/injections/injector.dart';
import 'package:app/domain/data/resources/http/dio/interceptors/interceptor_manager.dart';
import 'package:app/domain/data/resources/http/dio/interceptors/refresh_token.interceptor.dart';
import 'package:injectable/injectable.dart';

///
/// [HttpInterceptorService]
///
@singleton
class HttpInterceptorService {
  ///
  /// interceptorManager
  ///
  final InterceptorManager interceptorManager;

  ///
  /// Constructor
  ///
  HttpInterceptorService(this.interceptorManager);

  ///
  /// Get injected [HttpInterceptorService]
  ///
  factory HttpInterceptorService.injected() =>
      injector<HttpInterceptorService>();

  ///
  /// Start listening to event
  ///
  void startListening() {
    interceptorManager.canEmit();
    interceptorManager.stream.listen((InterceptorEvent<dynamic> event) {
      if (event is RefreshTokenInterceptorFailedEvent) {
        _handleRefreshTokenFailedEvent();
      }
    });
  }

  void _handleRefreshTokenFailedEvent() {
    Future<dynamic>.delayed(const Duration(seconds: 4), () async {
      try {
        // await DialogService.of(AppRouter().navigatorKey.currentContext)
        //     .showWarning(
        //         AppLocalizations.of(AppRouter().navigatorKey.currentContext)
        //             .sessionExpired);
        // NavigationService.of(AppRouter().navigatorKey.currentContext)
        // .logoutUser(AppRouter().navigatorKey.currentContext, confirm: true);
      } catch (e) {
        //
      }
    });
  }
}
