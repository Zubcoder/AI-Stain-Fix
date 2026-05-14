import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/scan_package.dart';
import '../providers/subscription_provider.dart';
import '../utils/constants.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Подписка и пакеты'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProCard(context),
            const SizedBox(height: 24),
            const Text(
              'Дополнительные анализы',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            ...ScanPackages.packages.map((p) => _buildPackageCard(context, p)),
            const SizedBox(height: 24),
            _buildFreeInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildProCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.primary.withValues(alpha: 0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.workspace_premium, color: Colors.white, size: 28),
              SizedBox(width: 8),
              Text(
                'PRO',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Безлимитные анализы каждый день',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProFeatureRow(text: 'Безлимитные анализы пятен'),
              SizedBox(height: 4),
              _ProFeatureRow(text: 'Доступ к истории анализов'),
              SizedBox(height: 4),
              _ProFeatureRow(text: 'Приоритетная обработка'),
              SizedBox(height: 4),
              _ProFeatureRow(text: 'Поддержка новых типов тканей'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _showPurchaseDialog(context, 'PRO месяц'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white70),
                  ),
                  child: const Text('149 ₽/мес'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _showPurchaseDialog(context, 'PRO год'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.primary,
                  ),
                  child: const Column(
                    children: [
                      Text('1 190 ₽/год',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Экономия 37%',
                          style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPackageCard(BuildContext context, ScanPackage package) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              package.icon,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
        title: Text(
          package.name,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          package.description,
          style: const TextStyle(color: AppColors.textSecondary),
        ),
        trailing: ElevatedButton(
          onPressed: () => _showPurchaseDialog(context, package.name),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          child: Text(package.price),
        ),
      ),
    );
  }

  Widget _buildFreeInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        children: [
          Icon(Icons.info_outline, color: AppColors.textSecondary, size: 24),
          SizedBox(height: 8),
          Text(
            'Бесплатный план',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4),
          Text(
            '3 бесплатных анализа каждый день',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

}

class _ProFeatureRow extends StatelessWidget {
  final String text;
  const _ProFeatureRow({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.check_circle_outline, color: Colors.white70, size: 16),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ),
      ],
    );
  }
}

void _showPurchaseDialog(BuildContext context, String product) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      backgroundColor: AppColors.surface,
      title: Text('Покупка: $product'),
      content: const Text(
        'Интеграция с RuStore Pay будет доступна после публикации.\n\n'
        'В демо-режиме покупки не списывают средства.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Отмена'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            final subs = context.read<SubscriptionProvider>();
            subs.addBonusScans(10);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Демо: +10 анализов добавлено'),
                backgroundColor: AppColors.success,
              ),
            );
          },
          child: const Text('Демо-покупка'),
        ),
      ],
    ),
  );
}
