import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF0A0E21);
  static const Color surface = Color(0xFF1A1F38);
  static const Color surfaceLight = Color(0xFF252B48);
  static const Color primary = Color(0xFF7C4DFF);
  static const Color primaryLight = Color(0xFFA47AFF);
  static const Color accent = Color(0xFF00E5FF);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF8E95B4);
  static const Color warning = Color(0xFFFFD600);
  static const Color error = Color(0xFFFF5252);
  static const Color success = Color(0xFF4CAF50);
  static const Color cardBackground = Color(0xFF161B33);
  static const Color divider = Color(0xFF2A3052);
  static const Color shimmer = Color(0xFF2A3052);
}

class AppConstants {
  static const String appName = 'Stain Fix';
  static const String appNameRu = 'Пятновыводитель';
  static const String appTagline = 'Умное удаление пятен по фото';
  static const String appVersion = '1.0.0';
  static const String supportEmail = 'ai.stain.fix.app@gmail.com';

  static const String onboardingDonePrefKey = 'onboarding_done';
  static const String languagePrefKey = 'language';
  static const String themePrefKey = 'theme_mode';

  static const int freeScansPerDay = 5;
  static const String scanCountPrefKey = 'scan_count';
  static const String scanDatePrefKey = 'scan_date';

  static const String baseUrl = 'https://ai-stain-fix-api.fly.dev';
}
