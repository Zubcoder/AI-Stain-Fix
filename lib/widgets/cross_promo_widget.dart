import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CrossPromoSection extends StatelessWidget {
  final String currentPackageId;

  const CrossPromoSection({super.key, required this.currentPackageId});

  static const _apps = <_AppInfo>[
    _AppInfo(
      nameRu: '\u0410\u0433\u0440\u043e\u0421\u043a\u0430\u043d',
      nameEn: 'AgroScan',
      descRu: 'AI-\u0430\u0433\u0440\u043e\u043d\u043e\u043c \u0432 \u043a\u0430\u0440\u043c\u0430\u043d\u0435',
      descEn: 'AI agronomist in your pocket',
      packageId: 'com.zubcoder.agroscan',
      color: Color(0xFF4CAF50),
      letter: '\u0410',
    ),
    _AppInfo(
      nameRu: '\u0423\u043c\u043d\u044b\u0439 \u041c\u0435\u0445\u0430\u043d\u0438\u043a',
      nameEn: 'Smart Mechanic',
      descRu: 'AI-\u0434\u0438\u0430\u0433\u043d\u043e\u0441\u0442\u0438\u043a\u0430 \u0430\u0432\u0442\u043e',
      descEn: 'AI car diagnostics',
      packageId: 'com.smartmechanic.smart_mechanic',
      color: Color(0xFFFF5722),
      letter: '\u041c',
    ),
    _AppInfo(
      nameRu: '\u041f\u044f\u0442\u043d\u043e\u0432\u044b\u0432\u043e\u0434\u0438\u0442\u0435\u043b\u044c',
      nameEn: 'AI Stain Fix',
      descRu: '\u0423\u0434\u0430\u043b\u0435\u043d\u0438\u0435 \u043f\u044f\u0442\u0435\u043d \u043f\u043e \u0444\u043e\u0442\u043e',
      descEn: 'Photo-based stain removal',
      packageId: 'com.zubcoder.ai_stain_fix',
      color: Color(0xFF9C27B0),
      letter: '\u041f',
    ),
    _AppInfo(
      nameRu: '\u0415\u0434\u0430\u0421\u043a\u0430\u043d',
      nameEn: 'FoodScan',
      descRu: '\u0421\u043e\u0441\u0442\u0430\u0432 \u043f\u0440\u043e\u0434\u0443\u043a\u0442\u043e\u0432 \u043f\u043e \u0444\u043e\u0442\u043e',
      descEn: 'Food composition by photo',
      packageId: 'com.zubcoder.foodscan',
      color: Color(0xFFFF9800),
      letter: '\u0415',
    ),
    _AppInfo(
      nameRu: 'AI \u0424\u0430\u0440\u043c\u0430\u0446\u0435\u0432\u0442',
      nameEn: 'AI Pharmacist',
      descRu: '\u041f\u0440\u043e\u0432\u0435\u0440\u043a\u0430 \u043b\u0435\u043a\u0430\u0440\u0441\u0442\u0432',
      descEn: 'Medication checker',
      packageId: 'com.zubcoder.aipharmacist',
      color: Color(0xFF00BCD4),
      letter: '\u0424',
    ),
    _AppInfo(
      nameRu: 'AI \u041b\u0430\u043d\u0434\u0448\u0430\u0444\u0442',
      nameEn: 'AI Landscape',
      descRu: '\u0414\u0438\u0437\u0430\u0439\u043d \u0443\u0447\u0430\u0441\u0442\u043a\u0430 \u043f\u043e \u0444\u043e\u0442\u043e',
      descEn: 'Landscape design by photo',
      packageId: 'com.zubcoder.ai_landscape',
      color: Color(0xFF8BC34A),
      letter: '\u041b',
    ),
    _AppInfo(
      nameRu: '\u0413\u043e\u0440\u043e\u0434 \u0432\u043e \u0412\u0440\u0435\u043c\u0435\u043d\u0438',
      nameEn: 'City in Time',
      descRu: '\u041f\u0443\u0442\u0435\u0448\u0435\u0441\u0442\u0432\u0438\u0435 \u0432 \u043f\u0440\u043e\u0448\u043b\u043e\u0435',
      descEn: 'Journey to the past',
      packageId: 'com.zubkov.city_in_time',
      color: Color(0xFF795548),
      letter: '\u0413',
    ),
    _AppInfo(
      nameRu: 'AI \u041a\u0443\u043b\u0438\u043d\u0430\u0440',
      nameEn: 'AI Kulinar',
      descRu: '\u0420\u0435\u0446\u0435\u043f\u0442\u044b \u043f\u043e \u0444\u043e\u0442\u043e',
      descEn: 'Recipes by photo',
      packageId: 'com.zubcoder.ai_kulinar',
      color: Color(0xFFE91E63),
      letter: '\u041a',
    ),
    _AppInfo(
      nameRu: 'AI \u0420\u0435\u043c\u043e\u043d\u0442',
      nameEn: 'AI Remont',
      descRu: '\u0421\u043c\u0435\u0442\u0430 \u0440\u0435\u043c\u043e\u043d\u0442\u0430 \u043f\u043e \u0444\u043e\u0442\u043e',
      descEn: 'Repair estimate by photo',
      packageId: 'com.zubcoder.ai_remont',
      color: Color(0xFFFF6D00),
      letter: '\u0420',
    ),
    _AppInfo(
      nameRu: 'AI \u041d\u0443\u043c\u0438\u0437\u043c\u0430\u0442',
      nameEn: 'AI Numizmat',
      descRu: '\u041e\u043f\u0440\u0435\u0434\u0435\u043b\u0438 \u043c\u043e\u043d\u0435\u0442\u0443 \u043f\u043e \u0444\u043e\u0442\u043e',
      descEn: 'Identify coins by photo',
      packageId: 'com.zubcoder.ai_numizmat',
      color: Color(0xFFFFD700),
      letter: '\u041d',
    ),
    _AppInfo(
      nameRu: 'AI \u042e\u0440\u0438\u0441\u0442',
      nameEn: 'AI Yurist',
      descRu: '\u042e\u0440\u0438\u0434\u0438\u0447\u0435\u0441\u043a\u0438\u0439 AI-\u043f\u043e\u043c\u043e\u0449\u043d\u0438\u043a',
      descEn: 'Legal AI assistant',
      packageId: 'com.zubcoder.ai_yurist',
      color: Color(0xFF1A237E),
      letter: '\u042e',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isRu = Localizations.localeOf(context).languageCode == 'ru';
    final apps =
        _apps.where((a) => a.packageId != currentPackageId).toList();
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            isRu ? '\u041d\u0430\u0448\u0438 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u044f' : 'Our Apps',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.primary,
              letterSpacing: 0.5,
            ),
          ),
        ),
        Card(
          child: Column(
            children: [
              for (int i = 0; i < apps.length; i++) ...[
                if (i > 0) const Divider(height: 1, indent: 56),
                _CrossPromoTile(app: apps[i], isRu: isRu),
              ],
            ],
          ),
        ),
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
  final Color color;
  final String letter;

  const _AppInfo({
    required this.nameRu,
    required this.nameEn,
    required this.descRu,
    required this.descEn,
    required this.packageId,
    required this.color,
    required this.letter,
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
      leading: CircleAvatar(
        backgroundColor: app.color,
        radius: 20,
        child: Text(
          app.letter,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
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
          isRu ? '\u0421\u043a\u0430\u0447\u0430\u0442\u044c' : 'Install',
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
