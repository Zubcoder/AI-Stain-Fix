import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context)!;
    final isRu = localeProv.locale.languageCode == 'ru';

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(l10n.settingsTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(l10n.general, [
            _SettingsTile(
              icon: Icons.language,
              title: l10n.language,
              subtitle: isRu ? 'Русский' : 'English',
              onTap: () => _showLanguageDialog(context, localeProv, l10n),
            ),
          ]),
          const SizedBox(height: 16),
          _buildSection(l10n.about, [
            _SettingsTile(
              icon: Icons.help_outline,
              title: l10n.howToUse,
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
              title: l10n.support,
              subtitle: AppConstants.supportEmail,
              onTap: () => _launchSupport(l10n),
            ),
            _SettingsTile(
              icon: Icons.star_outline,
              title: l10n.rateInRustore,
              onTap: () {},
            ),
            _SettingsTile(
              icon: Icons.privacy_tip_outlined,
              title: l10n.privacyPolicy,
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
              title: l10n.termsOfService,
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
              title: l10n.version,
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

  void _showLanguageDialog(BuildContext context, LocaleProvider localeProv, AppLocalizations l10n) {
    final isRu = localeProv.locale.languageCode == 'ru';

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Text(l10n.selectLanguage),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Русский'),
              leading: const Text('\u{1F1F7}\u{1F1FA}', style: TextStyle(fontSize: 24)),
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
              leading: const Text('\u{1F1EC}\u{1F1E7}', style: TextStyle(fontSize: 24)),
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

  Future<void> _launchSupport(AppLocalizations l10n) async {
    final uri = Uri(
      scheme: 'mailto',
      path: AppConstants.supportEmail,
      queryParameters: {
        'subject': '${AppConstants.appName} v${AppConstants.appVersion} — ${l10n.feedback}',
        'body': l10n.describeProblem,
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
