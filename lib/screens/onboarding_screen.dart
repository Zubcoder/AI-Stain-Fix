import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  final bool isFromSettings;

  const OnboardingScreen({super.key, this.isFromSettings = false});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  final _slides = const [
    _OnboardingSlide(
      icon: Icons.camera_alt_outlined,
      title: 'Сфотографируйте пятно',
      description: 'Наведите камеру на загрязнение для мгновенного анализа',
    ),
    _OnboardingSlide(
      icon: Icons.auto_awesome,
      title: 'AI определит тип',
      description:
          'Искусственный интеллект распознает вид пятна и тип ткани',
    ),
    _OnboardingSlide(
      icon: Icons.checklist_outlined,
      title: 'Получите инструкцию',
      description:
          'Пошаговый рецепт удаления с доступными средствами',
    ),
    _OnboardingSlide(
      icon: Icons.psychology_outlined,
      title: 'Умный помощник',
      description:
          'AI учитывает тип ткани, возраст пятна и доступные средства',
    ),
  ];

  Future<void> _completeOnboarding() async {
    if (!widget.isFromSettings) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(AppConstants.onboardingDonePrefKey, true);
    }

    if (!mounted) return;

    if (widget.isFromSettings) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: _currentPage < _slides.length - 1
                  ? TextButton(
                      onPressed: _completeOnboarding,
                      child: Text(
                        widget.isFromSettings ? 'Закрыть' : 'Пропустить',
                        style: const TextStyle(color: AppColors.textSecondary),
                      ),
                    )
                  : const SizedBox(height: 48),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (i) => setState(() => _currentPage = i),
                itemCount: _slides.length,
                itemBuilder: (_, i) => _buildSlide(_slides[i]),
              ),
            ),
            _buildDots(),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _currentPage == _slides.length - 1
                      ? _completeOnboarding
                      : () => _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          ),
                  child: Text(
                    _currentPage == _slides.length - 1 ? 'Начать' : 'Далее',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSlide(_OnboardingSlide slide) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              slide.icon,
              size: 56,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            slide.title,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            slide.description,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 16,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _slides.length,
        (i) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: _currentPage == i ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: _currentPage == i
                ? AppColors.primary
                : AppColors.textSecondary.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}

class _OnboardingSlide {
  final IconData icon;
  final String title;
  final String description;

  const _OnboardingSlide({
    required this.icon,
    required this.title,
    required this.description,
  });
}
