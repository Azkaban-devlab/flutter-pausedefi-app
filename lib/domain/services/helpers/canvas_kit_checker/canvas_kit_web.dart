// ignore: avoid_web_libraries_in_flutter
import 'dart:js' show context;

/// Whether the CanvasKit renderer is being used on web.
///
/// Always returns `false` on non-web.
bool get isCanvasKit => context['flutterCanvasKit'] != null;
