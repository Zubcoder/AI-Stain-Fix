import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/constants.dart';
import 'onboarding_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection('Основные', [
            _SettingsTile(
              icon: Icons.language,
              title: 'Язык',
              subtitle: 'Русский',
              onTap: () => _showLanguageDialog(context),
            ),
          ]),
          const SizedBox(height: 16),
          _buildSection('О приложении', [
            _SettingsTile(
              icon: Icons.help_outline,
              title: 'Как пользоваться',
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
              title: 'Поддержка',
              subtitle: AppConstants.supportEmail,
              onTap: () => _launchSupport(),
            ),
            _SettingsTile(
              icon: Icons.star_outline,
              title: 'Оценить в RuStore',
              onTap: () {},
            ),
            _SettingsTile(
              icon: Icons.privacy_tip_outlined,
              title: 'Политика конфиденциальности',
              onTap: () => _launchUrl('https://aistainfix.ru/privacy'),
            ),
            _SettingsTile(
              icon: Icons.description_outlined,
              title: 'Пользовательское соглашение',
              onTap: () => _launchUrl('https://aistainfix.ru/terms'),
            ),
            _SettingsTile(
              icon: Icons.info_outline,
              title: 'Версия',
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

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text('Выбор языка'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Русский'),
              leading: const Text('🇷🇺', style: TextStyle(fontSize: 24)),
              trailing:
                  const Icon(Icons.check, color: AppColors.primary),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text('English'),
              leading: const Text('🇬🇧', style: TextStyle(fontSize: 24)),
              onTap: () => Navigator.pop(context),
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

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
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
