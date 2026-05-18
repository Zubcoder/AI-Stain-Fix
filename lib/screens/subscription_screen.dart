import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../models/scan_package.dart';
import '../providers/subscription_provider.dart';
import '../utils/constants.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.subscriptionTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildProHeader(l10n, theme),
            const SizedBox(height: 24),
            _buildFeatures(l10n, theme),
            const SizedBox(height: 24),
            Text(
              l10n.packagesTitle,
              style: TextStyle(
                color: theme.textTheme.bodyLarge?.color,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            ...ScanPackages.packages
                .map((p) => _buildPackageCard(context, p, theme, l10n)),
            const SizedBox(height: 16),
            _buildFreeInfo(l10n, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildProHeader(AppLocalizations l10n, ThemeData theme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withValues(alpha: 0.3),
            AppColors.accent.withValues(alpha: 0.15),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.3),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.workspace_premium,
              color: AppColors.accent,
              size: 32,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.subscriptionTitle,
            style: TextStyle(
              color: theme.textTheme.bodyLarge?.color,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.unlimited,
            style: TextStyle(
              color: theme.textTheme.bodyMedium?.color,
              fontSize: 14,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatures(AppLocalizations l10n, ThemeData theme) {
    final features = [
      l10n.proFeature1,
      l10n.proFeature2,
      l10n.proFeature3,
      l10n.proFeature4,
    ];

    return Column(
      children: features
          .map((f) => _ProFeatureRow(text: f, theme: theme))
          .toList(),
    );
  }

  Widget _buildPackageCard(
      BuildContext context, ScanPackage package, ThemeData theme, AppLocalizations l10n) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(package.icon, style: const TextStyle(fontSize: 22)),
          ),
        ),
        title: Text(
          package.name,
          style: TextStyle(
            color: theme.textTheme.bodyLarge?.color,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          package.description,
          style: TextStyle(color: theme.textTheme.bodyMedium?.color),
        ),
        trailing: ElevatedButton(
          onPressed: () => _showPurchaseDialog(context, package.name, l10n, theme),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          child: Text(package.price),
        ),
      ),
    );
  }

  Widget _buildFreeInfo(AppLocalizations l10n, ThemeData theme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardTheme.color ?? theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(Icons.info_outline,
              color: theme.textTheme.bodyMedium?.color, size: 24),
          const SizedBox(height: 8),
          Text(
            l10n.freePlan,
            style: TextStyle(
              color: theme.textTheme.bodyLarge?.color,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            l10n.freePlanDesc,
            style: TextStyle(
              color: theme.textTheme.bodyMedium?.color,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  void _showPurchaseDialog(
      BuildContext context, String product, AppLocalizations l10n, ThemeData theme) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: theme.colorScheme.surface,
        title: Text(l10n.purchaseTitle(product)),
        content: Text(l10n.purchaseDesc),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              final subs = context.read<SubscriptionProvider>();
              subs.addBonusScans(10);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(l10n.demoAdded),
                  backgroundColor: AppColors.success,
                ),
              );
            },
            child: Text(l10n.demoPurchase),
          ),
        ],
      ),
    );
  }
}

class _ProFeatureRow extends StatelessWidget {
  final String text;
  final ThemeData theme;
  const _ProFeatureRow({required this.text, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(Icons.check_circle_outline,
              color: theme.textTheme.bodyMedium?.color, size: 16),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                  color: theme.textTheme.bodyMedium?.color, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
