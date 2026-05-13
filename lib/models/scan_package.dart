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
      id: 'stainfix_drop_10',
      name: 'Капля',
      description: '10 анализов',
      scansCount: 10,
      price: '79 ₽',
      icon: '💧',
    ),
    ScanPackage(
      id: 'stainfix_wash_25',
      name: 'Стирка',
      description: '25 анализов',
      scansCount: 25,
      price: '179 ₽',
      icon: '🧺',
    ),
    ScanPackage(
      id: 'stainfix_drycleaning_50',
      name: 'Химчистка',
      description: '50 анализов',
      scansCount: 50,
      price: '329 ₽',
      icon: '✨',
    ),
  ];
}
