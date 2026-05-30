import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:image_picker/image_picker.dart';

import '../l10n/app_localizations.dart';
import '../models/chat_message.dart';
import '../services/ai_service.dart';
import '../utils/constants.dart';
import '../services/analytics_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];
  File? _pendingImage;
  bool _isLoading = false;

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty && _pendingImage == null) return;

    final userMessage = ChatMessage(role: 'user', text: text.isNotEmpty ? text : 'Что на фото?');

    AnalyticsService.chatMessageSent();
    setState(() {
      _messages.add(userMessage);
      _isLoading = true;
      _controller.clear();
    });
    _scrollToBottom();

    try {
      final reply = await AiService.chat(
        message: userMessage.text,
        history: _messages.where((m) => m != userMessage).toList(),
        language: 'ru',
        imageFile: _pendingImage,
      );

      AnalyticsService.chatResponseReceived();
      setState(() {
        _messages.add(ChatMessage(role: 'assistant', text: reply));
        _pendingImage = null;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _messages.add(ChatMessage(role: 'assistant', text: 'Ошибка соединения. Попробуйте позже.'));
        _isLoading = false;
      });
    }
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final xFile = await picker.pickImage(source: ImageSource.camera, maxWidth: 1280, imageQuality: 80);
    if (xFile != null) {
      setState(() => _pendingImage = File(xFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.chatTitle),
        actions: [
          if (_messages.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_outline_rounded),
              onPressed: () => setState(() => _messages.clear()),
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _messages.isEmpty
                ? _buildEmptyState(l10n, theme)
                : ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    itemCount: _messages.length + (_isLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == _messages.length) {
                        return _buildTypingIndicator(theme);
                      }
                      return _MessageBubble(message: _messages[index], theme: theme);
                    },
                  ),
          ),
          if (_pendingImage != null) _buildImagePreview(theme),
          _buildInputBar(l10n, theme),
        ],
      ),
    );
  }

  Widget _buildEmptyState(AppLocalizations l10n, ThemeData theme) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.chat_bubble_outline_rounded,
                size: 64, color: AppColors.primary.withValues(alpha: 0.3)),
            const SizedBox(height: 16),
            Text(l10n.chatEmpty,
                style: TextStyle(fontSize: 16, color: theme.textTheme.bodyMedium?.color),
                textAlign: TextAlign.center),
            const SizedBox(height: 24),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                _SuggestionChip(label: l10n.chatSuggestion1, onTap: () {
                  _controller.text = l10n.chatSuggestion1;
                  _sendMessage();
                }),
                _SuggestionChip(label: l10n.chatSuggestion2, onTap: () {
                  _controller.text = l10n.chatSuggestion2;
                  _sendMessage();
                }),
                _SuggestionChip(label: l10n.chatSuggestion3, onTap: () {
                  _controller.text = l10n.chatSuggestion3;
                  _sendMessage();
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypingIndicator(ThemeData theme) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 16, height: 16,
                child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primary)),
            const SizedBox(width: 8),
            Text('...', style: TextStyle(color: theme.textTheme.bodyMedium?.color)),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePreview(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(_pendingImage!, width: 48, height: 48, fit: BoxFit.cover),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text('Фото прикреплено',
              style: TextStyle(fontSize: 13, color: theme.textTheme.bodyMedium?.color))),
          IconButton(icon: const Icon(Icons.close, size: 20),
              onPressed: () => setState(() => _pendingImage = null)),
        ],
      ),
    );
  }

  Widget _buildInputBar(AppLocalizations l10n, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        border: Border(top: BorderSide(color: theme.dividerColor)),
      ),
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.camera_alt_rounded, color: AppColors.primary),
              onPressed: _isLoading ? null : _pickImage),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: l10n.chatHint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
                filled: true,
                fillColor: theme.colorScheme.surfaceContainerHighest,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              ),
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => _sendMessage(),
              maxLines: 3, minLines: 1,
            ),
          ),
          const SizedBox(width: 4),
          IconButton(icon: Icon(Icons.send_rounded, color: AppColors.primary),
              onPressed: _isLoading ? null : _sendMessage),
        ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final ThemeData theme;
  const _MessageBubble({required this.message, required this.theme});

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
        decoration: BoxDecoration(
          color: isUser ? AppColors.primary : theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16), topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isUser ? 16 : 4),
            bottomRight: Radius.circular(isUser ? 4 : 16),
          ),
        ),
        child: isUser
            ? Text(message.text, style: const TextStyle(color: Colors.white, fontSize: 15))
            : MarkdownBody(data: message.text, styleSheet: MarkdownStyleSheet(
                p: TextStyle(color: theme.textTheme.bodyLarge?.color, fontSize: 15))),
      ),
    );
  }
}

class _SuggestionChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _SuggestionChip({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(label, style: const TextStyle(fontSize: 13)),
      onPressed: onTap,
      backgroundColor: AppColors.primary.withValues(alpha: 0.1),
      side: BorderSide(color: AppColors.primary.withValues(alpha: 0.3)),
    );
  }
}
