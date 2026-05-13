import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../providers/stain_provider.dart';
import '../providers/subscription_provider.dart';
import '../utils/constants.dart';
import '../widgets/app_logo.dart';
import 'result_screen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final _imagePicker = ImagePicker();
  int _remainingScans = 0;
  Uint8List? _lastImageBytes;

  @override
  void initState() {
    super.initState();
    _loadRemaining();
  }

  Future<void> _loadRemaining() async {
    final subs = context.read<SubscriptionProvider>();
    final remaining = await subs.getAvailableScans();
    if (mounted) setState(() => _remainingScans = remaining);
  }

  Future<void> _pickAndAnalyze(ImageSource source) async {
    if (_remainingScans <= 0) {
      _showNoScansDialog();
      return;
    }

    final picked = await _imagePicker.pickImage(
      source: source,
      maxWidth: 1280,
      imageQuality: 85,
    );
    if (picked == null) return;

    final bytes = await picked.readAsBytes();
    _lastImageBytes = bytes;
    await _analyzeImage(bytes);
  }

  Future<void> _analyzeImage(Uint8List bytes) async {
    final provider = context.read<StainProvider>();
    await provider.analyzeStain(bytes);

    if (!mounted) return;

    if (provider.state == AnalysisState.done) {
      await _loadRemaining();
      if (!mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ResultScreen(result: provider.result!),
        ),
      );
    } else if (provider.state == AnalysisState.error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(provider.error ?? 'Ошибка анализа'),
          backgroundColor: AppColors.error,
          duration: const Duration(seconds: 5),
          action: _lastImageBytes != null
              ? SnackBarAction(
                  label: 'Повторить',
                  textColor: Colors.white,
                  onPressed: () {
                    if (_lastImageBytes != null) {
                      _analyzeImage(_lastImageBytes!);
                    }
                  },
                )
              : null,
        ),
      );
    }
  }

  void _showNoScansDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text('Лимит исчерпан'),
        content: const Text(
          'Бесплатные анализы на сегодня закончились.\n'
          'Купите пакет или оформите PRO-подписку.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Понятно'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppLogo(size: 28),
            const SizedBox(width: 8),
            const Text(AppConstants.appName),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.auto_awesome, size: 14, color: AppColors.accent),
                const SizedBox(width: 4),
                Consumer<StainProvider>(
                  builder: (_, provider, child) {
                    return Text(
                      '$_remainingScans',
                      style: const TextStyle(
                        color: AppColors.accent,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: Consumer<StainProvider>(
        builder: (context, provider, _) {
          if (provider.state == AnalysisState.analyzing) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(color: AppColors.primary),
                  SizedBox(height: 24),
                  Text(
                    'Анализируем пятно...',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'AI определяет тип загрязнения и ткани',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            );
          }

          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.3),
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      size: 64,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Сфотографируйте пятно',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'AI определит тип загрязнения и подскажет\nкак его вывести',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => _pickAndAnalyze(ImageSource.camera),
                      icon: const Icon(Icons.camera_alt),
                      label: const Text('Сделать фото'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () => _pickAndAnalyze(ImageSource.gallery),
                      icon: const Icon(Icons.photo_library_outlined),
                      label: const Text('Из галереи'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
