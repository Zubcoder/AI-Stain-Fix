import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../models/fabric_result.dart';
import '../utils/constants.dart';

class FabricResultScreen extends StatelessWidget {
  final FabricResult result;

  const FabricResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.fabricInspectorTitle)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(l10n, theme),
            const SizedBox(height: 16),
            _buildInfoCards(l10n, theme),
            const SizedBox(height: 16),
            _buildCareSection(l10n, theme),
            if (result.labelSymbols != null && result.labelSymbols!.isNotEmpty) ...[
              const SizedBox(height: 16),
              _buildLabelSymbols(l10n, theme),
            ],
            if (result.stainRemovalTip.isNotEmpty) ...[
              const SizedBox(height: 16),
              _buildTipSection(l10n, theme),
            ],
            if (result.disclaimer.isNotEmpty) ...[
              const SizedBox(height: 16),
              _buildDisclaimer(theme),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(AppLocalizations l10n, ThemeData theme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF6D4C41).withValues(alpha: 0.3),
            AppColors.accent.withValues(alpha: 0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.texture, color: Color(0xFF6D4C41), size: 24),
              const SizedBox(width: 8),
              Text(l10n.fabricInspectorTitle,
                  style: const TextStyle(color: Color(0xFF6D4C41), fontSize: 14, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 12),
          Text(result.fabricType,
              style: TextStyle(color: theme.textTheme.bodyLarge?.color, fontSize: 22, fontWeight: FontWeight.bold)),
          if (result.fabricSubtype.isNotEmpty)
            Text(result.fabricSubtype,
                style: TextStyle(color: theme.textTheme.bodyMedium?.color, fontSize: 16)),
          const SizedBox(height: 8),
          if (result.compositionEstimate.isNotEmpty)
            Text(result.compositionEstimate,
                style: TextStyle(color: theme.textTheme.bodyMedium?.color, fontSize: 14, fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }

  Widget _buildInfoCards(AppLocalizations l10n, ThemeData theme) {
    return Row(
      children: [
        Expanded(
          child: _infoCard(theme, l10n.fabricDensity, result.density, Icons.layers, const Color(0xFF6D4C41)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _infoCard(
              theme, l10n.fabricConfidence, '${(result.confidence * 100).round()}%', Icons.verified, AppColors.accent),
        ),
      ],
    );
  }

  Widget _infoCard(ThemeData theme, String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.cardTheme.color ?? theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(label, style: TextStyle(color: theme.textTheme.bodyMedium?.color, fontSize: 11)),
          const SizedBox(height: 4),
          Text(value,
              style: TextStyle(color: theme.textTheme.bodyLarge?.color, fontSize: 14, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildCareSection(AppLocalizations l10n, ThemeData theme) {
    final care = result.careInstructions;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardTheme.color ?? theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.local_laundry_service, color: AppColors.primary, size: 20),
              const SizedBox(width: 8),
              Text(l10n.fabricCareTitle,
                  style: TextStyle(color: theme.textTheme.bodyLarge?.color, fontSize: 16, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 12),
          _careRow(theme, Icons.water_drop, l10n.fabricWashing, '${care.washing.temperature} • ${care.washing.mode}'),
          _careRow(theme, Icons.soap, l10n.fabricDetergent, care.washing.detergent),
          _careRow(
              theme, Icons.dry, l10n.fabricDrying, care.drying.machine ? l10n.fabricMachineYes : care.drying.method),
          _careRow(theme, Icons.iron, l10n.fabricIroning, '${care.ironing.temperature} • ${care.ironing.method}'),
          if (care.forbidden.isNotEmpty) ...[
            const Divider(height: 20),
            Row(
              children: [
                const Icon(Icons.block, color: AppColors.error, size: 18),
                const SizedBox(width: 8),
                Text(l10n.fabricForbidden,
                    style: const TextStyle(color: AppColors.error, fontWeight: FontWeight.w600, fontSize: 14)),
              ],
            ),
            const SizedBox(height: 8),
            ...care.forbidden.map((f) => Padding(
                  padding: const EdgeInsets.only(bottom: 4, left: 26),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.close, color: AppColors.error, size: 14),
                      const SizedBox(width: 6),
                      Expanded(child: Text(f, style: TextStyle(color: theme.textTheme.bodyLarge?.color, fontSize: 13))),
                    ],
                  ),
                )),
          ],
        ],
      ),
    );
  }

  Widget _careRow(ThemeData theme, IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 18),
          const SizedBox(width: 8),
          SizedBox(
            width: 80,
            child: Text(label, style: TextStyle(color: theme.textTheme.bodyMedium?.color, fontSize: 12)),
          ),
          Expanded(
            child: Text(value,
                style: TextStyle(color: theme.textTheme.bodyLarge?.color, fontSize: 13, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }

  Widget _buildLabelSymbols(AppLocalizations l10n, ThemeData theme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardTheme.color ?? theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.label, color: AppColors.accent, size: 20),
              const SizedBox(width: 8),
              Text(l10n.fabricLabelSymbols,
                  style: TextStyle(color: theme.textTheme.bodyLarge?.color, fontSize: 16, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 12),
          ...result.labelSymbols!.map((s) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.accent.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(s.symbol, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                        child:
                            Text(s.meaning, style: TextStyle(color: theme.textTheme.bodyLarge?.color, fontSize: 13))),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildTipSection(AppLocalizations l10n, ThemeData theme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.lightbulb_outline, color: AppColors.primary, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.fabricStainTip,
                    style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 14)),
                const SizedBox(height: 4),
                Text(result.stainRemovalTip,
                    style: TextStyle(color: theme.textTheme.bodyLarge?.color, fontSize: 13, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDisclaimer(ThemeData theme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline, color: Colors.orange, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(result.disclaimer,
                style: TextStyle(color: theme.textTheme.bodyMedium?.color, fontSize: 12, fontStyle: FontStyle.italic)),
          ),
        ],
      ),
    );
  }
}
