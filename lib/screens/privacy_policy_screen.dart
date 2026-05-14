import 'package:flutter/material.dart';

import '../utils/constants.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Политика конфиденциальности'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Политика конфиденциальности',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Последнее обновление: 13 мая 2026',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
              ),
            ),
            SizedBox(height: 24),
            _SectionTitle('1. Общие положения'),
            SizedBox(height: 8),
            _BodyText(
              'Приложение AI Stain Fix (далее — «Приложение») разработано для '
              'помощи пользователям в удалении пятен с различных типов тканей. '
              'Настоящая Политика конфиденциальности описывает, какие данные '
              'мы собираем, как мы их используем и защищаем.',
            ),
            SizedBox(height: 16),
            _SectionTitle('2. Какие данные мы собираем'),
            SizedBox(height: 8),
            _BodyText(
              '• Фотографии пятен — используются исключительно для анализа '
              'типа загрязнения и генерации инструкций по удалению.\n\n'
              '• Техническая информация об устройстве — версия ОС, модель '
              'устройства, язык интерфейса (для улучшения качества работы).\n\n'
              '• Данные о покупках — информация о приобретённых пакетах '
              'и подписках (обрабатывается платёжной системой RuStore).',
            ),
            SizedBox(height: 16),
            _SectionTitle('3. Обработка фотографий'),
            SizedBox(height: 8),
            _BodyText(
              'Фотографии передаются на сервер-прокси, который перенаправляет '
              'запросы в сервис искусственного интеллекта для анализа '
              'изображений и генерации инструкций.\n\n'
              'Фотографии не сохраняются на сервере после обработки и не '
              'передаются третьим лицам. Изображения используются '
              'исключительно для генерации рекомендаций по удалению пятен.',
            ),
            SizedBox(height: 16),
            _SectionTitle('4. Хранение данных'),
            SizedBox(height: 8),
            _BodyText(
              'История анализов хранится локально на вашем устройстве. '
              'Мы не имеем доступа к вашей локальной истории.\n\n'
              'Сервер-прокси не ведёт журнал запросов и не сохраняет '
              'отправленные изображения.',
            ),
            SizedBox(height: 16),
            _SectionTitle('5. Безопасность'),
            SizedBox(height: 8),
            _BodyText(
              'Все данные передаются по защищённому протоколу HTTPS. '
              'Мы принимаем разумные меры для защиты вашей информации '
              'от несанкционированного доступа.',
            ),
            SizedBox(height: 16),
            _SectionTitle('6. Права пользователя'),
            SizedBox(height: 8),
            _BodyText(
              'Вы можете в любое время:\n'
              '• Удалить историю анализов на устройстве\n'
              '• Удалить приложение и все связанные данные\n'
              '• Обратиться к нам с вопросами о ваших данных',
            ),
            SizedBox(height: 16),
            _SectionTitle('7. Контакты'),
            SizedBox(height: 8),
            _BodyText(
              'По вопросам конфиденциальности обращайтесь:\nai.stain.fix.app@gmail.com',
            ),
            SizedBox(height: 32),
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
