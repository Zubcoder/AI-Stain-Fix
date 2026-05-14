class ScanPackage {
  final String id;
  final String name;
  final String description;
  final int scansCount;
  final String price;
  final String icon;

  const ScanPackage({
    required this.id,
    required this.name,
    required this.description,
    required this.scansCount,
    required this.price,
    required this.icon,
  });
}

class ScanPackages {
  static const List<ScanPackage> packages = [
    ScanPackage(
      id: 'stainfix_drop_8',
      name: 'Капля',
      description: '8 анализов',
      scansCount: 8,
      price: '79 ₽',
      icon: '💧',
    ),
    ScanPackage(
      id: 'stainfix_wash_15',
      name: 'Стирка',
      description: '15 анализов',
      scansCount: 15,
      price: '179 ₽',
      icon: '🧺',
    ),
    ScanPackage(
      id: 'stainfix_drycleaning_25',
      name: 'Химчистка',
      description: '25 анализов',
      scansCount: 25,
      price: '329 ₽',
      icon: '✨',
    ),
  ];
}
