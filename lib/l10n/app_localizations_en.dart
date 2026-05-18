// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Stain Fix';

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
      'The app will identify the type of stain and suggest\nhow to remove it';

  @override
  String get analyzing => 'Analyzing stain...';

  @override
  String get analyzingDesc => 'Identifying the type of stain and fabric';

  @override
  String get analysisResult => 'Analysis result';

  @override
  String get aiAnalysis => 'Analysis result';

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
  String get onboardingTitle2 => 'Type identification';

  @override
  String get onboardingDesc2 =>
      'The app recognizes the stain type and fabric';

  @override
  String get onboardingTitle3 => 'Get instructions';

  @override
  String get onboardingDesc3 =>
      'Step-by-step removal recipe with available products';

  @override
  String get onboardingTitle4 => 'Smart assistant';

  @override
  String get onboardingDesc4 =>
      'Considers fabric type, stain age, and available products';

  @override
  String get errorAnalysis => 'Analysis error';

  @override
  String get retry => 'Retry';

  @override
  String get recordDeleted => 'Record deleted';

  @override
  String fabricLabel(String fabric) {
    return 'Fabric: $fabric';
  }

  @override
  String get historyProLock => 'History available in PRO';

  @override
  String get historyProLockDesc =>
      'Subscribe to PRO to save\nand view your analysis history';

  @override
  String get goToPro => 'Go to PRO';

  @override
  String get proFeature1 => 'Unlimited stain analyses';

  @override
  String get proFeature2 => 'Access to analysis history';

  @override
  String get proFeature3 => 'Priority processing';

  @override
  String get proFeature4 => 'Support for new fabric types';

  @override
  String get proMonthly => '149 ₽/mo';

  @override
  String get proYearly => '1,190 ₽/yr';

  @override
  String purchaseTitle(String product) {
    return 'Purchase: $product';
  }

  @override
  String get purchaseDesc =>
      'Integration with RuStore Pay will be available after publishing.\n\nIn demo mode, purchases do not charge funds.';

  @override
  String get demoPurchase => 'Demo purchase';

  @override
  String get demoAdded => 'Demo: +10 analyses added';

  @override
  String get general => 'General';

  @override
  String get about => 'About';

  @override
  String get selectLanguage => 'Select language';

  @override
  String get describeProblem => 'Describe the problem:\n';

  @override
  String get feedback => 'Feedback';

  @override
  String get privacyPolicyTitle => 'Privacy Policy';

  @override
  String get privacyPolicyLastUpdated => 'Last updated: May 13, 2026';

  @override
  String get privacySection1Title => '1. General Provisions';

  @override
  String get privacySection1Body =>
      'The Stain Fix application (hereinafter referred to as the \"Application\") is designed to help users remove stains from various types of fabrics. This Privacy Policy describes what data we collect, how we use it, and how we protect it.';

  @override
  String get privacySection2Title => '2. Data We Collect';

  @override
  String get privacySection2Body =>
      '• Stain photos — used exclusively for analyzing the type of contamination and generating removal instructions.\n\n• Technical device information — OS version, device model, interface language (to improve service quality).\n\n• Purchase data — information about acquired packages and subscriptions (processed by the RuStore payment system).';

  @override
  String get privacySection3Title => '3. Photo Processing';

  @override
  String get privacySection3Body =>
      'Photos are transmitted to a secure server for image analysis and instruction generation.\n\nPhotos are not stored on the server after processing and are not shared with third parties. Images are used exclusively for generating stain removal recommendations.';

  @override
  String get privacySection4Title => '4. Data Storage';

  @override
  String get privacySection4Body =>
      'Analysis history is stored locally on your device. We do not have access to your local history.\n\nThe proxy server does not keep request logs and does not store uploaded images.';

  @override
  String get privacySection5Title => '5. Security';

  @override
  String get privacySection5Body =>
      'All data is transmitted via the secure HTTPS protocol. We take reasonable measures to protect your information from unauthorized access.';

  @override
  String get privacySection6Title => '6. User Rights';

  @override
  String get privacySection6Body =>
      'You can at any time:\n• Delete analysis history on your device\n• Delete the application and all associated data\n• Contact us with questions about your data';

  @override
  String get privacySection7Title => '7. Contact';

  @override
  String get privacySection7Body =>
      'For privacy inquiries, contact:\nai.stain.fix.app@gmail.com';

  @override
  String get termsTitle => 'Terms of Service';

  @override
  String get termsLastUpdated => 'Last updated: May 13, 2026';

  @override
  String get termsSection1Title => '1. Subject of Agreement';

  @override
  String get termsSection1Body =>
      'This Terms of Service agreement (hereinafter referred to as the \"Agreement\") governs the relationship between the developer of the Stain Fix application (hereinafter referred to as the \"Developer\") and the user (hereinafter referred to as the \"User\"), arising from the use of the Stain Fix mobile application (hereinafter referred to as the \"Application\").';

  @override
  String get termsSection2Title => '2. Service Description';

  @override
  String get termsSection2Body =>
      'The Application provides a service for analyzing photos of stains using image recognition technologies and generating removal recommendations. Recommendations are for informational purposes only.';

  @override
  String get termsSection3Title => '3. Terms of Use';

  @override
  String get termsSection3Body =>
      '• The User agrees to use the Application only for lawful purposes.\n\n• The free plan includes 3 analyses per day.\n\n• Additional analyses are available through purchasing packages or subscribing to PRO.\n\n• The User is responsible for the quality of provided photos.';

  @override
  String get termsSection4Title => '4. Limitation of Liability';

  @override
  String get termsSection4Body =>
      'Recommendations provided by the Application are for informational purposes only. The Developer is not responsible for:\n\n• Damage to fabric or items when following recommendations\n• Allergic reactions to recommended products\n• Inaccuracy in determining the type of stain or fabric\n• Service interruptions due to technical reasons\n\nBefore applying any product, it is recommended to test it on an inconspicuous area of the fabric.';

  @override
  String get termsSection5Title => '5. Paid Services';

  @override
  String get termsSection5Body =>
      'Payment is processed through the RuStore payment system. Refund conditions are determined by RuStore rules.\n\nPRO subscription renews automatically unless canceled 24 hours before the end of the current period.';

  @override
  String get termsSection6Title => '6. Intellectual Property';

  @override
  String get termsSection6Body =>
      'All rights to the Application, its design, code, and content belong to the Developer. The User is granted a non-exclusive license to use the Application for personal non-commercial purposes.';

  @override
  String get termsSection7Title => '7. Changes to Terms';

  @override
  String get termsSection7Body =>
      'The Developer reserves the right to change the terms of this Agreement. The current version is always available in the \"Settings\" section of the Application.';

  @override
  String get termsSection8Title => '8. Contact';

  @override
  String get termsSection8Body =>
      'For questions related to this Agreement:\nai.stain.fix.app@gmail.com';
}
