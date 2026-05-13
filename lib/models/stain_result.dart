class StainResult {
  final String stainType;
  final String stainTypeEn;
  final String fabricType;
  final String fabricTypeEn;
  final String difficulty;
  final int difficultyLevel;
  final List<String> steps;
  final List<String> products;
  final List<String> warnings;
  final String summary;
  final DateTime analyzedAt;

  StainResult({
    required this.stainType,
    required this.stainTypeEn,
    required this.fabricType,
    required this.fabricTypeEn,
    required this.difficulty,
    required this.difficultyLevel,
    required this.steps,
    required this.products,
    required this.warnings,
    required this.summary,
    DateTime? analyzedAt,
  }) : analyzedAt = analyzedAt ?? DateTime.now();

  factory StainResult.fromJson(Map<String, dynamic> json) {
    return StainResult(
      stainType: json['stain_type'] as String? ?? 'Неизвестно',
      stainTypeEn: json['stain_type_en'] as String? ?? 'Unknown',
      fabricType: json['fabric_type'] as String? ?? 'Неизвестно',
      fabricTypeEn: json['fabric_type_en'] as String? ?? 'Unknown',
      difficulty: json['difficulty'] as String? ?? 'Средне',
      difficultyLevel: json['difficulty_level'] as int? ?? 2,
      steps: (json['steps'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      warnings: (json['warnings'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      summary: json['summary'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stain_type': stainType,
      'stain_type_en': stainTypeEn,
      'fabric_type': fabricType,
      'fabric_type_en': fabricTypeEn,
      'difficulty': difficulty,
      'difficulty_level': difficultyLevel,
      'steps': steps,
      'products': products,
      'warnings': warnings,
      'summary': summary,
      'analyzed_at': analyzedAt.toIso8601String(),
    };
  }
}
