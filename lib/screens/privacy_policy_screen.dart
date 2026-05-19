import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.privacyPolicy),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _section(theme, l10n.privacySection1Title, l10n.privacySection1Body),
            _section(theme, l10n.privacySection2Title, l10n.privacySection2Body),
            _section(theme, l10n.privacySection3Title, l10n.privacySection3Body),
            _section(theme, l10n.privacySection4Title, l10n.privacySection4Body),
            _section(theme, l10n.privacySection5Title, l10n.privacySection5Body),
            _section(theme, l10n.privacySection6Title, l10n.privacySection6Body),
            _section(theme, l10n.privacySection7Title, l10n.privacySection7Body),
            _section(theme, l10n.privacySection8Title, l10n.privacySection8Body),
            _section(theme, l10n.privacySection9Title, l10n.privacySection9Body),
            _section(theme, l10n.privacySection10Title, l10n.privacySection10Body),
          ],
        ),
      ),
    );
  }

  Widget _section(ThemeData theme, String title, String body) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: theme.textTheme.bodyLarge?.color,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            body,
            style: TextStyle(
              color: theme.textTheme.bodyMedium?.color,
              fontSize: 14,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
