import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;

  ThemeMode get themeMode => _themeMode;
  bool get isDark => _themeMode == ThemeMode.dark;

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(AppConstants.themePrefKey);
    if (value == 'light') {
      _themeMode = ThemeMode.light;
    } else {
      _themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }

  void setTheme(ThemeMode mode) {
    _themeMode = mode;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(
          AppConstants.themePrefKey, mode == ThemeMode.light ? 'light' : 'dark');
    });
    notifyListeners();
  }

  void toggleTheme() {
    setTheme(isDark ? ThemeMode.light : ThemeMode.dark);
  }
}
