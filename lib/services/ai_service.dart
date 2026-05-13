import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/stain_result.dart';
import '../utils/constants.dart';

class AiService {
  static Future<StainResult> analyzeStain({
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
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        if (json['success'] == true && json['data'] != null) {
          return StainResult.fromJson(json['data'] as Map<String, dynamic>);
        }
        throw AiServiceException(
            json['error'] as String? ?? 'Неизвестная ошибка');
      } else if (response.statusCode == 503) {
        throw AiServiceException('AI-сервис временно недоступен');
      } else {
        throw AiServiceException(
            'Ошибка сервера: ${response.statusCode}');
      }
    } on AiServiceException {
      rethrow;
    } catch (e) {
      final msg = e.toString().toLowerCase();
      if (msg.contains('socketexception') ||
          msg.contains('timeout') ||
          msg.contains('connection refused')) {
        throw AiServiceException(
            'Нет подключения к интернету. Проверьте соединение.');
      }
      throw AiServiceException('Не удалось проанализировать. Попробуйте позже.');
    }
  }

  static Future<bool> checkHealth() async {
    try {
      final response = await http
          .get(Uri.parse('${AppConstants.baseUrl}/health'))
          .timeout(const Duration(seconds: 5));
      return response.statusCode == 200;
    } catch (_) {
      return false;
    }
  }
}

class AiServiceException implements Exception {
  final String message;
  AiServiceException(this.message);

  @override
  String toString() => message;
}
