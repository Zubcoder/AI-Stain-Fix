class ChatMessage {
  final String id;
  final String role; // 'user' or 'assistant'
  final String text;
  final String? imagePath;
  final DateTime timestamp;
  final bool isLoading;
  final bool isError;

  ChatMessage({
    required this.id,
    required this.role,
    required this.text,
    this.imagePath,
    DateTime? timestamp,
    this.isLoading = false,
    this.isError = false,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toApiJson() => {
        'role': role,
        'text': text,
      };
}
