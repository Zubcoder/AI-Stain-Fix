import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// No description provided for @appName.
  ///
  /// In ru, this message translates to:
  /// **'Пятновыводитель'**
  String get appName;

  /// No description provided for @appTagline.
  ///
  /// In ru, this message translates to:
  /// **'Умное удаление пятен по фото'**
  String get appTagline;

  /// No description provided for @camera.
  ///
  /// In ru, this message translates to:
  /// **'Камера'**
  String get camera;

  /// No description provided for @history.
  ///
  /// In ru, this message translates to:
  /// **'История'**
  String get history;

  /// No description provided for @pro.
  ///
  /// In ru, this message translates to:
  /// **'PRO'**
  String get pro;

  /// No description provided for @settings.
  ///
  /// In ru, this message translates to:
  /// **'Настройки'**
  String get settings;

  /// No description provided for @takePhoto.
  ///
  /// In ru, this message translates to:
  /// **'Сделать фото'**
  String get takePhoto;

  /// No description provided for @fromGallery.
  ///
  /// In ru, this message translates to:
  /// **'Из галереи'**
  String get fromGallery;

  /// No description provided for @photoStain.
  ///
  /// In ru, this message translates to:
  /// **'Сфотографируйте пятно'**
  String get photoStain;

  /// No description provided for @aiWillHelp.
  ///
  /// In ru, this message translates to:
  /// **'Определит тип загрязнения и подскажет\nкак его вывести'**
  String get aiWillHelp;

  /// No description provided for @analyzing.
  ///
  /// In ru, this message translates to:
  /// **'Анализируем пятно...'**
  String get analyzing;

  /// No description provided for @analyzingDesc.
  ///
  /// In ru, this message translates to:
  /// **'Определяем тип загрязнения и ткани'**
  String get analyzingDesc;

  /// No description provided for @analysisResult.
  ///
  /// In ru, this message translates to:
  /// **'Результат анализа'**
  String get analysisResult;

  /// No description provided for @aiAnalysis.
  ///
  /// In ru, this message translates to:
  /// **'Анализ'**
  String get aiAnalysis;

  /// No description provided for @stainType.
  ///
  /// In ru, this message translates to:
  /// **'Тип пятна'**
  String get stainType;

  /// No description provided for @fabricType.
  ///
  /// In ru, this message translates to:
  /// **'Ткань'**
  String get fabricType;

  /// No description provided for @difficulty.
  ///
  /// In ru, this message translates to:
  /// **'Сложность'**
  String get difficulty;

  /// No description provided for @stepByStep.
  ///
  /// In ru, this message translates to:
  /// **'Пошаговая инструкция'**
  String get stepByStep;

  /// No description provided for @recommendedProducts.
  ///
  /// In ru, this message translates to:
  /// **'Рекомендуемые средства'**
  String get recommendedProducts;

  /// No description provided for @warnings.
  ///
  /// In ru, this message translates to:
  /// **'Предупреждения'**
  String get warnings;

  /// No description provided for @historyTitle.
  ///
  /// In ru, this message translates to:
  /// **'История анализов'**
  String get historyTitle;

  /// No description provided for @emptyHistory.
  ///
  /// In ru, this message translates to:
  /// **'Здесь будет история\nваших анализов'**
  String get emptyHistory;

  /// No description provided for @emptyHistoryHint.
  ///
  /// In ru, this message translates to:
  /// **'Сфотографируйте пятно, чтобы начать'**
  String get emptyHistoryHint;

  /// No description provided for @subscriptionTitle.
  ///
  /// In ru, this message translates to:
  /// **'Подписка и пакеты'**
  String get subscriptionTitle;

  /// No description provided for @packagesTitle.
  ///
  /// In ru, this message translates to:
  /// **'Дополнительные анализы'**
  String get packagesTitle;

  /// No description provided for @freePlan.
  ///
  /// In ru, this message translates to:
  /// **'Бесплатный план'**
  String get freePlan;

  /// No description provided for @freePlanDesc.
  ///
  /// In ru, this message translates to:
  /// **'3 бесплатных анализа каждый день'**
  String get freePlanDesc;

  /// No description provided for @unlimited.
  ///
  /// In ru, this message translates to:
  /// **'Безлимитные анализы каждый день'**
  String get unlimited;

  /// No description provided for @savingsPercent.
  ///
  /// In ru, this message translates to:
  /// **'Экономия 37%'**
  String get savingsPercent;

  /// No description provided for @settingsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Настройки'**
  String get settingsTitle;

  /// No description provided for @language.
  ///
  /// In ru, this message translates to:
  /// **'Язык'**
  String get language;

  /// No description provided for @howToUse.
  ///
  /// In ru, this message translates to:
  /// **'Как пользоваться'**
  String get howToUse;

  /// No description provided for @support.
  ///
  /// In ru, this message translates to:
  /// **'Поддержка'**
  String get support;

  /// No description provided for @rateInRustore.
  ///
  /// In ru, this message translates to:
  /// **'Оценить в RuStore'**
  String get rateInRustore;

  /// No description provided for @shareApp.
  ///
  /// In ru, this message translates to:
  /// **'Поделиться приложением'**
  String get shareApp;

  /// No description provided for @shareAppText.
  ///
  /// In ru, this message translates to:
  /// **'Попробуй Пятновыводитель — определяет как вывести пятна по фото! https://apps.rustore.ru/app/com.zubcoder.ai_stain_fix'**
  String get shareAppText;

  /// No description provided for @privacyPolicy.
  ///
  /// In ru, this message translates to:
  /// **'Политика конфиденциальности'**
  String get privacyPolicy;

  /// No description provided for @termsOfService.
  ///
  /// In ru, this message translates to:
  /// **'Пользовательское соглашение'**
  String get termsOfService;

  /// No description provided for @version.
  ///
  /// In ru, this message translates to:
  /// **'Версия'**
  String get version;

  /// No description provided for @limitExhausted.
  ///
  /// In ru, this message translates to:
  /// **'Лимит исчерпан'**
  String get limitExhausted;

  /// No description provided for @limitExhaustedDesc.
  ///
  /// In ru, this message translates to:
  /// **'Бесплатные анализы на сегодня закончились.\nКупите пакет или оформите PRO-подписку.'**
  String get limitExhaustedDesc;

  /// No description provided for @ok.
  ///
  /// In ru, this message translates to:
  /// **'Понятно'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get cancel;

  /// No description provided for @next.
  ///
  /// In ru, this message translates to:
  /// **'Далее'**
  String get next;

  /// No description provided for @start.
  ///
  /// In ru, this message translates to:
  /// **'Начать'**
  String get start;

  /// No description provided for @skip.
  ///
  /// In ru, this message translates to:
  /// **'Пропустить'**
  String get skip;

  /// No description provided for @close.
  ///
  /// In ru, this message translates to:
  /// **'Закрыть'**
  String get close;

  /// No description provided for @noInternet.
  ///
  /// In ru, this message translates to:
  /// **'Нет подключения к интернету. Проверьте соединение.'**
  String get noInternet;

  /// No description provided for @serverError.
  ///
  /// In ru, this message translates to:
  /// **'Сервер временно недоступен. Попробуйте позже.'**
  String get serverError;

  /// No description provided for @tryAgain.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось проанализировать. Попробуйте позже.'**
  String get tryAgain;

  /// No description provided for @justNow.
  ///
  /// In ru, this message translates to:
  /// **'Только что'**
  String get justNow;

  /// No description provided for @minutesAgo.
  ///
  /// In ru, this message translates to:
  /// **'{count} мин. назад'**
  String minutesAgo(int count);

  /// No description provided for @hoursAgo.
  ///
  /// In ru, this message translates to:
  /// **'{count} ч. назад'**
  String hoursAgo(int count);

  /// No description provided for @daysAgo.
  ///
  /// In ru, this message translates to:
  /// **'{count} дн. назад'**
  String daysAgo(int count);

  /// No description provided for @onboardingTitle1.
  ///
  /// In ru, this message translates to:
  /// **'Сфотографируйте пятно'**
  String get onboardingTitle1;

  /// No description provided for @onboardingDesc1.
  ///
  /// In ru, this message translates to:
  /// **'Наведите камеру на загрязнение для мгновенного анализа'**
  String get onboardingDesc1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In ru, this message translates to:
  /// **'Умное определение'**
  String get onboardingTitle2;

  /// No description provided for @onboardingDesc2.
  ///
  /// In ru, this message translates to:
  /// **'Умное распознавание вида пятна и типа ткани'**
  String get onboardingDesc2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In ru, this message translates to:
  /// **'Получите инструкцию'**
  String get onboardingTitle3;

  /// No description provided for @onboardingDesc3.
  ///
  /// In ru, this message translates to:
  /// **'Пошаговый рецепт удаления с доступными средствами'**
  String get onboardingDesc3;

  /// No description provided for @onboardingTitle4.
  ///
  /// In ru, this message translates to:
  /// **'Умный помощник'**
  String get onboardingTitle4;

  /// No description provided for @onboardingDesc4.
  ///
  /// In ru, this message translates to:
  /// **'Учитывает тип ткани, возраст пятна и доступные средства'**
  String get onboardingDesc4;

  /// No description provided for @errorAnalysis.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка анализа'**
  String get errorAnalysis;

  /// No description provided for @retry.
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get retry;

  /// No description provided for @recordDeleted.
  ///
  /// In ru, this message translates to:
  /// **'Запись удалена'**
  String get recordDeleted;

  /// No description provided for @undo.
  ///
  /// In ru, this message translates to:
  /// **'Отменить'**
  String get undo;

  /// No description provided for @deleteConfirmTitle.
  ///
  /// In ru, this message translates to:
  /// **'Удалить запись?'**
  String get deleteConfirmTitle;

  /// No description provided for @deleteConfirmBody.
  ///
  /// In ru, this message translates to:
  /// **'Эта запись будет удалена из истории.'**
  String get deleteConfirmBody;

  /// No description provided for @delete.
  ///
  /// In ru, this message translates to:
  /// **'Удалить'**
  String get delete;

  /// No description provided for @shareResultText.
  ///
  /// In ru, this message translates to:
  /// **'Пятно: {stainType}\nТкань: {fabricType}\nСложность: {difficulty}\n\nОпределено с помощью Пятновыводитель'**
  String shareResultText(String stainType, String fabricType, String difficulty);

  /// No description provided for @fabricLabel.
  ///
  /// In ru, this message translates to:
  /// **'Ткань: {fabric}'**
  String fabricLabel(String fabric);

  /// No description provided for @historyProLock.
  ///
  /// In ru, this message translates to:
  /// **'История доступна в PRO'**
  String get historyProLock;

  /// No description provided for @historyProLockDesc.
  ///
  /// In ru, this message translates to:
  /// **'Оформите PRO-подписку, чтобы сохранять\nи просматривать историю анализов'**
  String get historyProLockDesc;

  /// No description provided for @goToPro.
  ///
  /// In ru, this message translates to:
  /// **'Перейти к PRO'**
  String get goToPro;

  /// No description provided for @proFeature1.
  ///
  /// In ru, this message translates to:
  /// **'Безлимитные анализы пятен'**
  String get proFeature1;

  /// No description provided for @proFeature2.
  ///
  /// In ru, this message translates to:
  /// **'Доступ к истории анализов'**
  String get proFeature2;

  /// No description provided for @proFeature3.
  ///
  /// In ru, this message translates to:
  /// **'Приоритетная обработка'**
  String get proFeature3;

  /// No description provided for @proFeature4.
  ///
  /// In ru, this message translates to:
  /// **'Поддержка новых типов тканей'**
  String get proFeature4;

  /// No description provided for @proMonthly.
  ///
  /// In ru, this message translates to:
  /// **'79 ₽/мес'**
  String get proMonthly;

  /// No description provided for @proYearly.
  ///
  /// In ru, this message translates to:
  /// **'590 ₽/год'**
  String get proYearly;

  /// No description provided for @purchaseTitle.
  ///
  /// In ru, this message translates to:
  /// **'Покупка: {product}'**
  String purchaseTitle(String product);

  /// No description provided for @purchaseDesc.
  ///
  /// In ru, this message translates to:
  /// **'Интеграция с RuStore Pay будет доступна после публикации.\n\nВ демо-режиме покупки не списывают средства.'**
  String get purchaseDesc;

  /// No description provided for @demoPurchase.
  ///
  /// In ru, this message translates to:
  /// **'Демо-покупка'**
  String get demoPurchase;

  /// No description provided for @demoAdded.
  ///
  /// In ru, this message translates to:
  /// **'Демо: +10 анализов добавлено'**
  String get demoAdded;

  /// No description provided for @general.
  ///
  /// In ru, this message translates to:
  /// **'Основные'**
  String get general;

  /// No description provided for @about.
  ///
  /// In ru, this message translates to:
  /// **'О приложении'**
  String get about;

  /// No description provided for @selectLanguage.
  ///
  /// In ru, this message translates to:
  /// **'Выбор языка'**
  String get selectLanguage;

  /// No description provided for @describeProblem.
  ///
  /// In ru, this message translates to:
  /// **'Опишите проблему:\n'**
  String get describeProblem;

  /// No description provided for @feedback.
  ///
  /// In ru, this message translates to:
  /// **'Обратная связь'**
  String get feedback;

  /// No description provided for @darkTheme.
  ///
  /// In ru, this message translates to:
  /// **'Тёмная тема'**
  String get darkTheme;

  /// No description provided for @lightTheme.
  ///
  /// In ru, this message translates to:
  /// **'Светлая тема'**
  String get lightTheme;

  /// No description provided for @privacyPolicyTitle.
  ///
  /// In ru, this message translates to:
  /// **'Политика конфиденциальности'**
  String get privacyPolicyTitle;

  /// No description provided for @privacyPolicyLastUpdated.
  ///
  /// In ru, this message translates to:
  /// **'Последнее обновление: 19 мая 2026 г.'**
  String get privacyPolicyLastUpdated;

  /// No description provided for @privacySection1Title.
  ///
  /// In ru, this message translates to:
  /// **'1. Общие положения'**
  String get privacySection1Title;

  /// No description provided for @privacySection1Body.
  ///
  /// In ru, this message translates to:
  /// **'Настоящая Политика конфиденциальности разработана в соответствии с Федеральным законом от 27.07.2006 №152-ФЗ «О персональных данных».\nОператор персональных данных: ИП Зубков С.В. (далее — Разработчик).\nПриложение: «Пятновыводитель» (далее — Приложение).'**
  String get privacySection1Body;

  /// No description provided for @privacySection2Title.
  ///
  /// In ru, this message translates to:
  /// **'2. Какие данные мы собираем'**
  String get privacySection2Title;

  /// No description provided for @privacySection2Body.
  ///
  /// In ru, this message translates to:
  /// **'Приложение может собирать следующие данные:\n\n• Фотографии и изображения — только те, что вы добровольно загружаете для анализа. Фотографии обрабатываются на защищённых облачных серверах и НЕ сохраняются после обработки.\n• Локальные данные — история анализов. Хранятся ТОЛЬКО на вашем устройстве.\n• Настройки приложения (язык, тема оформления) — хранятся локально на устройстве.\n\nПриложение НЕ собирает: ФИО, адрес, телефон, email, геолокацию, данные банковских карт, рекламные идентификаторы.'**
  String get privacySection2Body;

  /// No description provided for @privacySection3Title.
  ///
  /// In ru, this message translates to:
  /// **'3. Цели обработки данных'**
  String get privacySection3Title;

  /// No description provided for @privacySection3Body.
  ///
  /// In ru, this message translates to:
  /// **'Обработка данных осуществляется исключительно для:\n\n• Распознавания типа пятна и ткани по фотографии\n• Генерации рекомендаций по удалению пятен\n• Ведения истории анализов на устройстве пользователя\n• Улучшения качества работы приложения'**
  String get privacySection3Body;

  /// No description provided for @privacySection4Title.
  ///
  /// In ru, this message translates to:
  /// **'4. Хранение и защита данных'**
  String get privacySection4Title;

  /// No description provided for @privacySection4Body.
  ///
  /// In ru, this message translates to:
  /// **'• Все данные хранятся исключительно на устройстве пользователя в локальной базе данных.\n• Передача фотографий осуществляется по зашифрованному каналу (HTTPS/TLS).\n• Фотографии обрабатываются в оперативной памяти сервера и не записываются на диск.\n• Разработчик не имеет доступа к локальным данным пользователя.'**
  String get privacySection4Body;

  /// No description provided for @privacySection5Title.
  ///
  /// In ru, this message translates to:
  /// **'5. Передача данных третьим лицам'**
  String get privacySection5Title;

  /// No description provided for @privacySection5Body.
  ///
  /// In ru, this message translates to:
  /// **'Фотографии передаются на защищённые облачные серверы исключительно для обработки и распознавания.\n\n• Данные не сохраняются на сторонних серверах после обработки.\n• Разработчик не передаёт, не продаёт и не предоставляет данные пользователей третьим лицам.\n• Обезличенная статистика может использоваться для улучшения сервиса.'**
  String get privacySection5Body;

  /// No description provided for @privacySection6Title.
  ///
  /// In ru, this message translates to:
  /// **'6. Права пользователя (ст. 14 №152-ФЗ)'**
  String get privacySection6Title;

  /// No description provided for @privacySection6Body.
  ///
  /// In ru, this message translates to:
  /// **'В соответствии с Федеральным законом №152-ФЗ «О персональных данных» вы имеете право:\n\n• Получить информацию об обработке ваших данных\n• Потребовать удаления ваших данных\n• Отозвать согласие на обработку данных\n\nДля удаления всех данных достаточно удалить приложение или очистить данные приложения в настройках устройства.'**
  String get privacySection6Body;

  /// No description provided for @privacySection7Title.
  ///
  /// In ru, this message translates to:
  /// **'7. Файлы cookie и аналитика'**
  String get privacySection7Title;

  /// No description provided for @privacySection7Body.
  ///
  /// In ru, this message translates to:
  /// **'Приложение не использует файлы cookie и рекламные трекеры. Приложение не требует регистрации.'**
  String get privacySection7Body;

  /// No description provided for @termsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Пользовательское соглашение'**
  String get termsTitle;

  /// No description provided for @termsLastUpdated.
  ///
  /// In ru, this message translates to:
  /// **'Последнее обновление: 19 мая 2026 г.'**
  String get termsLastUpdated;

  /// No description provided for @termsSection1Title.
  ///
  /// In ru, this message translates to:
  /// **'1. Общие положения'**
  String get termsSection1Title;

  /// No description provided for @termsSection1Body.
  ///
  /// In ru, this message translates to:
  /// **'Настоящее Пользовательское соглашение (далее — «Соглашение») регулирует использование мобильного приложения «Пятновыводитель» (далее — «Приложение»), разработанного ИП Зубков С.В. (далее — «Разработчик»).\nИспользуя Приложение, вы подтверждаете согласие с условиями настоящего Соглашения. Если вы не согласны — прекратите использование Приложения.'**
  String get termsSection1Body;

  /// No description provided for @termsSection2Title.
  ///
  /// In ru, this message translates to:
  /// **'2. Описание сервиса'**
  String get termsSection2Title;

  /// No description provided for @termsSection2Body.
  ///
  /// In ru, this message translates to:
  /// **'Приложение предоставляет следующие функции:\n\n• Анализ фотографий пятен для определения типа загрязнения\n• Генерация рекомендаций по удалению пятен с различных типов тканей\n• Ведение истории анализов'**
  String get termsSection2Body;

  /// No description provided for @termsSection3Title.
  ///
  /// In ru, this message translates to:
  /// **'3. Профессиональный дисклеймер'**
  String get termsSection3Title;

  /// No description provided for @termsSection3Body.
  ///
  /// In ru, this message translates to:
  /// **'ВАЖНО: Приложение предоставляет исключительно справочную информацию. Рекомендации носят информационный характер.\n\n• Разработчик не несёт ответственности за повреждение ткани или вещей при следовании рекомендациям\n• Перед применением любого средства рекомендуется протестировать его на незаметном участке ткани\n• Приложение НЕ заменяет профессиональную химчистку'**
  String get termsSection3Body;

  /// No description provided for @termsSection4Title.
  ///
  /// In ru, this message translates to:
  /// **'4. Ограничение ответственности'**
  String get termsSection4Title;

  /// No description provided for @termsSection4Body.
  ///
  /// In ru, this message translates to:
  /// **'• Результаты анализа носят рекомендательный характер и НЕ являются экспертным заключением.\n• Разработчик НЕ несёт ответственности за решения, принятые на основании результатов работы Приложения.\n• Разработчик НЕ гарантирует 100% точность распознавания и анализа.\n• Разработчик НЕ несёт ответственности за убытки, возникшие в результате использования или невозможности использования Приложения.\n• Разработчик НЕ несёт ответственности за перебои в работе, вызванные техническими причинами, действиями третьих лиц или обстоятельствами непреодолимой силы.\n• Максимальная ответственность разработчика ограничена суммой, уплаченной пользователем за последние 12 месяцев.'**
  String get termsSection4Body;

  /// No description provided for @termsSection5Title.
  ///
  /// In ru, this message translates to:
  /// **'5. Подписки, платежи и возврат средств'**
  String get termsSection5Title;

  /// No description provided for @termsSection5Body.
  ///
  /// In ru, this message translates to:
  /// **'• Часть функций доступна по подписке или через покупку пакетов анализов.\n• Оплата производится через RuStore.\n• Возврат средств осуществляется в соответствии с политикой RuStore и действующим законодательством РФ (ст. 32 Закона «О защите прав потребителей»).\n• Подписка продлевается автоматически, если не отменена за 24 часа до окончания текущего периода.\n• Для отмены подписки перейдите в настройки RuStore → Подписки.'**
  String get termsSection5Body;

  /// No description provided for @termsSection6Title.
  ///
  /// In ru, this message translates to:
  /// **'6. Интеллектуальная собственность'**
  String get termsSection6Title;

  /// No description provided for @termsSection6Body.
  ///
  /// In ru, this message translates to:
  /// **'• Все права на Приложение, включая дизайн, код, логотипы, тексты и графику, принадлежат Разработчику.\n• Пользователю предоставляется ограниченная, неисключительная, непередаваемая лицензия на использование Приложения.\n• Запрещается: копирование, декомпиляция, обратная разработка (исследование готового мобильного приложения, а также документации на него с целью понять принцип работы), распространение Приложения или его частей.\n• Пользователь сохраняет права на загруженные им фотографии. Результаты анализа предоставляются для личного использования.'**
  String get termsSection6Body;

  /// No description provided for @termsSection7Title.
  ///
  /// In ru, this message translates to:
  /// **'7. Права и обязанности пользователя'**
  String get termsSection7Title;

  /// No description provided for @termsSection7Body.
  ///
  /// In ru, this message translates to:
  /// **'• Пользователь обязуется использовать Приложение в соответствии с законодательством Российской Федерации.\n• Запрещается использование Приложения для незаконных целей.\n• Пользователь несёт ответственность за содержимое загружаемых изображений.\n• Пользователь может прекратить использование Приложения в любой момент, удалив его с устройства.'**
  String get termsSection7Body;

  /// No description provided for @termsSection8Title.
  ///
  /// In ru, this message translates to:
  /// **'8. Возрастные ограничения'**
  String get termsSection8Title;

  /// No description provided for @termsSection8Body.
  ///
  /// In ru, this message translates to:
  /// **'Приложение предназначено для лиц старше 12+ лет.'**
  String get termsSection8Body;

  /// No description provided for @privacyLastUpdated.
  ///
  /// In ru, this message translates to:
  /// **'Последнее обновление: 19 мая 2026 г.'**
  String get privacyLastUpdated;

  /// No description provided for @privacySection8Title.
  ///
  /// In ru, this message translates to:
  /// **'8. Возрастные ограничения'**
  String get privacySection8Title;

  /// No description provided for @privacySection8Body.
  ///
  /// In ru, this message translates to:
  /// **'Приложение предназначено для лиц старше 12+ лет.'**
  String get privacySection8Body;

  /// No description provided for @privacySection9Title.
  ///
  /// In ru, this message translates to:
  /// **'9. Изменения политики'**
  String get privacySection9Title;

  /// No description provided for @privacySection9Body.
  ///
  /// In ru, this message translates to:
  /// **'Разработчик оставляет за собой право обновлять настоящую Политику. Актуальная версия всегда доступна в приложении и по адресу: https://zubcoder.github.io/AI-Stain-Fix/privacy-policy.html'**
  String get privacySection9Body;

  /// No description provided for @privacySection10Title.
  ///
  /// In ru, this message translates to:
  /// **'10. Контакты'**
  String get privacySection10Title;

  /// No description provided for @privacySection10Body.
  ///
  /// In ru, this message translates to:
  /// **'По вопросам обработки персональных данных: ai.stain.fix.app@gmail.com'**
  String get privacySection10Body;

  /// No description provided for @termsSection9Title.
  ///
  /// In ru, this message translates to:
  /// **'9. Применимое право и разрешение споров'**
  String get termsSection9Title;

  /// No description provided for @termsSection9Body.
  ///
  /// In ru, this message translates to:
  /// **'• Настоящее Соглашение регулируется законодательством Российской Федерации.\n• Споры разрешаются путём переговоров, а при недостижении согласия — в суде по месту нахождения Разработчика.\n• Разработчик вправе в одностороннем порядке изменять условия настоящего Соглашения, уведомив пользователей через обновление Приложения.'**
  String get termsSection9Body;

  /// No description provided for @termsSection10Title.
  ///
  /// In ru, this message translates to:
  /// **'10. Контакты'**
  String get termsSection10Title;

  /// No description provided for @termsSection10Body.
  ///
  /// In ru, this message translates to:
  /// **'По вопросам, связанным с настоящим Соглашением: ai.stain.fix.app@gmail.com'**
  String get termsSection10Body;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
