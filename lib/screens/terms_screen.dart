import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../utils/constants.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(l10n.termsOfService),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.termsTitle,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.termsLastUpdated,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 24),
            _SectionTitle(l10n.termsSection1Title),
            const SizedBox(height: 8),
            _BodyText(l10n.termsSection1Body),
            const SizedBox(height: 16),
            _SectionTitle(l10n.termsSection2Title),
            const SizedBox(height: 8),
            _BodyText(l10n.termsSection2Body),
            const SizedBox(height: 16),
            _SectionTitle(l10n.termsSection3Title),
            const SizedBox(height: 8),
            _BodyText(l10n.termsSection3Body),
            const SizedBox(height: 16),
            _SectionTitle(l10n.termsSection4Title),
            const SizedBox(height: 8),
            _BodyText(l10n.termsSection4Body),
            const SizedBox(height: 16),
            _SectionTitle(l10n.termsSection5Title),
            const SizedBox(height: 8),
            _BodyText(l10n.termsSection5Body),
            const SizedBox(height: 16),
            _SectionTitle(l10n.termsSection6Title),
            const SizedBox(height: 8),
            _BodyText(l10n.termsSection6Body),
            const SizedBox(height: 16),
            _SectionTitle(l10n.termsSection7Title),
            const SizedBox(height: 8),
            _BodyText(l10n.termsSection7Body),
            const SizedBox(height: 16),
            _SectionTitle(l10n.termsSection8Title),
            const SizedBox(height: 8),
            _BodyText(l10n.termsSection8Body),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.textPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _BodyText extends StatelessWidget {
  final String text;
  const _BodyText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.textSecondary,
        fontSize: 14,
        height: 1.6,
      ),
    );
  }
}
