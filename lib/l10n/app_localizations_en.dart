// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'AI Stain Fix';

  @override
  String get appTagline => 'Smart stain removal by photo';

  @override
  String get camera => 'Camera';

  @override
  String get history => 'History';

  @override
  String get pro => 'PRO';

  @override
  String get settings => 'Settings';

  @override
  String get takePhoto => 'Take photo';

  @override
  String get fromGallery => 'From gallery';

  @override
  String get photoStain => 'Photograph the stain';

  @override
  String get aiWillHelp =>
      'AI will identify the type of stain and suggest\nhow to remove it';

  @override
  String get analyzing => 'Analyzing stain...';

  @override
  String get analyzingDesc => 'AI is identifying the type of stain and fabric';

  @override
  String get analysisResult => 'Analysis result';

  @override
  String get aiAnalysis => 'AI Analysis';

  @override
  String get stainType => 'Stain type';

  @override
  String get fabricType => 'Fabric';

  @override
  String get difficulty => 'Difficulty';

  @override
  String get stepByStep => 'Step-by-step instructions';

  @override
  String get recommendedProducts => 'Recommended products';

  @override
  String get warnings => 'Warnings';

  @override
  String get historyTitle => 'Analysis history';

  @override
  String get emptyHistory => 'Your analysis history\nwill appear here';

  @override
  String get emptyHistoryHint => 'Take a photo of a stain to get started';

  @override
  String get subscriptionTitle => 'Subscription & packages';

  @override
  String get packagesTitle => 'Extra analyses';

  @override
  String get freePlan => 'Free plan';

  @override
  String get freePlanDesc => '3 free analyses every day';

  @override
  String get unlimited => 'Unlimited analyses every day';

  @override
  String get savingsPercent => 'Save 37%';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get howToUse => 'How to use';

  @override
  String get support => 'Support';

  @override
  String get rateInRustore => 'Rate in RuStore';

  @override
  String get privacyPolicy => 'Privacy policy';

  @override
  String get termsOfService => 'Terms of service';

  @override
  String get version => 'Version';

  @override
  String get limitExhausted => 'Limit reached';

  @override
  String get limitExhaustedDesc =>
      'Free analyses for today are used up.\nBuy a package or subscribe to PRO.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancel';

  @override
  String get next => 'Next';

  @override
  String get start => 'Start';

  @override
  String get skip => 'Skip';

  @override
  String get close => 'Close';

  @override
  String get noInternet => 'No internet connection. Check your network.';

  @override
  String get serverError => 'Server temporarily unavailable. Try again later.';

  @override
  String get tryAgain => 'Could not analyze. Try again later.';

  @override
  String get justNow => 'Just now';

  @override
  String minutesAgo(int count) {
    return '$count min ago';
  }

  @override
  String hoursAgo(int count) {
    return '$count h ago';
  }

  @override
  String daysAgo(int count) {
    return '$count d ago';
  }

  @override
  String get onboardingTitle1 => 'Photograph the stain';

  @override
  String get onboardingDesc1 =>
      'Point your camera at the stain for instant analysis';

  @override
  String get onboardingTitle2 => 'AI identifies the type';

  @override
  String get onboardingDesc2 =>
      'Artificial intelligence recognizes the stain type and fabric';

  @override
  String get onboardingTitle3 => 'Get instructions';

  @override
  String get onboardingDesc3 =>
      'Step-by-step removal recipe with available products';

  @override
  String get onboardingTitle4 => 'Smart assistant';

  @override
  String get onboardingDesc4 =>
      'AI considers fabric type, stain age, and available products';
}
