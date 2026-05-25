class ChatMessage {
  final String role;
  final String text;
  final DateTime timestamp;

  ChatMessage({
    required this.role,
    required this.text,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  bool get isUser => role == 'user';

  Map<String, dynamic> toJson() => {
        'role': role,
        'text': text,
      };
}
