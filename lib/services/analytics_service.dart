import 'package:appmetrica_plugin/appmetrica_plugin.dart';

class AnalyticsService {
  static Future<void> init(String apiKey) async {
    await AppMetrica.activate(AppMetricaConfig(apiKey));
  }

  static void logEvent(String name, [Map<String, Object>? params]) {
    if (params != null) {
      AppMetrica.reportEventWithMap(name, params);
    } else {
      AppMetrica.reportEvent(name);
    }
  }

  // — Onboarding —
  static void onboardingCompleted() => logEvent('onboarding_completed');

  // — Navigation —
  static void tabChanged(String tabName) =>
      logEvent('tab_changed', {'tab': tabName});

  // — Scanning —
  static void scanStarted(String mode) =>
      logEvent('scan_started', {'mode': mode});

  static void scanCompleted(String mode) =>
      logEvent('scan_completed', {'mode': mode});

  static void scanError(String mode, String error) =>
      logEvent('scan_error', {'mode': mode, 'error': error});

  // — Chat —
  static void chatMessageSent() => logEvent('chat_message_sent');

  static void chatResponseReceived() => logEvent('chat_response_received');

  // — PRO —
  static void proScreenOpened() => logEvent('pro_screen_opened');

  static void purchaseStarted(String productId) =>
      logEvent('purchase_started', {'product_id': productId});

  static void purchaseCompleted(String productId) =>
      logEvent('purchase_completed', {'product_id': productId});

  // — Share —
  static void shareAction(String contentType) =>
      logEvent('share_action', {'content_type': contentType});

  // — Settings —
  static void languageChanged(String lang) =>
      logEvent('language_changed', {'language': lang});

  static void themeChanged(String theme) =>
      logEvent('theme_changed', {'theme': theme});
}
