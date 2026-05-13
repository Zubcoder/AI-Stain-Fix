// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'AI Stain Fix';

  @override
  String get appTagline => 'Умное удаление пятен по фото';

  @override
  String get camera => 'Камера';

  @override
  String get history => 'История';

  @override
  String get pro => 'PRO';

  @override
  String get settings => 'Настройки';

  @override
  String get takePhoto => 'Сделать фото';

  @override
  String get fromGallery => 'Из галереи';

  @override
  String get photoStain => 'Сфотографируйте пятно';

  @override
  String get aiWillHelp =>
      'AI определит тип загрязнения и подскажет\nкак его вывести';

  @override
  String get analyzing => 'Анализируем пятно...';

  @override
  String get analyzingDesc => 'AI определяет тип загрязнения и ткани';

  @override
  String get analysisResult => 'Результат анализа';

  @override
  String get aiAnalysis => 'AI Анализ';

  @override
  String get stainType => 'Тип пятна';

  @override
  String get fabricType => 'Ткань';

  @override
  String get difficulty => 'Сложность';

  @override
  String get stepByStep => 'Пошаговая инструкция';

  @override
  String get recommendedProducts => 'Рекомендуемые средства';

  @override
  String get warnings => 'Предупреждения';

  @override
  String get historyTitle => 'История анализов';

  @override
  String get emptyHistory => 'Здесь будет история\nваших анализов';

  @override
  String get emptyHistoryHint => 'Сфотографируйте пятно, чтобы начать';

  @override
  String get subscriptionTitle => 'Подписка и пакеты';

  @override
  String get packagesTitle => 'Пакеты анализов';

  @override
  String get freePlan => 'Бесплатный план';

  @override
  String get freePlanDesc => '3 бесплатных анализа каждый день';

  @override
  String get unlimited => 'Безлимитные анализы + без рекламы';

  @override
  String get savingsPercent => 'Экономия 37%';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get language => 'Язык';

  @override
  String get howToUse => 'Как пользоваться';

  @override
  String get support => 'Поддержка';

  @override
  String get rateInRustore => 'Оценить в RuStore';

  @override
  String get privacyPolicy => 'Политика конфиденциальности';

  @override
  String get termsOfService => 'Пользовательское соглашение';

  @override
  String get version => 'Версия';

  @override
  String get limitExhausted => 'Лимит исчерпан';

  @override
  String get limitExhaustedDesc =>
      'Бесплатные анализы на сегодня закончились.\nКупите пакет или оформите PRO-подписку.';

  @override
  String get ok => 'Понятно';

  @override
  String get cancel => 'Отмена';

  @override
  String get next => 'Далее';

  @override
  String get start => 'Начать';

  @override
  String get skip => 'Пропустить';

  @override
  String get close => 'Закрыть';

  @override
  String get noInternet => 'Нет подключения к интернету. Проверьте соединение.';

  @override
  String get serverError => 'Сервер временно недоступен. Попробуйте позже.';

  @override
  String get tryAgain => 'Не удалось проанализировать. Попробуйте позже.';

  @override
  String get justNow => 'Только что';

  @override
  String minutesAgo(int count) {
    return '$count мин. назад';
  }

  @override
  String hoursAgo(int count) {
    return '$count ч. назад';
  }

  @override
  String daysAgo(int count) {
    return '$count дн. назад';
  }

  @override
  String get onboardingTitle1 => 'Сфотографируйте пятно';

  @override
  String get onboardingDesc1 =>
      'Наведите камеру на загрязнение для мгновенного анализа';

  @override
  String get onboardingTitle2 => 'AI определит тип';

  @override
  String get onboardingDesc2 =>
      'Искусственный интеллект распознает вид пятна и тип ткани';

  @override
  String get onboardingTitle3 => 'Получите инструкцию';

  @override
  String get onboardingDesc3 =>
      'Пошаговый рецепт удаления с доступными средствами';

  @override
  String get onboardingTitle4 => 'Умный помощник';

  @override
  String get onboardingDesc4 =>
      'AI учитывает тип ткани, возраст пятна и доступные средства';
}
