class ScanPackage {
  final String id;
  final String nameRu;
  final String nameEn;
  final int scansCount;
  final String price;
  final String icon;

  const ScanPackage({
    required this.id,
    required this.nameRu,
    required this.nameEn,
    required this.scansCount,
    required this.price,
    required this.icon,
  });

  String localizedName(String langCode) => langCode == 'ru' ? nameRu : nameEn;

  String localizedDescription(String langCode) {
    final word = langCode == 'ru' ? 'анализов' : 'analyses';
    return '$scansCount $word';
  }
}

class ScanPackages {
  static const List<ScanPackage> packages = [
    ScanPackage(
      id: 'stainfix_drop_8',
      nameRu: 'Капля',
      nameEn: 'Drop',
      scansCount: 8,
      price: '79 ₽',
      icon: '💧',
    ),
    ScanPackage(
      id: 'stainfix_wash_15',
      nameRu: 'Стирка',
      nameEn: 'Wash',
      scansCount: 15,
      price: '179 ₽',
      icon: '🧺',
    ),
    ScanPackage(
      id: 'stainfix_drycleaning_25',
      nameRu: 'Химчистка',
      nameEn: 'Dry Clean',
      scansCount: 25,
      price: '329 ₽',
      icon: '✨',
    ),
  ];
}
