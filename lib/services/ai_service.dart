import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/chat_message.dart';
import '../models/fabric_result.dart';
import '../models/stain_result.dart';
import '../utils/constants.dart';

class AiService {
  static const int _maxRetries = 2;
  static const Duration _timeout = Duration(seconds: 60);

  static Future<StainResult> analyzeStain({
    required String imageBase64,
    String? fabricHint,
    String language = 'ru',
  }) async {
    AiServiceException? lastError;

    for (int attempt = 0; attempt < _maxRetries; attempt++) {
      try {
        return await _doAnalyze(
          imageBase64: imageBase64,
          fabricHint: fabricHint,
          language: language,
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
    String language = 'ru',
  }) async {
    try {
      final response = await http
          .post(
            Uri.parse('${AppConstants.baseUrl}/api/v1/ai/analyze'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'image_base64': imageBase64,
              'language': language,
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
            'Сервис перегружен. Повторяем запрос...',
            isRetryable: true);
      } else if (response.statusCode == 503) {
        throw AiServiceException(
            'Сервис временно недоступен. Попробуйте через минуту.',
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

  static Future<FabricResult> inspectFabric({
    required String imageBase64,
    String language = 'ru',
  }) async {
    AiServiceException? lastError;

    for (int attempt = 0; attempt < _maxRetries; attempt++) {
      try {
        return await _doFabricInspect(
          imageBase64: imageBase64,
          language: language,
        );
      } on AiServiceException catch (e) {
        lastError = e;
        if (!e.isRetryable || attempt == _maxRetries - 1) rethrow;
        await Future.delayed(Duration(seconds: 2 * (attempt + 1)));
      }
    }

    throw lastError ?? AiServiceException('Неизвестная ошибка');
  }

  static Future<FabricResult> _doFabricInspect({
    required String imageBase64,
    String language = 'ru',
  }) async {
    try {
      final response = await http
          .post(
            Uri.parse('${AppConstants.baseUrl}/api/v1/ai/fabric-inspect'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'image_base64': imageBase64,
              'language': language,
            }),
          )
          .timeout(_timeout);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        if (json['success'] == true && json['data'] != null) {
          return FabricResult.fromJson(json['data'] as Map<String, dynamic>);
        }
        throw AiServiceException(
            json['error'] as String? ?? 'Неизвестная ошибка');
      } else if (response.statusCode == 502) {
        throw AiServiceException(
            'Сервис перегружен. Повторяем запрос...',
            isRetryable: true);
      } else if (response.statusCode == 503) {
        throw AiServiceException(
            'Сервис временно недоступен. Попробуйте через минуту.',
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

  static Future<String> chat({
    required String message,
    required List<ChatMessage> history,
    String language = 'ru',
    File? imageFile,
  }) async {
    String? imageBase64;
    if (imageFile != null) {
      final bytes = await imageFile.readAsBytes();
      imageBase64 = base64Encode(bytes);
    }

    final response = await http.post(
      Uri.parse('${AppConstants.baseUrl}/api/v1/ai/chat'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'message': message,
        'image_base64': imageBase64,
        'history': history.map((m) => m.toJson()).toList(),
        'language': language,
      }),
    ).timeout(_timeout);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return data['reply'] as String? ?? '';
    } else {
      throw AiServiceException('Ошибка сервера: ${response.statusCode}');
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
