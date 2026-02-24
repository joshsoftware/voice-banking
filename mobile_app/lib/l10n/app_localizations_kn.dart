// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get appTitle => 'ಲಿಂಗೋ ವಾಯಿಸ್ ಬ್ಯಾಂಕಿಂಗ್';

  @override
  String get loginPrompt => 'ನಿಮ್ಮ ಮೊಬೈಲ್ ಸಂಖ್ಯೆ ನಮೂದಿಸಿ';

  @override
  String get otpPrompt => 'OTP ನಮೂದಿಸಿ';

  @override
  String get micHint => 'ಮಾತನಾಡಲು ಮೈಕ್ ಅನ್ನು ಟ್ಯಾಪ್ ಮಾಡಿ';

  @override
  String get tapToSpeak => 'ಮಾತನಾಡಲು ಟ್ಯಾಪ್ ಮಾಡಿ';

  @override
  String get listening => 'ಕೇಳುತ್ತಿದೆ...';

  @override
  String get transcribing => 'ಪಠ್ಯಕ್ಕೆ ಪರಿವರ್ತನೆ ಆಗುತ್ತಿದೆ...';

  @override
  String get executing => 'ನಿಮ್ಮ ವಿನಂತಿಯನ್ನು ಪ್ರಕ್ರಿಯೆಗೊಳಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get otpSuccess => 'OTP ಯಶಸ್ವಿಯಾಗಿ ಪರಿಶೀಲಿಸಲಾಗಿದೆ!';

  @override
  String balanceResponse(Object amount) {
    return 'ನಿಮ್ಮ ಪ್ರಸ್ತುತ ಬ್ಯಾಲೆನ್ಸ್ $amount ರೂಪಾಯಿಗಳು.';
  }

  @override
  String get failedIntent => 'ಕ್ಷಮಿಸಿ, ನಾನು ಅದನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಲಿಲ್ಲ.';

  @override
  String get recTxns => 'ಸದ್ಯದ ವಹಿವಾಟುಗಳು';

  @override
  String get curBalance => 'ಲಭ್ಯವಿರುವ ಬ್ಯಾಲೆನ್ಸ್';

  @override
  String get msgNoTransactionFound => 'ಯಾವುದೇ ವಹಿವಾಟುಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String get logout => 'ಲಾಗ್ ಔಟ್';

  @override
  String get logoutConfirm => 'ನೀವು ಖಚಿತವಾಗಿ ಲಾಗ್ ಔಟ್ ಮಾಡಲು ಬಯಸುತ್ತೀರಾ?';

  @override
  String get logoutSuccess => 'ಯಶಸ್ವಿಯಾಗಿ ಲಾಗ್ ಔಟ್ ಆಗಿದೆ!';

  @override
  String get welcomeBack => 'ಮತ್ತೆ ಸ್ವಾಗತ! ಸ್ವಾಗತ';

  @override
  String get voiceBankingDashboard => 'ನಿಮ್ಮ ವಾಯ್ಸ್ ಬ್ಯಾಂಕಿಂಗ್ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್';

  @override
  String get availableBalance => 'ಲಭ್ಯವಿರುವ ಬ್ಯಾಲೆನ್ಸ್';

  @override
  String get viewAll => 'ಎಲ್ಲವನ್ನೂ ನೋಡಿ';

  @override
  String get voice => 'ವಾಯ್ಸ್';

  @override
  String get stop => 'ನಿಲ್ಲಿಸಿ';

  @override
  String get cancel => 'ರದ್ದುಗೊಳಿಸಿ';

  @override
  String get stopVoiceBankingConfirm => 'ವಾಯ್ಸ್ ಬ್ಯಾಂಕಿಂಗ್ ನಿಲ್ಲಿಸುವುದೇ? ಎಲ್ಲಾ ಪ್ರಸ್ತುತ ವಾಯ್ಸ್ ಚಟುವಟಿಕೆ ರದ್ದುಗೊಳಿಸಲಾಗುತ್ತದೆ.';

  @override
  String get welcomeTo => 'ಸ್ವಾಗತ';

  @override
  String get experienceBanking => 'ವಾಯ್ಸ್‌ನ ಶಕ್ತಿಯಿಂದ ಬ್ಯಾಂಕಿಂಗ್ ಅನುಭವಿಸಿ';

  @override
  String get enterMobileNumber => 'ಮೊಬೈಲ್ ಸಂಖ್ಯೆ ನಮೂದಿಸಿ';

  @override
  String get weWillSendOtp => 'ನಿಮ್ಮ ಸಂಖ್ಯೆಯನ್ನು ಪರಿಶೀಲಿಸಲು ನಾವು ನಿಮಗೆ OTP ಕಳುಹಿಸುತ್ತೇವೆ';

  @override
  String get mobileNumber => 'ಮೊಬೈಲ್ ಸಂಖ್ಯೆ';

  @override
  String get enterYourMobileNumber => 'ನಿಮ್ಮ 10-ಅಂಕಿಯ ಮೊಬೈಲ್ ಸಂಖ್ಯೆ ನಮೂದಿಸಿ';

  @override
  String get sendOtp => 'OTP ಕಳುಹಿಸಿ';

  @override
  String get pleaseEnterValidMobile => 'ದಯವಿಟ್ಟು ಮಾನ್ಯವಾದ 10-ಅಂಕಿಯ ಮೊಬೈಲ್ ಸಂಖ್ಯೆ ನಮೂದಿಸಿ';

  @override
  String get verifyYourPhone => 'ನಿಮ್ಮ ಫೋನ್ ಪರಿಶೀಲಿಸಿ';

  @override
  String get weHaveSentCode => 'ನಾವು ನಿಮ್ಮ ಫೋನ್‌ಗೆ 6-ಅಂಕಿಯ ಕೋಡ್ ಕಳುಹಿಸಿದ್ದೇವೆ';

  @override
  String get enterVerificationCode => 'ಪರಿಶೀಲನೆ ಕೋಡ್ ನಮೂದಿಸಿ';

  @override
  String get enterSixDigitCode => 'ನಿಮ್ಮ ಫೋನ್‌ಗೆ ಕಳುಹಿಸಲಾದ 6-ಅಂಕಿಯ ಕೋಡ್ ನಮೂದಿಸಿ';

  @override
  String get verifyOtp => 'OTP ಪರಿಶೀಲಿಸಿ';

  @override
  String get didntReceiveCode => 'ಕೋಡ್ ಸಿಕ್ಕಿಲ್ಲ? ';

  @override
  String resendIn(Object seconds) {
    return '$seconds ಸೆಕೆಂಡುಗಳಲ್ಲಿ ಮತ್ತೆ ಕಳುಹಿಸಿ';
  }

  @override
  String get resendOtp => 'OTP ಮತ್ತೆ ಕಳುಹಿಸಿ';

  @override
  String get otpValidFor => 'ನಿಮ್ಮ OTP 5 ನಿಮಿಷಗಳವರೆಗೆ ಮಾನ್ಯವಾಗಿದೆ ಮತ್ತು ಒಮ್ಮೆ ಮಾತ್ರ ಬಳಸಬಹುದು.';

  @override
  String get secureVerification => 'AI ನಿಂದ ಚಾಲಿತ ಸುರಕ್ಷಿತ ಪರಿಶೀಲನೆ';

  @override
  String get otpVerifiedSuccessfully => '✅ OTP ಯಶಸ್ವಿಯಾಗಿ ಪರಿಶೀಲಿಸಲಾಗಿದೆ!';

  @override
  String get invalidOtp => '❌ ಅಮಾನ್ಯ OTP, ದಯವಿಟ್ಟು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String newOtpSent(Object mobileNumber) {
    return ' ಹೊಸ OTP $mobileNumber ಗೆ ಕಳುಹಿಸಲಾಗಿದೆ';
  }

  @override
  String get pleaseEnterOtp => 'ದಯವಿಟ್ಟು OTP ನಮೂದಿಸಿ';

  @override
  String get otpMustBeSixDigits => 'OTP 6 ಅಂಕೆಗಳಾಗಿರಬೇಕು';

  @override
  String get whyChooseVoiceBanking => 'ವಾಯ್ಸ್ ಬ್ಯಾಂಕಿಂಗ್ ಏಕೆ ಆರಿಸಿ?';

  @override
  String get voiceCommands => 'ವಾಯ್ಸ್ ಆಜ್ಞೆಗಳು';

  @override
  String get controlWithVoice => 'ನಿಮ್ಮ ವಾಯ್ಸ್‌ನಿಂದ ನಿಯಂತ್ರಿಸಿ';

  @override
  String get secure => 'ಸುರಕ್ಷಿತ';

  @override
  String get bankGradeSecurity => 'ಬ್ಯಾಂಕ್-ಗ್ರೇಡ್ ಸುರಕ್ಷತೆ';

  @override
  String get multiLanguage => 'ಬಹುಭಾಷಾ';

  @override
  String get supportForLanguages => '10+ ಭಾಷೆಗಳಿಗೆ ಬೆಂಬಲ';

  @override
  String get fast => 'ವೇಗವಾದ';

  @override
  String get quickTransactions => 'ತ್ವರಿತ ವಹಿವಾಟುಗಳು';

  @override
  String get poweredByAI => 'AI ತಂತ್ರಜ್ಞಾನದಿಂದ ಚಾಲಿತ';

  @override
  String get paymentInitiated => 'ಪಾವತಿ ಪ್ರಾರಂಭಿಸಲಾಗಿದೆ ಪಾವತಿ ಪ್ರಾರಂಭಿಸಲಾಗಿದೆ';

  @override
  String get viewAllTransactions => 'ಎಲ್ಲಾ ವಹಿವಾಟುಗಳನ್ನು ನೋಡಿ';

  @override
  String get aiIsSpeaking => 'AI ಮಾತನಾಡುತ್ತಿದೆ…';

  @override
  String get validationRequired => 'ಈ ಕ್ಷೇತ್ರ ಅಗತ್ಯವಾಗಿದೆ';

  @override
  String get validationEmail => 'ದಯವಿಟ್ಟು ಮಾನ್ಯವಾದ ಇಮೇಲ್ ನಮೂದಿಸಿ';

  @override
  String get validationPhone => 'ದಯವಿಟ್ಟು ಮಾನ್ಯವಾದ ಫೋನ್ ಸಂಖ್ಯೆ ನಮೂದಿಸಿ';

  @override
  String get validationOtp => 'ದಯವಿಟ್ಟು ಮಾನ್ಯವಾದ OTP ನಮೂದಿಸಿ';

  @override
  String get allTransactions => 'ಎಲ್ಲಾ ವಹಿವಾಟುಗಳು';

  @override
  String get transactions => 'ವಹಿವಾಟುಗಳು';

  @override
  String get loading => 'ಲೋಡ್ ಆಗುತ್ತಿದೆ...';

  @override
  String get errorLoadingTransactions => 'ವಹಿವಾಟುಗಳನ್ನು ಲೋಡ್ ಮಾಡುವಲ್ಲಿ ದೋಷ';

  @override
  String get retry => 'ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get noTransactionsFound => 'ಯಾವುದೇ ವಹಿವಾಟುಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get noTransactionsDescription => 'ನಿಮ್ಮಲ್ಲಿ ಇನ್ನೂ ಯಾವುದೇ ವಹಿವಾಟುಗಳು ಇಲ್ಲ';

  @override
  String get faq => 'ಆಗಾಗ್ಗೆ ಕೇಳಲಾಗುವ ಪ್ರಶ್ನೆಗಳು';

  @override
  String get frequentlyAskedQuestions => 'ಆಗಾಗ್ಗೆ ಕೇಳಲಾಗುವ ಪ್ರಶ್ನೆಗಳು';

  @override
  String get learnHowToUseVoiceBanking => 'ವಾಯ್ಸ್ ಬ್ಯಾಂಕಿಂಗ್ ಅನ್ನು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ಬಳಸುವುದು ಹೇಗೆಂದು ತಿಳಿಯಿರಿ';

  @override
  String get whatToSpeak => 'ಏನು ಮಾತನಾಡಬೇಕು';

  @override
  String get whatToSpeakDescription => 'ಉದಾಹರಣೆಗೆ, ನೀವು ನನ್ನ ಪ್ರಸ್ತುತ ಬ್ಯಾಲೆನ್ಸ್ ಎಷ್ಟು ಎಂದು ಕೇಳಬಹುದು';

  @override
  String get howToCheckTransactions => 'ವಹಿವಾಟುಗಳನ್ನು ಹೇಗೆ ಪರಿಶೀಲಿಸುವುದು';

  @override
  String get howToCheckTransactionsDescription => 'ನೀವು ನನ್ನ ಕೊನೆಯ x ವಹಿವಾಟುಗಳು ಯಾವುವು ಎಂದು ಕೇಳಬಹುದು';

  @override
  String get voiceCommandsDescription => 'ಸ್ಪಷ್ಟವಾಗಿ ಮತ್ತು ನೈಸರ್ಗಿಕವಾಗಿ ಮಾತನಾಡಿ. ವ್ಯವಸ್ಥೆಯು ಸಂಭಾಷಣೆಯ ಭಾಷೆಯನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುತ್ತದೆ.';

  @override
  String get supportedLanguages => 'ಬೆಂಬಲಿತ ಭಾಷೆಗಳು';

  @override
  String get supportedLanguagesDescription => 'ಪ್ರಸ್ತುತ ಇಂಗ್ಲಿಷ್, ಹಿಂದಿ, ಬಂಗಾಳಿ, ಗುಜರಾತಿ, ಕನ್ನಡ, ಮಲಯಾಳಂ, ಮರಾಠಿ, ಪಂಜಾಬಿ, ತಮಿಳು ಮತ್ತು ತೆಲುಗು ಭಾಷೆಗಳಿಗೆ ಬೆಂಬಲ ನೀಡುತ್ತದೆ.';

  @override
  String get privacySecurity => 'ಗೌಪ್ಯತೆ ಮತ್ತು ಸುರಕ್ಷತೆ';

  @override
  String get privacySecurityDescription => 'ನಿಮ್ಮ ವಾಯ್ಸ್ ಡೇಟಾವನ್ನು ಸುರಕ್ಷಿತವಾಗಿ ಪ್ರಕ್ರಿಯೆಗೊಳಿಸಲಾಗುತ್ತದೆ ಮತ್ತು ಶಾಶ್ವತವಾಗಿ ಸಂಗ್ರಹಿಸಲಾಗುವುದಿಲ್ಲ.';

  @override
  String get proTips => 'ವೃತ್ತಿಪರ ಸಲಹೆಗಳು';

  @override
  String get tipQuietEnvironment => 'ಉತ್ತಮ ಗುರುತಿಸುವಿಕೆಗಾಗಿ ಶಾಂತ ವಾತಾವರಣದಲ್ಲಿ ಮಾತನಾಡಿ';

  @override
  String get tipNaturalLanguage => 'ನೈಸರ್ಗಿಕ ಭಾಷೆಯನ್ನು ಬಳಸಿ ಉದಾಹರಣೆಗೆ \"ನನ್ನ ಬ್ಯಾಲೆನ್ಸ್ ತೋರಿಸಿ\"';

  @override
  String get tipWaitForIndicator => 'ಮಾತನಾಡುವ ಮೊದಲು ಕೇಳುವ ಸೂಚಕಕ್ಕಾಗಿ ಕಾಯಿರಿ';

  @override
  String get needMoreHelp => 'ಹೆಚ್ಚು ಸಹಾಯ ಬೇಕೇ?';

  @override
  String get contactSupportDescription => 'ಹೆಚ್ಚುವರಿ ಸಹಾಯಕ್ಕಾಗಿ ನಮ್ಮ ಬೆಂಬಲ ತಂಡವನ್ನು ಸಂಪರ್ಕಿಸಿ';

  @override
  String balanceSuccess(Object amount) {
    return 'ನಿಮ್ಮ ಪ್ರಸ್ತುತ ಬ್ಯಾಲೆನ್ಸ್ $amount ರೂಪಾಯಿ.';
  }

  @override
  String transactionsFound(Object count) {
    return 'ಇಲ್ಲಿ ನಿಮ್ಮ $count ಇತ್ತೀಚಿನ ಲಾವಾದೇವಿಗಳು.';
  }

  @override
  String get noTransactions => 'ಯಾವುದೇ ಲಾವಾದೇವಿಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String transferSuccess(Object amount, Object recipient) {
    return '$recipientಗೆ $amount ರೂಪಾಯಿ ವರ್ಗಾವಣೆ ಯಶಸ್ವಿಯಾಗಿ ಪ್ರಾರಂಭವಾಗಿದೆ.';
  }

  @override
  String get transferFailed => 'ವರ್ಗಾವಣೆ ವಿಫಲವಾಯಿತು. ದಯವಿಟ್ಟು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get errorGeneric => 'ಕ್ಷಮಿಸಿ, ದೋಷ ಸಂಭವಿಸಿದೆ. ದಯವಿಟ್ಟು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get errorInsufficientFunds => 'ಸಾಕಷ್ಟು ನಿಧಿ ಇಲ್ಲ. ದಯವಿಟ್ಟು ನಿಮ್ಮ ಬ್ಯಾಲೆನ್ಸ್ ಪರಿಶೀಲಿಸಿ.';

  @override
  String get pleaseSaySomething => 'ದಯವಿಟ್ಟು ಏನಾದರೂ ಹೇಳಿ';

  @override
  String get voiceRegistration => 'ಧ್ವನಿ ನೋಂದಣಿ';

  @override
  String get pleaseWaitForUpload => 'ದಯವಿಟ್ಟು ಅಪ್‌ಲೋಡ್ ಪೂರ್ಣಗೊಳ್ಳಲು ನಿರೀಕ್ಷಿಸಿ';

  @override
  String get voiceRegistrationCompleted => 'ಧ್ವನಿ ನೋಂದಣಿ ಯಶಸ್ವಿಯಾಗಿ ಪೂರ್ಣಗೊಂಡಿದೆ!';

  @override
  String get unknownState => 'ಅಜ್ಞಾತ ಸ್ಥಿತಿ';

  @override
  String get uploadingVoiceRecordings => 'ಧ್ವನಿ ರೆಕಾರ್ಡಿಂಗ್‌ಗಳನ್ನು ಅಪ್‌ಲೋಡ್ ಮಾಡಲಾಗುತ್ತಿದೆ...';

  @override
  String imageNumber(Object number) {
    return 'ಚಿತ್ರ $number';
  }

  @override
  String get somethingWentWrong => 'ಏನೋ ತಪ್ಪಾಗಿದೆ';

  @override
  String get imageNotAvailable => 'ಚಿತ್ರ ಲಭ್ಯವಿಲ್ಲ';

  @override
  String stepOfTotal(Object current, Object total) {
    return 'ಹಂತ $current ನ $total';
  }

  @override
  String describeImageInstruction(Object seconds) {
    return 'ದಯವಿಟ್ಟು ಈ ಚಿತ್ರದಲ್ಲಿ ನೀವು ನೋಡುವುದನ್ನು $seconds ಸೆಕೆಂಡುಗಳಲ್ಲಿ ವಿವರಿಸಿ। ಸ್ಪಷ್ಟವಾಗಿ ಮಾತನಾಡಿ ಮತ್ತು ಮುಖ್ಯ ಅಂಶಗಳನ್ನು ವಿವರಿಸಿ।';
  }

  @override
  String get stopRecording => 'ರೆಕಾರ್ಡಿಂಗ್ ನಿಲ್ಲಿಸಿ';

  @override
  String get reRecord => 'ಮತ್ತೆ ರೆಕಾರ್ಡ್ ಮಾಡಿ';

  @override
  String get startRecording => 'ರೆಕಾರ್ಡಿಂಗ್ ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get recording => 'ರೆಕಾರ್ಡ್ ಆಗುತ್ತಿದೆ...';

  @override
  String get stopDescription => 'ವಿವರಣೆ ನಿಲ್ಲಿಸಿ';

  @override
  String get playDescription => 'ವಿವರಣೆ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get nextStep => 'ಮುಂದಿನ ಹಂತ';

  @override
  String get register => 'ನೋಂದಣಿ ಮಾಡಿ';

  @override
  String get pleaseWaitForDescription => 'ದಯವಿಟ್ಟು ವಿವರಣೆ ಮುಗಿಯಲು ನಿರೀಕ್ಷಿಸಿ।';

  @override
  String get microphonePermissionRequired => 'ಮೈಕ್ರೋಫೋನ್ ಅನುಮತಿ ಅಗತ್ಯವಿದೆ। ದಯವಿಟ್ಟು ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಅದನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ।';

  @override
  String failedToStartRecording(Object error) {
    return 'ರೆಕಾರ್ಡಿಂಗ್ ಪ್ರಾರಂಭಿಸಲು ವಿಫಲ: $error';
  }

  @override
  String get recordingFailed => 'ರೆಕಾರ್ಡಿಂಗ್ ವಿಫಲವಾಗಿದೆ। ದಯವಿಟ್ಟು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ।';

  @override
  String get recordingFileNotFound => 'ರೆಕಾರ್ಡಿಂಗ್ ಫೈಲ್ ಕಂಡುಬಂದಿಲ್ಲ। ದಯವಿಟ್ಟು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ।';

  @override
  String get recordingEmpty => 'ರೆಕಾರ್ಡಿಂಗ್ ಖಾಲಿಯಾಗಿದೆ। ದಯವಿಟ್ಟು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ।';

  @override
  String pleaseSpeakAtLeastSeconds(Object seconds) {
    return 'ದಯವಿಟ್ಟು ಕನಿಷ್ಠ $seconds ಸೆಕೆಂಡುಗಳ ಕಾಲ ಮಾತನಾಡಿ।';
  }

  @override
  String failedToStopRecording(Object error) {
    return 'ರೆಕಾರ್ಡಿಂಗ್ ನಿಲ್ಲಿಸಲು ವಿಫಲ: $error';
  }

  @override
  String get pleaseStopRecordingBeforePlay => 'ದಯವಿಟ್ಟು ವಿವರಣೆ ಪ್ಲೇ ಮಾಡುವ ಮೊದಲು ರೆಕಾರ್ಡಿಂಗ್ ನಿಲ್ಲಿಸಿ।';

  @override
  String failedToPlayDescription(Object error) {
    return 'ವಿವರಣೆ ಪ್ಲೇ ಮಾಡಲು ವಿಫಲ: $error';
  }

  @override
  String failedToStopDescription(Object error) {
    return 'ವಿವರಣೆ ನಿಲ್ಲಿಸಲು ವಿಫಲ: $error';
  }

  @override
  String get pleaseRecordBeforeProceeding => 'ದಯವಿಟ್ಟು ಮುಂದುವರಿಯುವ ಮೊದಲು ನಿಮ್ಮ ಧ್ವನಿಯನ್ನು ರೆಕಾರ್ಡ್ ಮಾಡಿ।';

  @override
  String get pleaseWaitForRecordingOrDescription => 'ದಯವಿಟ್ಟು ರೆಕಾರ್ಡಿಂಗ್ ಅಥವಾ ವಿವರಣೆ ಪೂರ್ಣಗೊಳ್ಳಲು ನಿರೀಕ್ಷಿಸಿ।';

  @override
  String get pleaseCompleteAllRecordings => 'ದಯವಿಟ್ಟು ಸಲ್ಲಿಸುವ ಮೊದಲು ಎಲ್ಲಾ 3 ರೆಕಾರ್ಡಿಂಗ್‌ಗಳನ್ನು ಪೂರ್ಣಗೊಳಿಸಿ।';

  @override
  String get userIdNotFound => 'ಬಳಕೆದಾರ ID ಕಂಡುಬಂದಿಲ್ಲ। ದಯವಿಟ್ಟು ಮತ್ತೆ ಲಾಗ್ ಇನ್ ಮಾಡಿ।';

  @override
  String get recordingFilesMissing => 'ಒಂದು ಅಥವಾ ಹೆಚ್ಚು ರೆಕಾರ್ಡಿಂಗ್ ಫೈಲ್‌ಗಳು ಕಾಣೆಯಾಗಿವೆ।';

  @override
  String get imageDescriptionBoardMeeting => 'ಒಬ್ಬ ವೃತ್ತಿಪರ ವ್ಯಕ್ತಿ ನಗರದ ದೃಶ್ಯಾವಳಿಯನ್ನು ನೋಡುವ ಆಧುನಿಕ, ಬಿಸಿಲು ತುಂಬಿದ ಕಛೇರಿ ಬೋರ್ಡ್‌ರೂಮ್‌ನಲ್ಲಿ ಸಹೋದ್ಯೋಗಿಗಳಿಗೆ ಡೇಟಾ ಪ್ರಸ್ತುತಿ ನೀಡುತ್ತಿದ್ದಾನೆ.';

  @override
  String get imageDescriptionBoyWithDog => 'ಕನ್ನಡಕ ಧರಿಸಿದ ಹುಡುಗ ಸೂರ್ಯನ ಬೆಳಕಿನ ಪಾರ್ಕ್ ಪಥದಲ್ಲಿ ಹಸ್ಕಿ ನಾಯಿಯನ್ನು ನಡೆಸುತ್ತಾ ಪಟ್ಟು ಹಿಡಿದುಕೊಂಡು ನಗುತ್ತಾನೆ.';

  @override
  String get imageDescriptionChildrenPainting => 'ಐದು ಮಕ್ಕಳು ದೊಡ್ಡ ಕಿಟಕಿಯ ಬಳಿ ಕಾರ್ಪೆಟ್‌ನಲ್ಲಿ ಕುಳಿತು ಪ್ರಕಾಶಮಾನವಾದ ಲಿವಿಂಗ್ ರೂಮ್‌ನಲ್ಲಿ ಒಟ್ಟಿಗೆ ಬಣ್ಣದ ಚಿತ್ರಗಳನ್ನು ಸಂತೋಷದಿಂದ ಚಿತ್ರಿಸುತ್ತಿದ್ದಾರೆ.';

  @override
  String get imageDescriptionChildrenWithDog => 'ನಾಲ್ಕು ಮಕ್ಕಳು ಹಸಿರು ತೋಟದಲ್ಲಿ ಎರಡು ನಾಯಿಗಳೊಂದಿಗೆ ಸಂತೋಷದಿಂದ ಆಡುತ್ತಿದ್ದಾರೆ, ಪ್ರಕಾಶಮಾನವಾದ ಮಧ್ಯಾಹ್ನದಲ್ಲಿ ಫ್ರಿಸ್ಬಿ ಎಸೆಯುತ್ತಿದ್ದಾರೆ.';

  @override
  String get imageDescriptionConstructionSite => 'ನಾಲ್ಕು ನಿರ್ಮಾಣ ವೃತ್ತಿಪರರು ಸುರಕ್ಷತಾ ವೆಸ್ಟ್‌ಗಳು ಮತ್ತು ಹಾರ್ಡ್ ಹ್ಯಾಟ್‌ಗಳನ್ನು ಧರಿಸಿ ಧೂಳು ತುಂಬಿದ ಸೈಟ್‌ನಲ್ಲಿ ದೊಡ್ಡ ವಾಸ್ತುಶಿಲ್ಪ ಕಟ್ಟಡ ನೀಲನಕ್ಷೆಯನ್ನು ಎಚ್ಚರಿಕೆಯಿಂದ ಪರಿಶೀಲಿಸುತ್ತಿದ್ದಾರೆ.';

  @override
  String get imageDescriptionFamilyDinner => 'ನಾಲ್ಕು ಸದಸ್ಯರ ಸಂತೋಷಕರ ಕುಟುಂಬವು ರೆಸ್ಟೋರೆಂಟ್‌ನಲ್ಲಿ ಸಾಂಪ್ರದಾಯಿಕ ಭಾರತೀಯ ಊಟವನ್ನು ಆಸ್ವಾದಿಸುತ್ತಿದೆ, ಬೆಚ್ಚಗಿನ ವಾತಾವರಣದಲ್ಲಿ ಆಹಾರ ಮತ್ತು ನಗು ಹಂಚಿಕೊಳ್ಳುತ್ತಿದೆ.';

  @override
  String get imageDescriptionHoliCelebration => 'ಕುಟುಂಬ ಮತ್ತು ಸ್ನೇಹಿತರ ಸಂತೋಷಕರ ಗುಂಪು ಹೋಳಿ ಆಚರಿಸುತ್ತಿದೆ, ಗಾಳಿಯಲ್ಲಿ ಬಣ್ಣದ ಪುಡಿಯ ಉತ್ಸಾಹಭರಿತ ಸ್ಫೋಟದ ನಡುವೆ ಒಟ್ಟಿಗೆ ನಗುತ್ತಿದೆ.';

  @override
  String get imageDescriptionLadyPainting => 'ಒಬ್ಬ ಯುವತಿ ತನ್ನ ಸೂರ್ಯನ ಬೆಳಕಿನ, ಆರಾಮದಾಯಕ ಮನೆ ಕಲಾ ಸ್ಟುಡಿಯೋದಲ್ಲಿ ಕ್ಯಾನ್ವಾಸ್‌ನಲ್ಲಿ ಸುಂದರ ಹಳದಿ ಭೂದೃಶ್ಯವನ್ನು ಚಿತ್ರಿಸಲು ಕೇಂದ್ರೀಕರಿಸಿದ್ದಾಳೆ.';

  @override
  String get imageDescriptionMomAndSon => 'ಒಬ್ಬ ತಾಯಿ ತನ್ನ ಚಿಕ್ಕ ಮಗುವಿಗೆ ಸ್ಟೋವ್‌ನಲ್ಲಿ ಅಡುಗೆ ಮಾಡಲು ಸಹಾಯ ಮಾಡುತ್ತಿದ್ದಾಳೆ, ಪ್ರಕಾಶಮಾನವಾದ ಆಧುನಿಕ ಬಿಳಿ ಅಡುಗೆಮನೆಯಲ್ಲಿ ಮರದ ಸ್ಟೂಲ್‌ನಲ್ಲಿ ನಿಂತುಕೊಂಡು.';

  @override
  String get imageDescriptionPeopleDiwaliCelebration => 'ಸಾಂಪ್ರದಾಯಿಕ ಉಡುಪು ಧರಿಸಿದ ಜನರು ಅಲಂಕೃತ ಬೀದಿಯಲ್ಲಿ ದೀಪಾವಳಿ ಆಚರಿಸುತ್ತಿದ್ದಾರೆ, ಜೀವಂತ ದೀಪಗಳು, ಜ್ವಲಿಸುವ ದೀಪಗಳು ಮತ್ತು ಮೇಲೆ ಅದ್ಭುತ ಫಿರಂಗಿ ಪ್ರದರ್ಶನದೊಂದಿಗೆ.';

  @override
  String get imageDescriptionTajMahal => 'ಡೆನಿಮ್ ಜಾಕೆಟ್ ಧರಿಸಿದ ಯುವ ಸ್ನೇಹಿತರ ಗುಂಪು ಛಾವಣಿಯ ಮೇಲೆ ನಿಂತಿದೆ, ಕಾಫಿ ಹಿಡಿದುಕೊಂಡು ಹಿಂದೆ ತಾಜ್ ಮಹಲ್‌ನೊಂದಿಗೆ ನಗುತ್ತಿದೆ.';

  @override
  String get imageDescriptionVillageScene => 'ಒಬ್ಬ ವೃದ್ಧ ರೈತ ಸುವರ್ಣ ಸೂರ್ಯಾಸ್ತದ ಸಮಯದಲ್ಲಿ ದೊಡ್ಡ ಬೆಳೆ ಸಾಗಿಸುವ ಮರದ ಎತ್ತುಗಾಡಿಯ ಮೇಲೆ ಕುಳಿತಿದ್ದಾನೆ, ಎರಡು ಬಿಳಿ ಎತ್ತುಗಳು ಎಳೆಯುತ್ತಿವೆ.';

  @override
  String get imageDescriptionWomenDiwaliCelebration => 'ಗುಲಾಬಿ ಸಾಂಪ್ರದಾಯಿಕ ಉಡುಪು ಧರಿಸಿದ ಮಹಿಳೆ ಜ್ವಲಿಸುವ ತೈಲ ದೀಪಗಳಿಂದ ಸುತ್ತುವರೆದ ನೆಲದ ಮೇಲೆ ಸುಂದರವಾದ ಬಣ್ಣದ ರಂಗೋಲಿಯನ್ನು ಎಚ್ಚರಿಕೆಯಿಂದ ರಚಿಸುತ್ತಿದ್ದಾಳೆ.';

  @override
  String get skip => 'ಬಿಟ್ಟುಬಿಡಿ';

  @override
  String get registerVoice => 'ಧ್ವನಿ ನೋಂದಣಿ ಮಾಡಿ';

  @override
  String get unregisterVoice => 'ಧ್ವನಿ ನೋಂದಣಿ ರದ್ದುಗೊಳಿಸಿ';

  @override
  String get resetVoice => 'ಧ್ವನಿ ಮರುಹೊಂದಿಸಿ';

  @override
  String get resetVoiceConfirm => 'ಇದು ನಿಮ್ಮ ಧ್ವನಿ ಪ್ರೊಫೈಲ್ ಅನ್ನು ಅಳಿಸುತ್ತದೆ. ನೀವು ಮತ್ತೆ ಧ್ವನಿ ನೋಂದಣಿ ಪೂರ್ಣಗೊಳಿಸಬೇಕು. ಮುಂದುವರಿಸುವುದೇ?';

  @override
  String get resetVoiceSuccess => 'ಧ್ವನಿ ಯಶಸ್ವಿಯಾಗಿ ಮರುಹೊಂದಿಸಲಾಗಿದೆ. ದಯವಿಟ್ಟು ಮತ್ತೆ ನೋಂದಣಿ ಪೂರ್ಣಗೊಳಿಸಿ.';

  @override
  String get resetVoiceError => 'ಧ್ವನಿ ಮರುಹೊಂದಿಸಲು ವಿಫಲವಾಗಿದೆ. ದಯವಿಟ್ಟು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get audioStorageConsentTitle => 'ಆಡಿಯೋ ಸಂಗ್ರಹಣೆ ಒಪ್ಪಿಗೆ';

  @override
  String get audioStorageConsentMessage => 'ಧ್ವನಿ ಬ್ಯಾಂಕಿಂಗ್ ಬಳಸಲು, ದೃಢೀಕರಣ ಮತ್ತು ಪ್ರಕ್ರಿಯೆಗಾಗಿ ನಿಮ್ಮ ಧ್ವನಿ ರೆಕಾರ್ಡಿಂಗ್‌ಗಳನ್ನು ನಮ್ಮ ವ್ಯವಸ್ಥೆಯಲ್ಲಿ ಶೇಖರಿಸಬೇಕಾಗುತ್ತದೆ. ನಿಮ್ಮ ಆಡಿಯೋವನ್ನು ನಮ್ಮೊಂದಿಗೆ ಶೇಖರಿಸಲು ನೀವು ಒಪ್ಪುತ್ತೀರಾ?';

  @override
  String get acceptConsent => 'ನಾನು ಒಪ್ಪುತ್ತೇನೆ';

  @override
  String get declineConsent => 'ನಾನು ನಿರಾಕರಿಸುತ್ತೇನೆ';
}
