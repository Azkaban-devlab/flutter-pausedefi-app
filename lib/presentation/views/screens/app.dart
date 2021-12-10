import 'package:app/application/injections/injector.dart';
import 'package:app/application/injections/provider_wrapper.dart';
import 'package:app/application/kernel/app_container.dart';
import 'package:app/application/routing/app.router.dart';
import 'package:app/domain/services/helpers/navigation.helper.dart';
import 'package:app/domain/services/injected/http_interceptor.service.dart';
import 'package:app/domain/services/injected/theme.service.dart';
import 'package:app/presentation/views/widgets/utilities/circular_progress.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///
/// [App]
///
/// First/main Widget
///
class App extends StatefulWidget {
  ///
  /// Constructor
  ///
  const App({
    Key? key,
    required this.providerWrapper,
    this.onLaunch,
    this.onDispose,
  }) : super(key: key);

  /// When app first build
  final VoidCallback? onLaunch;

  /// When app disposed
  final VoidCallback? onDispose;

  /// [ProviderWrapper]
  final ProviderWrapper providerWrapper;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final AppRouter _appRouter = injector<AppRouter>();
    return MultiProvider(
      providers: widget.providerWrapper.provided(),
      child: Builder(
        builder: (BuildContext context) {
          return Consumer<CurrentThemeMode>(
            builder: (BuildContext context, CurrentThemeMode themeMode,
                Widget? child) {
              return MaterialApp.router(
                routeInformationParser: _appRouter.defaultRouteParser(),
                routerDelegate: _appRouter.delegate(
                  navigatorObservers: () => <NavigatorObserver>[
                    TitleUpdateObserver(),
                  ],
                  placeholder: (BuildContext context) {
                    return Container(
                      color: Colors.white,
                      child: const Center(
                        child: CircularProgress(),
                      ),
                    );
                  },
                ),
                title: AppContainer().appConfig.appName!,
                debugShowCheckedModeBanner: false,
                darkTheme: ThemeService.injected().darkTheme,
                theme: ThemeService.injected().theme,
                themeMode: themeMode.value,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    widget.onDispose?.call();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() {
    injector<HttpInterceptorService>().startListening();
    if (WidgetsBinding.instance != null) {
      WidgetsBinding.instance!
          .addPostFrameCallback((_) => widget.onLaunch?.call());
    }
    if (mounted) {
      setState(() {});
    }
  }
}
