import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import '../models/chat_message.dart';
import '../utils/constants.dart';

class ChatService {
  Future<String> sendMessage({
    required String message,
    required List<ChatMessage> history,
    File? imageFile,
    String language = 'ru',
  }) async {
    String? imageBase64;
    if (imageFile != null) {
      final bytes = await imageFile.readAsBytes();
      imageBase64 = base64Encode(bytes);
    }

    final body = <String, dynamic>{
      'message': message,
      'history': history
          .where((m) => !m.isLoading && !m.isError)
          .map((m) => m.toApiJson())
          .toList(),
      'language': language,
    };
    if (imageBase64 != null) {
      body['image_base64'] = imageBase64;
    }

    final response = await http.post(
      Uri.parse('${AppConstants.baseUrl}/api/v1/ai/chat'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    ).timeout(const Duration(seconds: 90));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return data['reply'] as String? ?? '';
    } else {
      throw Exception('Server error: ${response.statusCode}');
    }
  }
}
