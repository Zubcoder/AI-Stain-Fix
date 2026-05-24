import 'dart:io';

import 'package:flutter/foundation.dart';
import '../models/chat_message.dart';
import '../services/chat_service.dart';

class ChatProvider extends ChangeNotifier {
  final ChatService _chatService = ChatService();

  List<ChatMessage> _messages = [];
  bool _isSending = false;

  List<ChatMessage> get messages => List.unmodifiable(_messages);
  bool get isSending => _isSending;

  Future<void> sendMessage({
    required String text,
    File? imageFile,
    String language = 'ru',
  }) async {
    final userMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      role: 'user',
      text: text,
      imagePath: imageFile?.path,
    );
    _messages.add(userMessage);

    final loadingId = '${DateTime.now().millisecondsSinceEpoch}_loading';
    final loadingMessage = ChatMessage(
      id: loadingId,
      role: 'assistant',
      text: '',
      isLoading: true,
    );
    _messages.add(loadingMessage);
    _isSending = true;
    notifyListeners();

    try {
      final reply = await _chatService.sendMessage(
        message: text,
        history: _messages
            .where((m) => !m.isLoading && !m.isError)
            .toList(),
        imageFile: imageFile,
        language: language,
      );

      final idx = _messages.indexWhere((m) => m.id == loadingId);
      if (idx != -1) {
        _messages[idx] = ChatMessage(
          id: loadingId,
          role: 'assistant',
          text: reply,
        );
      }
    } catch (e) {
      final idx = _messages.indexWhere((m) => m.id == loadingId);
      if (idx != -1) {
        _messages[idx] = ChatMessage(
          id: loadingId,
          role: 'assistant',
          text: e.toString(),
          isError: true,
        );
      }
    }

    _isSending = false;
    notifyListeners();
  }

  void clearChat() {
    _messages = [];
    notifyListeners();
  }
}
