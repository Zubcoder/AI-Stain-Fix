import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/stain_result.dart';
import '../services/ai_service.dart';
import '../utils/constants.dart';
import '../utils/helpers.dart';

enum AnalysisState { idle, analyzing, done, error }

class StainProvider extends ChangeNotifier {
  AnalysisState _state = AnalysisState.idle;
  StainResult? _result;
  String? _error;
  final List<StainResult> _history = [];

  AnalysisState get state => _state;
  StainResult? get result => _result;
  String? get error => _error;
  List<StainResult> get history => List.unmodifiable(_history);

  Future<void> analyzeStain(Uint8List imageBytes, {String? fabricHint, String language = 'ru'}) async {
    _state = AnalysisState.analyzing;
    _error = null;
    notifyListeners();

    try {
      final base64 = encodeImageToBase64(imageBytes);
      _result = await AiService.analyzeStain(
        imageBase64: base64,
        fabricHint: fabricHint,
        language: language,
      );
      _history.insert(0, _result!);
      _state = AnalysisState.done;

      await _incrementScanCount();
    } on AiServiceException catch (e) {
      _error = e.message;
      _state = AnalysisState.error;
    } catch (e) {
      _error = 'Произошла ошибка. Попробуйте ещё раз.';
      _state = AnalysisState.error;
    }

    notifyListeners();
  }

  void reset() {
    _state = AnalysisState.idle;
    _result = null;
    _error = null;
    notifyListeners();
  }

  void removeFromHistory(int index) {
    if (index >= 0 && index < _history.length) {
      _history.removeAt(index);
      notifyListeners();
    }
  }

  Future<int> getRemainingScans() async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now().toIso8601String().substring(0, 10);
    final savedDate = prefs.getString(AppConstants.scanDatePrefKey) ?? '';

    if (savedDate != today) {
      await prefs.setString(AppConstants.scanDatePrefKey, today);
      await prefs.setInt(AppConstants.scanCountPrefKey, 0);
      return AppConstants.freeScansPerDay;
    }

    final usedScans = prefs.getInt(AppConstants.scanCountPrefKey) ?? 0;
    return (AppConstants.freeScansPerDay - usedScans)
        .clamp(0, AppConstants.freeScansPerDay);
  }

  Future<void> _incrementScanCount() async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now().toIso8601String().substring(0, 10);
    final savedDate = prefs.getString(AppConstants.scanDatePrefKey) ?? '';

    if (savedDate != today) {
      await prefs.setString(AppConstants.scanDatePrefKey, today);
      await prefs.setInt(AppConstants.scanCountPrefKey, 1);
    } else {
      final current = prefs.getInt(AppConstants.scanCountPrefKey) ?? 0;
      await prefs.setInt(AppConstants.scanCountPrefKey, current + 1);
    }
  }
}
