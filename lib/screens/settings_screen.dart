import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/locale_provider.dart';
import '../utils/constants.dart';
import 'onboarding_screen.dart';
import 'privacy_policy_screen.dart';
import 'terms_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProv = context.watch<LocaleProvider>();
    final isRu = localeProv.locale.languageCode == 'ru';

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(isRu ? 'Настройки' : 'Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(isRu ? 'Основные' : 'General', [
            _SettingsTile(
              icon: Icons.language,
              title: isRu ? 'Язык' : 'Language',
              subtitle: isRu ? 'Русский' : 'English',
              onTap: () => _showLanguageDialog(context, localeProv),
            ),
          ]),
          const SizedBox(height: 16),
          _buildSection(isRu ? 'О приложении' : 'About', [
            _SettingsTile(
              icon: Icons.help_outline,
              title: isRu ? 'Как пользоваться' : 'How to use',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) =>
                        const OnboardingScreen(isFromSettings: true),
                  ),
                );
              },
            ),
            _SettingsTile(
              icon: Icons.mail_outline,
              title: isRu ? 'Поддержка' : 'Support',
              subtitle: AppConstants.supportEmail,
              onTap: () => _launchSupport(),
            ),
            _SettingsTile(
              icon: Icons.star_outline,
              title: isRu ? 'Оценить в RuStore' : 'Rate in RuStore',
              onTap: () {},
            ),
            _SettingsTile(
              icon: Icons.privacy_tip_outlined,
              title: isRu ? 'Политика конфиденциальности' : 'Privacy policy',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const PrivacyPolicyScreen(),
                  ),
                );
              },
            ),
            _SettingsTile(
              icon: Icons.description_outlined,
              title: isRu ? 'Пользовательское соглашение' : 'Terms of service',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const TermsScreen(),
                  ),
                );
              },
            ),
            _SettingsTile(
              icon: Icons.info_outline,
              title: isRu ? 'Версия' : 'Version',
              subtitle: AppConstants.appVersion,
              onTap: null,
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<_SettingsTile> tiles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: tiles.asMap().entries.map((entry) {
              final i = entry.key;
              final tile = entry.value;
              return Column(
                children: [
                  ListTile(
                    leading: Icon(tile.icon, color: AppColors.primary, size: 22),
                    title: Text(
                      tile.title,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: tile.subtitle != null
                        ? Text(
                            tile.subtitle!,
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 13,
                            ),
                          )
                        : null,
                    trailing: tile.onTap != null
                        ? const Icon(Icons.chevron_right,
                            color: AppColors.textSecondary, size: 20)
                        : null,
                    onTap: tile.onTap,
                  ),
                  if (i < tiles.length - 1)
                    const Divider(
                      height: 1,
                      indent: 56,
                      color: AppColors.divider,
                    ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  void _showLanguageDialog(BuildContext context, LocaleProvider localeProv) {
    final isRu = localeProv.locale.languageCode == 'ru';

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Text(isRu ? 'Выбор языка' : 'Select language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Русский'),
              leading: const Text('🇷🇺', style: TextStyle(fontSize: 24)),
              trailing: isRu
                  ? const Icon(Icons.check, color: AppColors.primary)
                  : null,
              onTap: () {
                localeProv.setLocale(const Locale('ru'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('English'),
              leading: const Text('🇬🇧', style: TextStyle(fontSize: 24)),
              trailing: !isRu
                  ? const Icon(Icons.check, color: AppColors.primary)
                  : null,
              onTap: () {
                localeProv.setLocale(const Locale('en'));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchSupport() async {
    final uri = Uri(
      scheme: 'mailto',
      path: AppConstants.supportEmail,
      queryParameters: {
        'subject': '${AppConstants.appName} v${AppConstants.appVersion} — Обратная связь',
        'body': 'Опишите проблему:\n',
      },
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}

class _SettingsTile {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;

  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
  });
}
