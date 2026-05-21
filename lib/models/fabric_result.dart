class CareWashing {
  final String temperature;
  final String mode;
  final String detergent;

  CareWashing({required this.temperature, required this.mode, required this.detergent});

  factory CareWashing.fromJson(Map<String, dynamic> json) {
    return CareWashing(
      temperature: json['temperature'] as String? ?? '',
      mode: json['mode'] as String? ?? '',
      detergent: json['detergent'] as String? ?? '',
    );
  }
}

class CareDrying {
  final bool machine;
  final String method;

  CareDrying({required this.machine, required this.method});

  factory CareDrying.fromJson(Map<String, dynamic> json) {
    return CareDrying(
      machine: json['machine'] as bool? ?? false,
      method: json['method'] as String? ?? '',
    );
  }
}

class CareIroning {
  final String temperature;
  final String method;

  CareIroning({required this.temperature, required this.method});

  factory CareIroning.fromJson(Map<String, dynamic> json) {
    return CareIroning(
      temperature: json['temperature'] as String? ?? '',
      method: json['method'] as String? ?? '',
    );
  }
}

class CareInstructions {
  final CareWashing washing;
  final CareDrying drying;
  final CareIroning ironing;
  final List<String> forbidden;

  CareInstructions({
    required this.washing,
    required this.drying,
    required this.ironing,
    required this.forbidden,
  });

  factory CareInstructions.fromJson(Map<String, dynamic> json) {
    return CareInstructions(
      washing: CareWashing.fromJson(json['washing'] as Map<String, dynamic>? ?? {}),
      drying: CareDrying.fromJson(json['drying'] as Map<String, dynamic>? ?? {}),
      ironing: CareIroning.fromJson(json['ironing'] as Map<String, dynamic>? ?? {}),
      forbidden: (json['forbidden'] as List?)?.map((e) => e.toString()).toList() ?? [],
    );
  }
}

class LabelSymbol {
  final String symbol;
  final String meaning;

  LabelSymbol({required this.symbol, required this.meaning});

  factory LabelSymbol.fromJson(Map<String, dynamic> json) {
    return LabelSymbol(
      symbol: json['symbol'] as String? ?? '',
      meaning: json['meaning'] as String? ?? '',
    );
  }
}

class FabricResult {
  final String fabricType;
  final String fabricSubtype;
  final String density;
  final String compositionEstimate;
  final CareInstructions careInstructions;
  final List<LabelSymbol>? labelSymbols;
  final String stainRemovalTip;
  final String disclaimer;
  final double confidence;
  final String? error;
  final DateTime analyzedAt;

  FabricResult({
    required this.fabricType,
    required this.fabricSubtype,
    required this.density,
    required this.compositionEstimate,
    required this.careInstructions,
    this.labelSymbols,
    required this.stainRemovalTip,
    required this.disclaimer,
    required this.confidence,
    this.error,
    DateTime? analyzedAt,
  }) : analyzedAt = analyzedAt ?? DateTime.now();

  bool get isError => error != null;

  factory FabricResult.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('error')) {
      return FabricResult(
        fabricType: '',
        fabricSubtype: '',
        density: '',
        compositionEstimate: '',
        careInstructions: CareInstructions.fromJson({}),
        stainRemovalTip: '',
        disclaimer: '',
        confidence: 0,
        error: json['error'] as String?,
      );
    }

    final labelsJson = json['label_symbols'] as List?;
    return FabricResult(
      fabricType: json['fabric_type'] as String? ?? '',
      fabricSubtype: json['fabric_subtype'] as String? ?? '',
      density: json['density'] as String? ?? '',
      compositionEstimate: json['composition_estimate'] as String? ?? '',
      careInstructions: CareInstructions.fromJson(
          json['care_instructions'] as Map<String, dynamic>? ?? {}),
      labelSymbols: labelsJson
          ?.map((e) => LabelSymbol.fromJson(e as Map<String, dynamic>))
          .toList(),
      stainRemovalTip: json['stain_removal_tip'] as String? ?? '',
      disclaimer: json['disclaimer'] as String? ?? '',
      confidence: (json['confidence'] as num?)?.toDouble() ?? 0,
    );
  }
}
