// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Пятновыводитель';

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
      'Определит тип загрязнения и подскажет\nкак его вывести';

  @override
  String get analyzing => 'Анализируем пятно...';

  @override
  String get analyzingDesc => 'Определяем тип загрязнения и ткани';

  @override
  String get analysisResult => 'Результат анализа';

  @override
  String get aiAnalysis => 'Анализ';

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
  String get shareApp => 'Поделиться приложением';

  @override
  String get shareAppText =>
      'Попробуй Пятновыводитель — определяет как вывести пятна по фото! https://apps.rustore.ru/app/com.zubcoder.ai_stain_fix';

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
  String get onboardingTitle2 => 'Умное определение';

  @override
  String get onboardingDesc2 => 'Умное распознавание вида пятна и типа ткани';

  @override
  String get onboardingTitle3 => 'Получите инструкцию';

  @override
  String get onboardingDesc3 =>
      'Пошаговый рецепт удаления с доступными средствами';

  @override
  String get onboardingTitle4 => 'Умный помощник';

  @override
  String get onboardingDesc4 =>
      'Учитывает тип ткани, возраст пятна и доступные средства';

  @override
  String get errorAnalysis => 'Ошибка анализа';

  @override
  String get retry => 'Повторить';

  @override
  String get recordDeleted => 'Запись удалена';

  @override
  String get undo => 'Отменить';

  @override
  String get deleteConfirmTitle => 'Удалить запись?';

  @override
  String get deleteConfirmBody => 'Эта запись будет удалена из истории.';

  @override
  String get delete => 'Удалить';

  @override
  String shareResultText(String stainType, String fabricType, String difficulty) {
    return 'Пятно: $stainType\nТкань: $fabricType\nСложность: $difficulty\n\nОпределено с помощью Пятновыводитель';
  }

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
  String get proMonthly => '79 ₽/мес';

  @override
  String get proYearly => '590 ₽/год';

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
  String get darkTheme => 'Тёмная тема';

  @override
  String get lightTheme => 'Светлая тема';

  @override
  String get privacyPolicyTitle => 'Политика конфиденциальности';

  @override
  String get privacyPolicyLastUpdated => 'Последнее обновление: 19 мая 2026 г.';

  @override
  String get privacySection1Title => '1. Общие положения';

  @override
  String get privacySection1Body =>
      'Настоящая Политика конфиденциальности разработана в соответствии с Федеральным законом от 27.07.2006 №152-ФЗ «О персональных данных».\nОператор персональных данных: ИП Зубков С.В. (далее — Разработчик).\nПриложение: «Пятновыводитель» (далее — Приложение).';

  @override
  String get privacySection2Title => '2. Какие данные мы собираем';

  @override
  String get privacySection2Body =>
      'Приложение может собирать следующие данные:\n\n• Фотографии и изображения — только те, что вы добровольно загружаете для анализа. Фотографии обрабатываются на защищённых облачных серверах и НЕ сохраняются после обработки.\n• Локальные данные — история анализов. Хранятся ТОЛЬКО на вашем устройстве.\n• Настройки приложения (язык, тема оформления) — хранятся локально на устройстве.\n\nПриложение НЕ собирает: ФИО, адрес, телефон, email, геолокацию, данные банковских карт, рекламные идентификаторы.';

  @override
  String get privacySection3Title => '3. Цели обработки данных';

  @override
  String get privacySection3Body =>
      'Обработка данных осуществляется исключительно для:\n\n• Распознавания типа пятна и ткани по фотографии\n• Генерации рекомендаций по удалению пятен\n• Ведения истории анализов на устройстве пользователя\n• Улучшения качества работы приложения';

  @override
  String get privacySection4Title => '4. Хранение и защита данных';

  @override
  String get privacySection4Body =>
      '• Все данные хранятся исключительно на устройстве пользователя в локальной базе данных.\n• Передача фотографий осуществляется по зашифрованному каналу (HTTPS/TLS).\n• Фотографии обрабатываются в оперативной памяти сервера и не записываются на диск.\n• Разработчик не имеет доступа к локальным данным пользователя.';

  @override
  String get privacySection5Title => '5. Передача данных третьим лицам';

  @override
  String get privacySection5Body =>
      'Фотографии передаются на защищённые облачные серверы исключительно для обработки и распознавания.\n\n• Данные не сохраняются на сторонних серверах после обработки.\n• Разработчик не передаёт, не продаёт и не предоставляет данные пользователей третьим лицам.\n• Обезличенная статистика может использоваться для улучшения сервиса.';

  @override
  String get privacySection6Title => '6. Права пользователя (ст. 14 №152-ФЗ)';

  @override
  String get privacySection6Body =>
      'В соответствии с Федеральным законом №152-ФЗ «О персональных данных» вы имеете право:\n\n• Получить информацию об обработке ваших данных\n• Потребовать удаления ваших данных\n• Отозвать согласие на обработку данных\n\nДля удаления всех данных достаточно удалить приложение или очистить данные приложения в настройках устройства.';

  @override
  String get privacySection7Title => '7. Файлы cookie и аналитика';

  @override
  String get privacySection7Body =>
      'Приложение не использует файлы cookie и рекламные трекеры. Приложение не требует регистрации.';

  @override
  String get termsTitle => 'Пользовательское соглашение';

  @override
  String get termsLastUpdated => 'Последнее обновление: 19 мая 2026 г.';

  @override
  String get termsSection1Title => '1. Общие положения';

  @override
  String get termsSection1Body =>
      'Настоящее Пользовательское соглашение (далее — «Соглашение») регулирует использование мобильного приложения «Пятновыводитель» (далее — «Приложение»), разработанного ИП Зубков С.В. (далее — «Разработчик»).\nИспользуя Приложение, вы подтверждаете согласие с условиями настоящего Соглашения. Если вы не согласны — прекратите использование Приложения.';

  @override
  String get termsSection2Title => '2. Описание сервиса';

  @override
  String get termsSection2Body =>
      'Приложение предоставляет следующие функции:\n\n• Анализ фотографий пятен для определения типа загрязнения\n• Генерация рекомендаций по удалению пятен с различных типов тканей\n• Ведение истории анализов';

  @override
  String get termsSection3Title => '3. Профессиональный дисклеймер';

  @override
  String get termsSection3Body =>
      'ВАЖНО: Приложение предоставляет исключительно справочную информацию. Рекомендации носят информационный характер.\n\n• Разработчик не несёт ответственности за повреждение ткани или вещей при следовании рекомендациям\n• Перед применением любого средства рекомендуется протестировать его на незаметном участке ткани\n• Приложение НЕ заменяет профессиональную химчистку';

  @override
  String get termsSection4Title => '4. Ограничение ответственности';

  @override
  String get termsSection4Body =>
      '• Результаты анализа носят рекомендательный характер и НЕ являются экспертным заключением.\n• Разработчик НЕ несёт ответственности за решения, принятые на основании результатов работы Приложения.\n• Разработчик НЕ гарантирует 100% точность распознавания и анализа.\n• Разработчик НЕ несёт ответственности за убытки, возникшие в результате использования или невозможности использования Приложения.\n• Разработчик НЕ несёт ответственности за перебои в работе, вызванные техническими причинами, действиями третьих лиц или обстоятельствами непреодолимой силы.\n• Максимальная ответственность разработчика ограничена суммой, уплаченной пользователем за последние 12 месяцев.';

  @override
  String get termsSection5Title => '5. Подписки, платежи и возврат средств';

  @override
  String get termsSection5Body =>
      '• Часть функций доступна по подписке или через покупку пакетов анализов.\n• Оплата производится через RuStore.\n• Возврат средств осуществляется в соответствии с политикой RuStore и действующим законодательством РФ (ст. 32 Закона «О защите прав потребителей»).\n• Подписка продлевается автоматически, если не отменена за 24 часа до окончания текущего периода.\n• Для отмены подписки перейдите в настройки RuStore → Подписки.';

  @override
  String get termsSection6Title => '6. Интеллектуальная собственность';

  @override
  String get termsSection6Body =>
      '• Все права на Приложение, включая дизайн, код, логотипы, тексты и графику, принадлежат Разработчику.\n• Пользователю предоставляется ограниченная, неисключительная, непередаваемая лицензия на использование Приложения.\n• Запрещается: копирование, декомпиляция, обратная разработка (исследование готового мобильного приложения, а также документации на него с целью понять принцип работы), распространение Приложения или его частей.\n• Пользователь сохраняет права на загруженные им фотографии. Результаты анализа предоставляются для личного использования.';

  @override
  String get termsSection7Title => '7. Права и обязанности пользователя';

  @override
  String get termsSection7Body =>
      '• Пользователь обязуется использовать Приложение в соответствии с законодательством Российской Федерации.\n• Запрещается использование Приложения для незаконных целей.\n• Пользователь несёт ответственность за содержимое загружаемых изображений.\n• Пользователь может прекратить использование Приложения в любой момент, удалив его с устройства.';

  @override
  String get termsSection8Title => '8. Возрастные ограничения';

  @override
  String get termsSection8Body =>
      'Приложение предназначено для лиц старше 12+ лет.';

  @override
  String get privacyLastUpdated => 'Последнее обновление: 19 мая 2026 г.';

  @override
  String get privacySection8Title => '8. Возрастные ограничения';

  @override
  String get privacySection8Body =>
      'Приложение предназначено для лиц старше 12+ лет.';

  @override
  String get privacySection9Title => '9. Изменения политики';

  @override
  String get privacySection9Body =>
      'Разработчик оставляет за собой право обновлять настоящую Политику. Актуальная версия всегда доступна в приложении и по адресу: https://zubcoder.github.io/AI-Stain-Fix/privacy-policy.html';

  @override
  String get privacySection10Title => '10. Контакты';

  @override
  String get privacySection10Body =>
      'По вопросам обработки персональных данных: ai.stain.fix.app@gmail.com';

  @override
  String get termsSection9Title => '9. Применимое право и разрешение споров';

  @override
  String get termsSection9Body =>
      '• Настоящее Соглашение регулируется законодательством Российской Федерации.\n• Споры разрешаются путём переговоров, а при недостижении согласия — в суде по месту нахождения Разработчика.\n• Разработчик вправе в одностороннем порядке изменять условия настоящего Соглашения, уведомив пользователей через обновление Приложения.';

  @override
  String get termsSection10Title => '10. Контакты';

  @override
  String get termsSection10Body =>
      'По вопросам, связанным с настоящим Соглашением: ai.stain.fix.app@gmail.com';
}
