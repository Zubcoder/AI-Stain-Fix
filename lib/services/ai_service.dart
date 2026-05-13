import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/stain_result.dart';
import '../utils/constants.dart';

class AiService {
  static const int _maxRetries = 2;
  static const Duration _timeout = Duration(seconds: 60);

  static Future<StainResult> analyzeStain({
    required String imageBase64,
    String? fabricHint,
  }) async {
    AiServiceException? lastError;

    for (int attempt = 0; attempt < _maxRetries; attempt++) {
      try {
        return await _doAnalyze(
          imageBase64: imageBase64,
          fabricHint: fabricHint,
        );
      } on AiServiceException catch (e) {
        lastError = e;
        if (!e.isRetryable || attempt == _maxRetries - 1) rethrow;
        await Future.delayed(Duration(seconds: 2 * (attempt + 1)));
      }
    }

    throw lastError ?? AiServiceException('Неизвестная ошибка');
  }

  static Future<StainResult> _doAnalyze({
    required String imageBase64,
    String? fabricHint,
  }) async {
    try {
      final response = await http
          .post(
            Uri.parse('${AppConstants.baseUrl}/api/v1/ai/analyze'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'image_base64': imageBase64,
              // ignore: use_null_aware_elements
              if (fabricHint != null) 'fabric_hint': fabricHint,
            }),
          )
          .timeout(_timeout);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        if (json['success'] == true && json['data'] != null) {
          return StainResult.fromJson(json['data'] as Map<String, dynamic>);
        }
        throw AiServiceException(
            json['error'] as String? ?? 'Неизвестная ошибка');
      } else if (response.statusCode == 502) {
        throw AiServiceException(
            'AI-сервис перегружен. Повторяем запрос...',
            isRetryable: true);
      } else if (response.statusCode == 503) {
        throw AiServiceException(
            'AI-сервис временно недоступен. Попробуйте через минуту.',
            isRetryable: true);
      } else {
        throw AiServiceException(
            'Ошибка сервера: ${response.statusCode}');
      }
    } on AiServiceException {
      rethrow;
    } catch (e) {
      final msg = e.toString().toLowerCase();
      if (msg.contains('timeout')) {
        throw AiServiceException(
            'Сервер долго отвечает. Повторяем...',
            isRetryable: true);
      }
      if (msg.contains('socketexception') ||
          msg.contains('connection refused') ||
          msg.contains('no route to host') ||
          msg.contains('network is unreachable')) {
        throw AiServiceException(
            'Нет подключения к серверу. Проверьте интернет.');
      }
      throw AiServiceException('Не удалось проанализировать. Попробуйте позже.');
    }
  }

  static Future<bool> checkHealth() async {
    try {
      final response = await http
          .get(Uri.parse('${AppConstants.baseUrl}/health'))
          .timeout(const Duration(seconds: 10));
      return response.statusCode == 200;
    } catch (_) {
      return false;
    }
  }
}

class AiServiceException implements Exception {
  final String message;
  final bool isRetryable;
  AiServiceException(this.message, {this.isRetryable = false});

  @override
  String toString() => message;
}
