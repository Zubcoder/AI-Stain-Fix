import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  static bool _initialized = false;

  static Future<void> init() async {
    if (_initialized) return;
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: androidSettings);
    await _plugin.initialize(settings);
    _initialized = true;
  }

  static Future<void> _ensureInitialized() async {
    if (!_initialized) await init();
  }

  static Future<void> scheduleDailyReminder({
    required bool enabled,
    required String title,
    required String body,
  }) async {
    await _ensureInitialized();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications_enabled', enabled);

    try {
      await _plugin.cancelAll();
    } catch (_) {}

    if (!enabled) return;

    bool hasPermission = true;
    try {
      final android = _plugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();
      if (android != null) {
        final granted = await android.requestNotificationsPermission();
        hasPermission = granted == true;
      }
    } catch (_) {
      hasPermission = false;
    }

    if (!hasPermission) {
      await prefs.setBool('notifications_enabled', false);
      throw Exception('permission_denied');
    }

    const androidDetails = AndroidNotificationDetails(
      'daily_reminder',
      'Daily Reminders',
      channelDescription: 'Stain cleaning reminders',
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
      icon: '@mipmap/ic_launcher',
    );
    const details = NotificationDetails(android: androidDetails);

    await _plugin.periodicallyShow(
      0,
      title,
      body,
      RepeatInterval.daily,
      details,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  static Future<bool> isEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('notifications_enabled') ?? false;
  }
}
