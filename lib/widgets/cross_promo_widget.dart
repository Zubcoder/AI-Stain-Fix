import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CrossPromoSection extends StatelessWidget {
  final String currentPackageId;

  const CrossPromoSection({super.key, required this.currentPackageId});

  static const _apps = <_AppInfo>[
    _AppInfo(
      nameRu: 'АгроСкан',
      nameEn: 'AgroScan',
      descRu: 'AI-агроном в кармане',
      descEn: 'AI agronomist in your pocket',
      packageId: 'com.zubcoder.agroscan',
      iconAsset: 'assets/cross_promo/agroscan.png',
    ),
    _AppInfo(
      nameRu: 'Умный МеханикAI',
      nameEn: 'Smart MechanicAI',
      descRu: 'AI-диагностика авто',
      descEn: 'AI car diagnostics',
      packageId: 'com.smartmechanic.smart_mechanic',
      iconAsset: 'assets/cross_promo/mechanic.png',
    ),
    _AppInfo(
      nameRu: 'Stain Fix',
      nameEn: 'Stain Fix',
      descRu: 'Удаление пятен по фото',
      descEn: 'Photo-based stain removal',
      packageId: 'com.zubcoder.ai_stain_fix',
      iconAsset: 'assets/cross_promo/stain_fix.png',
    ),
    _AppInfo(
      nameRu: 'ЕдаСкан',
      nameEn: 'FoodScan',
      descRu: 'Состав продуктов по фото',
      descEn: 'Food composition by photo',
      packageId: 'com.zubcoder.foodscan',
      iconAsset: 'assets/cross_promo/foodscan.png',
    ),
    _AppInfo(
      nameRu: 'AI Фармацевт',
      nameEn: 'AI Pharmacist',
      descRu: 'Проверка лекарств',
      descEn: 'Medication checker',
      packageId: 'com.zubcoder.aipharmacist',
      iconAsset: 'assets/cross_promo/pharmacist.png',
    ),
    _AppInfo(
      nameRu: 'AI Ландшафт',
      nameEn: 'AI Landscape',
      descRu: 'Дизайн участка по фото',
      descEn: 'Landscape design by photo',
      packageId: 'com.zubcoder.ai_landscape',
      iconAsset: 'assets/cross_promo/landscape.png',
    ),
    _AppInfo(
      nameRu: 'Город во Времени',
      nameEn: 'City in Time',
      descRu: 'Путешествие в прошлое',
      descEn: 'Journey to the past',
      packageId: 'com.zubkov.city_in_time',
      iconAsset: 'assets/cross_promo/cityintime.png',
    ),
    _AppInfo(
      nameRu: 'AI Кулинар',
      nameEn: 'AI Kulinar',
      descRu: 'Рецепты по фото',
      descEn: 'Recipes by photo',
      packageId: 'com.zubcoder.ai_kulinar',
      iconAsset: 'assets/cross_promo/kulinar.png',
    ),
    _AppInfo(
      nameRu: 'AI Ремонт',
      nameEn: 'AI Remont',
      descRu: 'Ремонт по фото',
      descEn: 'DIY repair by photo',
      packageId: 'com.zubcoder.ai_remont',
      iconAsset: 'assets/cross_promo/remont.png',
    ),
    _AppInfo(
      nameRu: 'AI Нумизмат',
      nameEn: 'AI Numizmat',
      descRu: 'Определение монет',
      descEn: 'Coin identification',
      packageId: 'com.zubcoder.ai_numizmat',
      iconAsset: 'assets/cross_promo/numizmat.png',
    ),
    _AppInfo(
      nameRu: 'AI Юрист',
      nameEn: 'AI Yurist',
      descRu: 'Юридическая помощь',
      descEn: 'Legal assistance',
      packageId: 'com.zubcoder.ai_yurist',
      iconAsset: 'assets/cross_promo/yurist.png',
    ),
    _AppInfo(
      nameRu: 'AI Лингвист',
      nameEn: 'AI Linguist',
      descRu: 'Учи английский с AI',
      descEn: 'Learn English with AI',
      packageId: 'com.zubcoder.ai_linguist',
      iconAsset: 'assets/cross_promo/linguist.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isRu = Localizations.localeOf(context).languageCode == 'ru';
    final filtered = _apps.where((a) => a.packageId != currentPackageId).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            isRu ? 'Другие приложения' : 'Other apps',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        ...filtered.map((app) => _CrossPromoTile(app: app, isRu: isRu)),
      ],
    );
  }
}

class _AppInfo {
  final String nameRu;
  final String nameEn;
  final String descRu;
  final String descEn;
  final String packageId;
  final String iconAsset;

  const _AppInfo({
    required this.nameRu,
    required this.nameEn,
    required this.descRu,
    required this.descEn,
    required this.packageId,
    required this.iconAsset,
  });
}

class _CrossPromoTile extends StatelessWidget {
  final _AppInfo app;
  final bool isRu;

  const _CrossPromoTile({required this.app, required this.isRu});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          app.iconAsset,
          width: 44,
          height: 44,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.apps, size: 24),
          ),
        ),
      ),
      title: Text(
        isRu ? app.nameRu : app.nameEn,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: theme.textTheme.bodyLarge?.color,
        ),
      ),
      subtitle: Text(
        isRu ? app.descRu : app.descEn,
        style: TextStyle(
          fontSize: 12,
          color: theme.textTheme.bodyMedium?.color,
        ),
      ),
      trailing: FilledButton(
        onPressed: () => _openStore(),
        style: FilledButton.styleFrom(
          backgroundColor: const Color(0xFF4CAF50),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          minimumSize: const Size(0, 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          isRu ? 'Скачать' : 'Install',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Future<void> _openStore() async {
    final uri = Uri.parse('https://apps.rustore.ru/app/${app.packageId}');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
