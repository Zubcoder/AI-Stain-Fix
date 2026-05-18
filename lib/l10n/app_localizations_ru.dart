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
  String get packagesTitle => 'Дополнительные анализы';

  @override
  String get freePlan => 'Бесплатный план';

  @override
  String get freePlanDesc => '3 бесплатных анализа каждый день';

  @override
  String get unlimited => 'Безлимитные анализы каждый день';

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
  String get onboardingTitle2 => 'AI определяет тип';

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

  @override
  String get errorAnalysis => 'Ошибка анализа';

  @override
  String get retry => 'Повторить';

  @override
  String get recordDeleted => 'Запись удалена';

  @override
  String fabricLabel(String fabric) {
    return 'Ткань: $fabric';
  }

  @override
  String get historyProLock => 'История доступна в PRO';

  @override
  String get historyProLockDesc =>
      'Оформите PRO-подписку, чтобы сохранять\nи просматривать историю анализов';

  @override
  String get goToPro => 'Перейти к PRO';

  @override
  String get proFeature1 => 'Безлимитные анализы пятен';

  @override
  String get proFeature2 => 'Доступ к истории анализов';

  @override
  String get proFeature3 => 'Приоритетная обработка';

  @override
  String get proFeature4 => 'Поддержка новых типов тканей';

  @override
  String get proMonthly => '149 ₽/мес';

  @override
  String get proYearly => '1 190 ₽/год';

  @override
  String purchaseTitle(String product) {
    return 'Покупка: $product';
  }

  @override
  String get purchaseDesc =>
      'Интеграция с RuStore Pay будет доступна после публикации.\n\nВ демо-режиме покупки не списывают средства.';

  @override
  String get demoPurchase => 'Демо-покупка';

  @override
  String get demoAdded => 'Демо: +10 анализов добавлено';

  @override
  String get general => 'Основные';

  @override
  String get about => 'О приложении';

  @override
  String get selectLanguage => 'Выбор языка';

  @override
  String get describeProblem => 'Опишите проблему:\n';

  @override
  String get feedback => 'Обратная связь';

  @override
  String get privacyPolicyTitle => 'Политика конфиденциальности';

  @override
  String get privacyPolicyLastUpdated => 'Последнее обновление: 13 мая 2026';

  @override
  String get privacySection1Title => '1. Общие положения';

  @override
  String get privacySection1Body =>
      'Приложение «AI Stain Fix» (далее — «Приложение») разработано для помощи пользователям в удалении пятен с различных типов тканей. Настоящая Политика конфиденциальности описывает, какие данные мы собираем, как мы их используем и защищаем.';

  @override
  String get privacySection2Title => '2. Какие данные мы собираем';

  @override
  String get privacySection2Body =>
      '• Фотографии пятен — используются исключительно для анализа типа загрязнения и генерации инструкций по удалению.\n\n• Техническая информация об устройстве — версия ОС, модель устройства, язык интерфейса (для улучшения качества работы).\n\n• Данные о покупках — информация о приобретённых пакетах и подписках (обрабатывается платёжной системой RuStore).';

  @override
  String get privacySection3Title => '3. Обработка фотографий';

  @override
  String get privacySection3Body =>
      'Фотографии передаются на защищённый сервер для анализа изображений и генерации инструкций.\n\nФотографии не сохраняются на сервере после обработки и не передаются третьим лицам. Изображения используются исключительно для генерации рекомендаций по удалению пятен.';

  @override
  String get privacySection4Title => '4. Хранение данных';

  @override
  String get privacySection4Body =>
      'История анализов хранится локально на вашем устройстве. Мы не имеем доступа к вашей локальной истории.\n\nСервер-прокси не ведёт журнал запросов и не сохраняет отправленные изображения.';

  @override
  String get privacySection5Title => '5. Безопасность';

  @override
  String get privacySection5Body =>
      'Все данные передаются по защищённому протоколу HTTPS. Мы принимаем разумные меры для защиты вашей информации от несанкционированного доступа.';

  @override
  String get privacySection6Title => '6. Права пользователя';

  @override
  String get privacySection6Body =>
      'Вы можете в любое время:\n• Удалить историю анализов на устройстве\n• Удалить приложение и все связанные данные\n• Обратиться к нам с вопросами о ваших данных';

  @override
  String get privacySection7Title => '7. Контакты';

  @override
  String get privacySection7Body =>
      'По вопросам конфиденциальности обращайтесь:\nai.stain.fix.app@gmail.com';

  @override
  String get termsTitle => 'Пользовательское соглашение';

  @override
  String get termsLastUpdated => 'Последнее обновление: 13 мая 2026';

  @override
  String get termsSection1Title => '1. Предмет соглашения';

  @override
  String get termsSection1Body =>
      'Настоящее Пользовательское соглашение (далее — «Соглашение») регулирует отношения между разработчиком приложения «AI Stain Fix» (далее — «Разработчик») и пользователем (далее — «Пользователь»), возникающие при использовании мобильного приложения «AI Stain Fix» (далее — «Приложение»).';

  @override
  String get termsSection2Title => '2. Описание услуги';

  @override
  String get termsSection2Body =>
      'Приложение предоставляет услугу анализа фотографий пятен с использованием технологий распознавания изображений и генерации рекомендаций по их удалению. Рекомендации носят информационный характер.';

  @override
  String get termsSection3Title => '3. Условия использования';

  @override
  String get termsSection3Body =>
      '• Пользователь обязуется использовать Приложение только в законных целях.\n\n• Бесплатный план включает 3 анализа в день.\n\n• Дополнительные анализы доступны через покупку пакетов или оформление PRO-подписки.\n\n• Пользователь несёт ответственность за качество предоставленных фотографий.';

  @override
  String get termsSection4Title => '4. Ограничение ответственности';

  @override
  String get termsSection4Body =>
      'Рекомендации, предоставленные Приложением, носят информационный характер. Разработчик не несёт ответственности за:\n\n• Повреждение ткани или вещей при следовании рекомендациям\n• Аллергические реакции на рекомендованные средства\n• Неточность определения типа пятна или ткани\n• Перебои в работе сервиса по техническим причинам\n\nПеред применением любого средства рекомендуется протестировать его на незаметном участке ткани.';

  @override
  String get termsSection5Title => '5. Платные услуги';

  @override
  String get termsSection5Body =>
      'Оплата производится через платёжную систему RuStore. Условия возврата средств определяются правилами RuStore.\n\nPRO-подписка продлевается автоматически, если не отменена за 24 часа до окончания текущего периода.';

  @override
  String get termsSection6Title => '6. Интеллектуальная собственность';

  @override
  String get termsSection6Body =>
      'Все права на Приложение, его дизайн, код и контент принадлежат Разработчику. Пользователю предоставляется неисключительная лицензия на использование Приложения в личных некоммерческих целях.';

  @override
  String get termsSection7Title => '7. Изменение условий';

  @override
  String get termsSection7Body =>
      'Разработчик оставляет за собой право изменять условия настоящего Соглашения. Актуальная версия всегда доступна в разделе «Настройки» Приложения.';

  @override
  String get termsSection8Title => '8. Контакты';

  @override
  String get termsSection8Body =>
      'По вопросам, связанным с настоящим Соглашением:\nai.stain.fix.app@gmail.com';
}
