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
  /// **'Welcome! '**
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

  /// No description provided for @allTransactions.
  ///
  /// In en, this message translates to:
  /// **'All Transactions'**
  String get allTransactions;

  /// No description provided for @transactions.
  ///
  /// In en, this message translates to:
  /// **'transactions'**
  String get transactions;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @errorLoadingTransactions.
  ///
  /// In en, this message translates to:
  /// **'Error loading transactions'**
  String get errorLoadingTransactions;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @noTransactionsFound.
  ///
  /// In en, this message translates to:
  /// **'No transactions found'**
  String get noTransactionsFound;

  /// No description provided for @noTransactionsDescription.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any transactions yet'**
  String get noTransactionsDescription;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faq;

  /// No description provided for @frequentlyAskedQuestions.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get frequentlyAskedQuestions;

  /// No description provided for @learnHowToUseVoiceBanking.
  ///
  /// In en, this message translates to:
  /// **'Learn how to use voice banking effectively'**
  String get learnHowToUseVoiceBanking;

  /// No description provided for @whatToSpeak.
  ///
  /// In en, this message translates to:
  /// **'What to speak'**
  String get whatToSpeak;

  /// No description provided for @whatToSpeakDescription.
  ///
  /// In en, this message translates to:
  /// **'For example, You can ask what is my current balance'**
  String get whatToSpeakDescription;

  /// No description provided for @howToCheckTransactions.
  ///
  /// In en, this message translates to:
  /// **'How to check transactions'**
  String get howToCheckTransactions;

  /// No description provided for @howToCheckTransactionsDescription.
  ///
  /// In en, this message translates to:
  /// **'You can ask what is my last x transactions'**
  String get howToCheckTransactionsDescription;

  /// No description provided for @voiceCommandsDescription.
  ///
  /// In en, this message translates to:
  /// **'Speak clearly and naturally. The system understands conversational language.'**
  String get voiceCommandsDescription;

  /// No description provided for @supportedLanguages.
  ///
  /// In en, this message translates to:
  /// **'Supported Languages'**
  String get supportedLanguages;

  /// No description provided for @supportedLanguagesDescription.
  ///
  /// In en, this message translates to:
  /// **'Currently supports English, Hindi, Bengali, Gujarati, Kannada, Malayalam, Marathi, Punjabi, Tamil, and Telugu.'**
  String get supportedLanguagesDescription;

  /// No description provided for @privacySecurity.
  ///
  /// In en, this message translates to:
  /// **'Privacy & Security'**
  String get privacySecurity;

  /// No description provided for @privacySecurityDescription.
  ///
  /// In en, this message translates to:
  /// **'Your voice data is processed securely and is not stored permanently.'**
  String get privacySecurityDescription;

  /// No description provided for @proTips.
  ///
  /// In en, this message translates to:
  /// **'Pro Tips'**
  String get proTips;

  /// No description provided for @tipQuietEnvironment.
  ///
  /// In en, this message translates to:
  /// **'Speak in a quiet environment for better recognition'**
  String get tipQuietEnvironment;

  /// No description provided for @tipNaturalLanguage.
  ///
  /// In en, this message translates to:
  /// **'Use natural language like \"Show me my balance\"'**
  String get tipNaturalLanguage;

  /// No description provided for @tipWaitForIndicator.
  ///
  /// In en, this message translates to:
  /// **'Wait for the listening indicator before speaking'**
  String get tipWaitForIndicator;

  /// No description provided for @needMoreHelp.
  ///
  /// In en, this message translates to:
  /// **'Need More Help?'**
  String get needMoreHelp;

  /// No description provided for @contactSupportDescription.
  ///
  /// In en, this message translates to:
  /// **'Contact our support team for additional assistance'**
  String get contactSupportDescription;

  /// No description provided for @balanceSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your current balance is {amount} rupees.'**
  String balanceSuccess(Object amount);

  /// No description provided for @transactionsFound.
  ///
  /// In en, this message translates to:
  /// **'Here are your {count} most recent transactions.'**
  String transactionsFound(Object count);

  /// No description provided for @noTransactions.
  ///
  /// In en, this message translates to:
  /// **'No transactions found.'**
  String get noTransactions;

  /// No description provided for @transferSuccess.
  ///
  /// In en, this message translates to:
  /// **'Transfer of {amount} rupees to {recipient} has been initiated successfully.'**
  String transferSuccess(Object amount, Object recipient);

  /// No description provided for @transferFailed.
  ///
  /// In en, this message translates to:
  /// **'Transfer failed. Please try again.'**
  String get transferFailed;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Sorry, I encountered an error. Please try again.'**
  String get errorGeneric;

  /// No description provided for @errorInsufficientFunds.
  ///
  /// In en, this message translates to:
  /// **'Insufficient funds. Please check your balance.'**
  String get errorInsufficientFunds;

  /// No description provided for @otpNotification.
  ///
  /// In en, this message translates to:
  /// **'Lingo Voice Banking OTP: {otp}'**
  String otpNotification(Object otp);

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'Login failed'**
  String get loginFailed;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Network error: {error}'**
  String networkError(Object error);

  /// No description provided for @verificationFailed.
  ///
  /// In en, this message translates to:
  /// **'Verification failed: {error}'**
  String verificationFailed(Object error);

  /// No description provided for @resendInSeconds.
  ///
  /// In en, this message translates to:
  /// **'Resend in {seconds}s'**
  String resendInSeconds(Object seconds);

  /// No description provided for @resendOtpFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to resend OTP: {message}'**
  String resendOtpFailed(Object message);

  /// No description provided for @transactionDetails.
  ///
  /// In en, this message translates to:
  /// **'Transaction Details'**
  String get transactionDetails;

  /// No description provided for @sessionId.
  ///
  /// In en, this message translates to:
  /// **'Session ID: {sessionId}...'**
  String sessionId(Object sessionId);

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @debit.
  ///
  /// In en, this message translates to:
  /// **'Debit'**
  String get debit;

  /// No description provided for @credit.
  ///
  /// In en, this message translates to:
  /// **'Credit'**
  String get credit;

  /// No description provided for @mobileNumberNotFound.
  ///
  /// In en, this message translates to:
  /// **'Mobile number not found. Please login again.'**
  String get mobileNumberNotFound;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @hindi.
  ///
  /// In en, this message translates to:
  /// **'हिन्दी'**
  String get hindi;

  /// No description provided for @tamil.
  ///
  /// In en, this message translates to:
  /// **'தமிழ்'**
  String get tamil;

  /// No description provided for @telugu.
  ///
  /// In en, this message translates to:
  /// **'తెలుగు'**
  String get telugu;

  /// No description provided for @bengali.
  ///
  /// In en, this message translates to:
  /// **'বাংলা'**
  String get bengali;

  /// No description provided for @gujarati.
  ///
  /// In en, this message translates to:
  /// **'ગુજરાતી'**
  String get gujarati;

  /// No description provided for @malayalam.
  ///
  /// In en, this message translates to:
  /// **'മലയാളം'**
  String get malayalam;

  /// No description provided for @marathi.
  ///
  /// In en, this message translates to:
  /// **'मराठी'**
  String get marathi;

  /// No description provided for @kannada.
  ///
  /// In en, this message translates to:
  /// **'ಕನ್ನಡ'**
  String get kannada;

  /// No description provided for @punjabi.
  ///
  /// In en, this message translates to:
  /// **'ਪੰਜਾਬੀ'**
  String get punjabi;
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
