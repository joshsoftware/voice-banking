import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';

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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bn'),
    Locale('en'),
    Locale('gu'),
    Locale('hi'),
    Locale('kn'),
    Locale('ml'),
    Locale('mr'),
    Locale('pa'),
    Locale('ta'),
    Locale('te')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Lingo Voice Banking'**
  String get appTitle;

  /// No description provided for @loginPrompt.
  ///
  /// In en, this message translates to:
  /// **'Enter your mobile number'**
  String get loginPrompt;

  /// No description provided for @otpPrompt.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP'**
  String get otpPrompt;

  /// No description provided for @micHint.
  ///
  /// In en, this message translates to:
  /// **'Tap the mic to speak'**
  String get micHint;

  /// No description provided for @listening.
  ///
  /// In en, this message translates to:
  /// **'Listening...'**
  String get listening;

  /// No description provided for @transcribing.
  ///
  /// In en, this message translates to:
  /// **'Transcribing...'**
  String get transcribing;

  /// No description provided for @executing.
  ///
  /// In en, this message translates to:
  /// **'Processing your request...'**
  String get executing;

  /// No description provided for @otpSuccess.
  ///
  /// In en, this message translates to:
  /// **'OTP verified successfully!'**
  String get otpSuccess;

  /// No description provided for @balanceResponse.
  ///
  /// In en, this message translates to:
  /// **'Your current balance is {amount} rupees.'**
  String balanceResponse(Object amount);

  /// No description provided for @failedIntent.
  ///
  /// In en, this message translates to:
  /// **'Sorry, I didn\'t catch that.'**
  String get failedIntent;

  /// No description provided for @recTxns.
  ///
  /// In en, this message translates to:
  /// **'Recent transactions'**
  String get recTxns;

  /// No description provided for @curBalance.
  ///
  /// In en, this message translates to:
  /// **'Available balance'**
  String get curBalance;

  /// No description provided for @msgNoTransactionFound.
  ///
  /// In en, this message translates to:
  /// **'No transactions found.'**
  String get msgNoTransactionFound;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @logoutConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logoutConfirm;

  /// No description provided for @logoutSuccess.
  ///
  /// In en, this message translates to:
  /// **'Logged out successfully!'**
  String get logoutSuccess;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back! 👋'**
  String get welcomeBack;

  /// No description provided for @voiceBankingDashboard.
  ///
  /// In en, this message translates to:
  /// **'Your voice banking dashboard'**
  String get voiceBankingDashboard;

  /// No description provided for @availableBalance.
  ///
  /// In en, this message translates to:
  /// **'Available Balance'**
  String get availableBalance;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @voice.
  ///
  /// In en, this message translates to:
  /// **'Voice'**
  String get voice;

  /// No description provided for @stop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get stop;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @welcomeTo.
  ///
  /// In en, this message translates to:
  /// **'Welcome to'**
  String get welcomeTo;

  /// No description provided for @experienceBanking.
  ///
  /// In en, this message translates to:
  /// **'Experience banking with the power of voice'**
  String get experienceBanking;

  /// No description provided for @enterMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter Mobile Number'**
  String get enterMobileNumber;

  /// No description provided for @weWillSendOtp.
  ///
  /// In en, this message translates to:
  /// **'We\'ll send you an OTP to verify your number'**
  String get weWillSendOtp;

  /// No description provided for @mobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobileNumber;

  /// No description provided for @enterYourMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your 10-digit mobile number'**
  String get enterYourMobileNumber;

  /// No description provided for @sendOtp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get sendOtp;

  /// No description provided for @pleaseEnterValidMobile.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid 10-digit mobile number'**
  String get pleaseEnterValidMobile;

  /// No description provided for @verifyYourPhone.
  ///
  /// In en, this message translates to:
  /// **'Verify Your Phone'**
  String get verifyYourPhone;

  /// No description provided for @weHaveSentCode.
  ///
  /// In en, this message translates to:
  /// **'We\'ve sent a 6-digit code to'**
  String get weHaveSentCode;

  /// No description provided for @enterVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Enter Verification Code'**
  String get enterVerificationCode;

  /// No description provided for @enterSixDigitCode.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code sent to your phone'**
  String get enterSixDigitCode;

  /// No description provided for @verifyOtp.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get verifyOtp;

  /// No description provided for @didntReceiveCode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the code? '**
  String get didntReceiveCode;

  /// No description provided for @resendIn.
  ///
  /// In en, this message translates to:
  /// **'Resend in {seconds}s'**
  String resendIn(Object seconds);

  /// No description provided for @resendOtp.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get resendOtp;

  /// No description provided for @otpValidFor.
  ///
  /// In en, this message translates to:
  /// **'Your OTP is valid for 5 minutes and can only be used once.'**
  String get otpValidFor;

  /// No description provided for @secureVerification.
  ///
  /// In en, this message translates to:
  /// **'Secure verification powered by AI'**
  String get secureVerification;

  /// No description provided for @otpVerifiedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'✅ OTP verified successfully!'**
  String get otpVerifiedSuccessfully;

  /// No description provided for @invalidOtp.
  ///
  /// In en, this message translates to:
  /// **'❌ Invalid OTP, please try again'**
  String get invalidOtp;

  /// No description provided for @newOtpSent.
  ///
  /// In en, this message translates to:
  /// **' New OTP sent to {mobileNumber}'**
  String newOtpSent(Object mobileNumber);

  /// No description provided for @pleaseEnterOtp.
  ///
  /// In en, this message translates to:
  /// **'Please enter the OTP'**
  String get pleaseEnterOtp;

  /// No description provided for @otpMustBeSixDigits.
  ///
  /// In en, this message translates to:
  /// **'OTP must be 6 digits'**
  String get otpMustBeSixDigits;

  /// No description provided for @whyChooseVoiceBanking.
  ///
  /// In en, this message translates to:
  /// **'Why Choose Voice Banking?'**
  String get whyChooseVoiceBanking;

  /// No description provided for @voiceCommands.
  ///
  /// In en, this message translates to:
  /// **'Voice Commands'**
  String get voiceCommands;

  /// No description provided for @controlWithVoice.
  ///
  /// In en, this message translates to:
  /// **'Control with your voice'**
  String get controlWithVoice;

  /// No description provided for @secure.
  ///
  /// In en, this message translates to:
  /// **'Secure'**
  String get secure;

  /// No description provided for @bankGradeSecurity.
  ///
  /// In en, this message translates to:
  /// **'Bank-grade security'**
  String get bankGradeSecurity;

  /// No description provided for @multiLanguage.
  ///
  /// In en, this message translates to:
  /// **'Multi-language'**
  String get multiLanguage;

  /// No description provided for @supportForLanguages.
  ///
  /// In en, this message translates to:
  /// **'Support for 10+ languages'**
  String get supportForLanguages;

  /// No description provided for @fast.
  ///
  /// In en, this message translates to:
  /// **'Fast'**
  String get fast;

  /// No description provided for @quickTransactions.
  ///
  /// In en, this message translates to:
  /// **'Quick transactions'**
  String get quickTransactions;

  /// No description provided for @poweredByAI.
  ///
  /// In en, this message translates to:
  /// **'Powered by AI Technology'**
  String get poweredByAI;

  /// No description provided for @paymentInitiated.
  ///
  /// In en, this message translates to:
  /// **'Payment initiated 🚀'**
  String get paymentInitiated;

  /// No description provided for @viewAllTransactions.
  ///
  /// In en, this message translates to:
  /// **'View all transactions'**
  String get viewAllTransactions;

  /// No description provided for @aiIsSpeaking.
  ///
  /// In en, this message translates to:
  /// **'AI is speaking…'**
  String get aiIsSpeaking;

  /// No description provided for @validationRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get validationRequired;

  /// No description provided for @validationEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get validationEmail;

  /// No description provided for @validationPhone.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get validationPhone;

  /// No description provided for @validationOtp.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid OTP'**
  String get validationOtp;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['bn', 'en', 'gu', 'hi', 'kn', 'ml', 'mr', 'pa', 'ta', 'te'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn': return AppLocalizationsBn();
    case 'en': return AppLocalizationsEn();
    case 'gu': return AppLocalizationsGu();
    case 'hi': return AppLocalizationsHi();
    case 'kn': return AppLocalizationsKn();
    case 'ml': return AppLocalizationsMl();
    case 'mr': return AppLocalizationsMr();
    case 'pa': return AppLocalizationsPa();
    case 'ta': return AppLocalizationsTa();
    case 'te': return AppLocalizationsTe();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
