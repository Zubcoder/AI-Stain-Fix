import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:flutter/foundation.dart';

class CrashService {
  static String _lastScreen = 'unknown';

  static void setLastScreen(String screen) {
    _lastScreen = screen;
  }

  static void init() {
    FlutterError.onError = (details) {
      _reportFlutterError(details);
    };

    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      _reportPlatformError(error, stack);
      return true;
    };
  }

  static void _reportFlutterError(FlutterErrorDetails details) {
    AppMetrica.reportError(
      message: 'FlutterError: ${details.exceptionAsString()}',
      errorDescription: AppMetricaErrorDescription.fromObjectAndStackTrace(
        details.exception,
        details.stack ?? StackTrace.current,
      ),
    );

    if (kDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    }
  }

  static void _reportPlatformError(Object error, StackTrace stack) {
    AppMetrica.reportError(
      message: 'PlatformError: $error',
      errorDescription: AppMetricaErrorDescription.fromObjectAndStackTrace(
        error,
        stack,
      ),
    );

    if (kDebugMode) {
      debugPrint('PlatformError: $error\n$stack');
    }
  }

  static void reportNonFatal(String message, {Object? error, StackTrace? stack}) {
    AppMetrica.reportError(
      message: 'NonFatal[$_lastScreen]: $message',
      errorDescription: error != null
          ? AppMetricaErrorDescription.fromObjectAndStackTrace(
              error,
              stack ?? StackTrace.current,
            )
          : null,
    );
  }

  static void logBreadcrumb(String message) {
    AppMetrica.reportEvent('breadcrumb: $message');
  }
}
