import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/app_localizations.dart';
import '../providers/locale_provider.dart';
import '../providers/theme_provider.dart';
import '../utils/constants.dart' show AppConstants;
import 'onboarding_screen.dart';
import 'privacy_policy_screen.dart';
import 'terms_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProv = context.watch<LocaleProvider>();
    final themeProvider = context.watch<ThemeProvider>();
    final l10n = AppLocalizations.of(context)!;
    final isRu = localeProv.locale.languageCode == 'ru';
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(theme, l10n.general, [
            _SettingsTile(
              icon: Icons.language,
              title: l10n.language,
              subtitle: isRu ? 'Русский' : 'English',
              onTap: () => _showLanguageDialog(context, localeProv, l10n),
            ),
            _SettingsTile(
              icon: themeProvider.isDark
                  ? Icons.dark_mode_rounded
                  : Icons.light_mode_rounded,
              title: themeProvider.isDark
                  ? l10n.darkTheme
                  : l10n.lightTheme,
              trailing: Switch(
                value: themeProvider.isDark,
                activeThumbColor: theme.colorScheme.primary,
                onChanged: (_) => themeProvider.toggleTheme(),
              ),
              onTap: () => themeProvider.toggleTheme(),
            ),
          ]),
          const SizedBox(height: 16),
          _buildSection(theme, l10n.about, [
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
              onTap: () => _launchRuStore(),
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

  Widget _buildSection(ThemeData theme, String title, List<_SettingsTile> tiles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            title,
            style: TextStyle(
              color: theme.textTheme.bodyMedium?.color,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: theme.cardTheme.color ?? theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: tiles.asMap().entries.map((entry) {
              final i = entry.key;
              final tile = entry.value;
              return Column(
                children: [
                  ListTile(
                    leading: Icon(tile.icon, color: theme.colorScheme.primary, size: 22),
                    title: Text(
                      tile.title,
                      style: TextStyle(
                        color: theme.textTheme.bodyLarge?.color,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: tile.subtitle != null
                        ? Text(
                            tile.subtitle!,
                            style: TextStyle(
                              color: theme.textTheme.bodyMedium?.color,
                              fontSize: 13,
                            ),
                          )
                        : null,
                    trailing: tile.trailing ??
                        (tile.onTap != null
                            ? Icon(Icons.chevron_right,
                                color: theme.textTheme.bodyMedium?.color,
                                size: 20)
                            : null),
                    onTap: tile.onTap,
                  ),
                  if (i < tiles.length - 1)
                    Divider(
                      height: 1,
                      indent: 56,
                      color: theme.dividerColor,
                    ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  void _showLanguageDialog(
      BuildContext context, LocaleProvider localeProv, AppLocalizations l10n) {
    final isRu = localeProv.locale.languageCode == 'ru';
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: theme.colorScheme.surface,
        title: Text(l10n.selectLanguage),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Русский'),
              leading:
                  const Text('\u{1F1F7}\u{1F1FA}', style: TextStyle(fontSize: 24)),
              trailing: isRu
                  ? Icon(Icons.check, color: theme.colorScheme.primary)
                  : null,
              onTap: () {
                localeProv.setLocale(const Locale('ru'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('English'),
              leading:
                  const Text('\u{1F1EC}\u{1F1E7}', style: TextStyle(fontSize: 24)),
              trailing: !isRu
                  ? Icon(Icons.check, color: theme.colorScheme.primary)
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

  Future<void> _launchRuStore() async {
    final uri = Uri.parse(
        'https://apps.rustore.ru/app/com.zubcoder.ai_stain_fix');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _launchSupport(AppLocalizations l10n) async {
    final uri = Uri(
      scheme: 'mailto',
      path: AppConstants.supportEmail,
      queryParameters: {
        'subject':
            '${l10n.appName} v${AppConstants.appVersion} — ${l10n.feedback}',
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
  final Widget? trailing;

  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
    this.trailing,
  });
}
