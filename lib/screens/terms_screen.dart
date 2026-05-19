import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.termsOfService),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _section(theme, l10n.termsSection1Title, l10n.termsSection1Body),
            _section(theme, l10n.termsSection2Title, l10n.termsSection2Body),
            _section(theme, l10n.termsSection3Title, l10n.termsSection3Body),
            _section(theme, l10n.termsSection4Title, l10n.termsSection4Body),
            _section(theme, l10n.termsSection5Title, l10n.termsSection5Body),
            _section(theme, l10n.termsSection6Title, l10n.termsSection6Body),
            _section(theme, l10n.termsSection7Title, l10n.termsSection7Body),
            _section(theme, l10n.termsSection8Title, l10n.termsSection8Body),
            _section(theme, l10n.termsSection9Title, l10n.termsSection9Body),
            _section(theme, l10n.termsSection10Title, l10n.termsSection10Body),
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
