import 'package:flutter/material.dart';

import '../utils/constants.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Пользовательское соглашение'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Пользовательское соглашение',
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
            _SectionTitle('1. Предмет соглашения'),
            SizedBox(height: 8),
            _BodyText(
              'Настоящее Пользовательское соглашение (далее — «Соглашение») '
              'регулирует отношения между разработчиком приложения AI Stain Fix '
              '(далее — «Разработчик») и пользователем (далее — «Пользователь»), '
              'возникающие при использовании мобильного приложения AI Stain Fix '
              '(далее — «Приложение»).',
            ),
            SizedBox(height: 16),
            _SectionTitle('2. Описание услуги'),
            SizedBox(height: 8),
            _BodyText(
              'Приложение предоставляет услугу анализа фотографий пятен '
              'с помощью искусственного интеллекта и генерации рекомендаций '
              'по их удалению. Рекомендации носят информационный характер.',
            ),
            SizedBox(height: 16),
            _SectionTitle('3. Условия использования'),
            SizedBox(height: 8),
            _BodyText(
              '• Пользователь обязуется использовать Приложение только '
              'в законных целях.\n\n'
              '• Бесплатный план включает 3 анализа в день.\n\n'
              '• Дополнительные анализы доступны через покупку пакетов '
              'или оформление PRO-подписки.\n\n'
              '• Пользователь несёт ответственность за качество '
              'предоставленных фотографий.',
            ),
            SizedBox(height: 16),
            _SectionTitle('4. Ограничение ответственности'),
            SizedBox(height: 8),
            _BodyText(
              'Рекомендации, предоставленные Приложением, носят '
              'информационный характер. Разработчик не несёт '
              'ответственности за:\n\n'
              '• Повреждение ткани или вещей при следовании рекомендациям\n'
              '• Аллергические реакции на рекомендованные средства\n'
              '• Неточность определения типа пятна или ткани\n'
              '• Перебои в работе сервиса по техническим причинам\n\n'
              'Перед применением любого средства рекомендуется '
              'протестировать его на незаметном участке ткани.',
            ),
            SizedBox(height: 16),
            _SectionTitle('5. Платные услуги'),
            SizedBox(height: 8),
            _BodyText(
              'Оплата производится через платёжную систему RuStore. '
              'Условия возврата средств определяются правилами RuStore.\n\n'
              'PRO-подписка продлевается автоматически, если не отменена '
              'за 24 часа до окончания текущего периода.',
            ),
            SizedBox(height: 16),
            _SectionTitle('6. Интеллектуальная собственность'),
            SizedBox(height: 8),
            _BodyText(
              'Все права на Приложение, его дизайн, код и контент '
              'принадлежат Разработчику. Пользователю предоставляется '
              'неисключительная лицензия на использование Приложения '
              'в личных некоммерческих целях.',
            ),
            SizedBox(height: 16),
            _SectionTitle('7. Изменение условий'),
            SizedBox(height: 8),
            _BodyText(
              'Разработчик оставляет за собой право изменять условия '
              'настоящего Соглашения. Актуальная версия всегда доступна '
              'в разделе «Настройки» Приложения.',
            ),
            SizedBox(height: 16),
            _SectionTitle('8. Контакты'),
            SizedBox(height: 8),
            _BodyText(
              'По вопросам, связанным с настоящим Соглашением:\nai.stain.fix.app@gmail.com',
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
