import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';

enum SubscriptionType { free, pro }

class SubscriptionProvider extends ChangeNotifier {
  SubscriptionType _type = SubscriptionType.free;
  int _bonusScans = 0;

  SubscriptionType get type => _type;
  int get bonusScans => _bonusScans;
  bool get isPro => _type == SubscriptionType.pro;

  Future<int> getAvailableScans() async {
    if (isPro) return 999;

    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now().toIso8601String().substring(0, 10);
    final savedDate = prefs.getString(AppConstants.scanDatePrefKey) ?? '';

    int freeRemaining;
    if (savedDate != today) {
      freeRemaining = AppConstants.freeScansPerDay;
    } else {
      final used = prefs.getInt(AppConstants.scanCountPrefKey) ?? 0;
      freeRemaining = (AppConstants.freeScansPerDay - used)
          .clamp(0, AppConstants.freeScansPerDay);
    }

    return freeRemaining + _bonusScans;
  }

  void addBonusScans(int count) {
    _bonusScans += count;
    notifyListeners();
  }

  void setPro() {
    _type = SubscriptionType.pro;
    notifyListeners();
  }
}
