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
  String get chatTab => 'Chat';

  @override
  String get chatTitle => 'Ask an expert';

  @override
  String get chatEmpty =>
      'Ask a question about stain removal, laundry or fabric care';

  @override
  String get chatHint => 'Type your question...';

  @override
  String get chatSuggestion1 => 'How to remove coffee from a shirt?';

  @override
  String get chatSuggestion2 => 'What temperature for wool?';

  @override
  String get chatSuggestion3 => 'How to remove grease stains?';

  @override
  String get takePhoto => 'Take photo';

  @override
  String get fromGallery => 'From gallery';

  @override
  String get photoStain => 'Photograph the stain';

  @override
  String get aiWillHelp =>
      'Identify the type of stain and get advice\non how to remove it';

  @override
  String get analyzing => 'Analyzing stain...';

  @override
  String get analyzingDesc => 'Identifying the type of stain and fabric';

  @override
  String get analysisResult => 'Analysis result';

  @override
  String get aiAnalysis => 'Analysis';

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
  String get freePlanDesc => '5 free analyses every day';

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
  String get shareApp => 'Share app';

  @override
  String get shareAppText =>
      'Try Stain Fix — identifies how to remove stains from photos! https://apps.rustore.ru/app/com.zubcoder.ai_stain_fix';

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
  String get onboardingTitle2 => 'Smart identification';

  @override
  String get onboardingDesc2 => 'Smart recognition of stain type and fabric';

  @override
  String get onboardingTitle3 => 'Fabric Inspector';

  @override
  String get onboardingDesc3 => 'Photo fabric — type, label decoding, care';

  @override
  String get onboardingTitle4 => 'Step-by-step recipe';

  @override
  String get onboardingDesc4 => 'Instructions considering fabric and products';

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
  String get proFeatureFabric => 'Fabric Inspector — type + labels';

  @override
  String get proMonthly => '79 ₽/mo';

  @override
  String get proYearly => '590 ₽/yr';

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
  String get darkTheme => 'Dark theme';

  @override
  String get lightTheme => 'Light theme';

  @override
  String get privacyPolicyTitle => 'Privacy Policy';

  @override
  String get privacyPolicyLastUpdated => 'Last updated: May 19, 2026';

  @override
  String get privacySection1Title => '1. General Provisions';

  @override
  String get privacySection1Body =>
      'This Privacy Policy is developed in accordance with Federal Law No. 152-FZ dated July 27, 2006 \"On Personal Data\".\nData Controller: IE Zubkov S.V. (hereinafter — the Developer).\nApplication: \"Stain Fix\" (hereinafter — the Application).';

  @override
  String get privacySection2Title => '2. Data We Collect';

  @override
  String get privacySection2Body =>
      'The Application may collect the following data:\n\n• Photos and images — only those you voluntarily upload for analysis. Photos are processed on secure cloud servers and are NOT stored after processing.\n• Local data — analysis history. Stored ONLY on your device.\n• App settings (language, theme) — stored locally on the device.\n\nThe Application does NOT collect: full name, address, phone, email, geolocation, payment card data, advertising identifiers.';

  @override
  String get privacySection3Title => '3. Purpose of Data Processing';

  @override
  String get privacySection3Body =>
      'Data is processed exclusively for:\n\n• Recognizing stain type and fabric from photographs\n• Generating stain removal recommendations\n• Maintaining analysis history on the user\'s device\n• Improving the quality of the application';

  @override
  String get privacySection4Title => '4. Data Storage and Protection';

  @override
  String get privacySection4Body =>
      '• All data is stored exclusively on the user\'s device in a local database.\n• Photos are transmitted via an encrypted channel (HTTPS/TLS).\n• Photos are processed in server memory and are not written to disk.\n• The Developer has no access to user\'s local data.';

  @override
  String get privacySection5Title => '5. Third-Party Data Sharing';

  @override
  String get privacySection5Body =>
      'Photos are sent to secure cloud servers exclusively for processing and recognition.\n\n• Data is not stored on third-party servers after processing.\n• The Developer does not transfer, sell, or share user data with third parties.\n• Anonymized statistics may be used to improve the service.';

  @override
  String get privacySection6Title => '6. User Rights (Art. 14 No. 152-FZ)';

  @override
  String get privacySection6Body =>
      'In accordance with Federal Law No. 152-FZ \"On Personal Data\" you have the right to:\n\n• Obtain information about the processing of your data\n• Request deletion of your data\n• Withdraw consent for data processing\n\nTo delete all data, simply delete the application or clear app data in device settings.';

  @override
  String get privacySection7Title => '7. Cookies and Analytics';

  @override
  String get privacySection7Body =>
      'The Application does not use cookies or advertising trackers. The Application does not require registration.';

  @override
  String get termsTitle => 'Terms of Service';

  @override
  String get termsLastUpdated => 'Last updated: May 19, 2026';

  @override
  String get termsSection1Title => '1. General Provisions';

  @override
  String get termsSection1Body =>
      'These Terms of Service (hereinafter — the \"Agreement\") govern the use of the mobile application \"Stain Fix\" (hereinafter — the \"Application\"), developed by IE Zubkov S.V. (hereinafter — the \"Developer\").\nBy using the Application, you confirm your agreement with the terms of this Agreement. If you disagree — stop using the Application.';

  @override
  String get termsSection2Title => '2. Service Description';

  @override
  String get termsSection2Body =>
      'The Application provides the following features:\n\n• Photo analysis of stains to determine contamination type\n• Generation of stain removal recommendations\n• Fabric type identification from photos and care symbol decoding\n• Analysis history management';

  @override
  String get termsSection3Title => '3. Professional Disclaimer';

  @override
  String get termsSection3Body =>
      'IMPORTANT: The Application provides reference information only. Recommendations are informational in nature.\n\n• The Developer is not responsible for damage to fabric or items when following recommendations\n• Before applying any product, it is recommended to test it on an inconspicuous area of fabric\n• The Application does NOT replace professional dry cleaning';

  @override
  String get termsSection4Title => '4. Limitation of Liability';

  @override
  String get termsSection4Body =>
      '• Analysis results are advisory and NOT expert opinions.\n• The Developer is NOT responsible for decisions made based on the Application\'s results.\n• The Developer does NOT guarantee 100% recognition and analysis accuracy.\n• The Developer is NOT responsible for losses arising from the use or inability to use the Application.\n• The Developer is NOT responsible for service interruptions caused by technical reasons, third-party actions, or force majeure.\n• The Developer\'s maximum liability is limited to the amount paid by the user in the last 12 months.';

  @override
  String get termsSection5Title => '5. Subscriptions, Payments and Refunds';

  @override
  String get termsSection5Body =>
      '• Some features are available via subscription or analysis package purchases.\n• Payment is processed through RuStore.\n• Refunds are provided in accordance with RuStore policy and applicable Russian law (Art. 32 of the Consumer Protection Law).\n• Subscription renews automatically unless cancelled 24 hours before the current period ends.\n• To cancel, go to RuStore settings → Subscriptions.';

  @override
  String get termsSection6Title => '6. Intellectual Property';

  @override
  String get termsSection6Body =>
      '• All rights to the Application, including design, code, logos, texts and graphics, belong to the Developer.\n• The user is granted a limited, non-exclusive, non-transferable license to use the Application.\n• Prohibited: copying, decompilation, reverse engineering (studying a finished mobile application and its documentation to understand how it works), distribution of the Application or its parts.\n• The user retains rights to uploaded photos. Analysis results are provided for personal use.';

  @override
  String get termsSection7Title => '7. User Rights and Obligations';

  @override
  String get termsSection7Body =>
      '• The user agrees to use the Application in accordance with the laws of the Russian Federation.\n• Use of the Application for illegal purposes is prohibited.\n• The user is responsible for the content of uploaded images.\n• The user may stop using the Application at any time by deleting it from the device.';

  @override
  String get termsSection8Title => '8. Age Restrictions';

  @override
  String get termsSection8Body =>
      'The Application is intended for persons aged 12+.';

  @override
  String get privacyLastUpdated => 'Last updated: May 19, 2026';

  @override
  String get privacySection8Title => '8. Age Restrictions';

  @override
  String get privacySection8Body =>
      'The Application is intended for persons aged 12+.';

  @override
  String get privacySection9Title => '9. Policy Changes';

  @override
  String get privacySection9Body =>
      'The Developer reserves the right to update this Policy. The current version is always available in the application and at: https://zubcoder.github.io/AI-Stain-Fix/privacy-policy.html';

  @override
  String get privacySection10Title => '10. Contact';

  @override
  String get privacySection10Body =>
      'For questions regarding personal data processing: ai.stain.fix.app@gmail.com';

  @override
  String get termsSection9Title => '9. Governing Law and Dispute Resolution';

  @override
  String get termsSection9Body =>
      '• This Agreement is governed by the laws of the Russian Federation.\n• Disputes shall be resolved through negotiation, and if no agreement is reached — in court at the Developer\'s location.\n• The Developer may unilaterally amend the terms of this Agreement by notifying users through an Application update.';

  @override
  String get termsSection10Title => '10. Contact';

  @override
  String get termsSection10Body =>
      'For questions related to this Agreement: ai.stain.fix.app@gmail.com';

  @override
  String get fabricInspectorButton => 'Fabric Inspector';

  @override
  String get fabricFromGallery => 'Fabric from gallery';

  @override
  String get fabricInspectorTitle => 'Fabric Inspector';

  @override
  String get fabricDensity => 'Density';

  @override
  String get fabricConfidence => 'Confidence';

  @override
  String get fabricCareTitle => 'Care Instructions';

  @override
  String get fabricWashing => 'Washing';

  @override
  String get fabricDetergent => 'Detergent';

  @override
  String get fabricDrying => 'Drying';

  @override
  String get fabricIroning => 'Ironing';

  @override
  String get fabricForbidden => 'Forbidden';

  @override
  String get fabricMachineYes => 'Machine washable';

  @override
  String get fabricLabelSymbols => 'Care Label Symbols';

  @override
  String get fabricStainTip => 'Stain removal tip';

  @override
  String get analyzingFabric => 'Identifying fabric...';
}
