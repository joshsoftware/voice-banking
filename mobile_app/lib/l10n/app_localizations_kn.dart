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
  String get describeImageInstruction => 'ದಯವಿಟ್ಟು ಈ ಚಿತ್ರದಲ್ಲಿ ನೀವು ನೋಡುವುದನ್ನು ವಿವರಿಸಿ। ಸ್ಪಷ್ಟವಾಗಿ ಮಾತನಾಡಿ ಮತ್ತು ಮುಖ್ಯ ಅಂಶಗಳನ್ನು ವಿವರಿಸಿ।';

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
  String get imageDescriptionCooking => 'ಒಬ್ಬ ಮಹಿಳೆ ಸ್ಟೋವ್‌ನಲ್ಲಿ ಒಂದು ಪಾತ್ರೆಯಲ್ಲಿ ಏನನ್ನಾದರೂ ಕದಲಿಸುತ್ತಿದ್ದಾಳೆ, ಪಕ್ಕದಲ್ಲಿ ಒಬ್ಬ ಪುರುಷ ಒಂದು ಮಿಕ್ಸಿಂಗ್ ಬೌಲ್ ಹಿಡಿದು ನಿಂತಿದ್ದಾನೆ। ಅವರು ಒಟ್ಟಿಗೆ ಅಡುಗೆಮನೆಯಲ್ಲಿ ಆಹಾರ ತಯಾರಿಸುತ್ತಿದ್ದಾರೆ ಎಂದು ತೋರುತ್ತದೆ। ದೃಶ್ಯವು ಬೆಚ್ಚಗಿನ ಮರ್ತ್ತು ಸಹಕಾರಿ ತೋರುತ್ತದೆ।';

  @override
  String get imageDescriptionLaptop => 'ಒಬ್ಬ ಯುವತಿ ಒಂದು ಡೆಸ್ಕ್‌ನಲ್ಲಿ ಕುಳಿತು ತನ್ನ ಲ್ಯಾಪ್‌ಟಾಪ್‌ನಲ್ಲಿ ಕೆಲಸ ಮಾಡುತ್ತಿದ್ದಾಳೆ। ಮೇಜಿನ ಮೇಲೆ ಪುಸ್ತಕಗಳು ಮರ್ತ್ತು ಒಂದು ಕಾಫಿ ಕಪ್ ಇದೆ, ಮರ್ತ್ತು ಕೊಠಡಿಯ ಸುತ್ತಲೂ ಹಲವಾರು ಸಸ್ಯಗಳನ್ನು ಇಡಲಾಗಿದೆ। ಸ್ಥಳವು ಆರಾಮದಾಯಕ ಮರ್ತ್ತು ಮನೆಯಿಂದ ಕೆಲಸ ಮಾಡಲು ಸೂಕ್ತವಾಗಿ ಕಾಣುತ್ತದೆ।';

  @override
  String get imageDescriptionCoffee => 'ಮೂರು ಜನರು ಒಂದು ಆರಾಮದಾಯಕ ಕೆಫೆಯಲ್ಲಿ ಸಣ್ಣ ಮೇಜುಗಳ ಮೇಲೆ ಕುಳಿತಿದ್ದಾರೆ। ಅವರಲ್ಲಿ ಇಬ್ಬರು ಚಹಾ ಮರ್ತ್ತು ಕೇಕ್ ತಿನ್ನುತ್ತಾ ಮಾತನಾಡುತ್ತಿದ್ದಾರೆ, ಮರ್ತ್ತು ಇನ್ನೊಬ್ಬ ಮಹಿಳೆ ಹತ್ತಿರ ಕುಳಿತು ಒಂದು ಬೆಕ್ಕನ್ನು ಹಿಡಿದಿದ್ದಾಳೆ। ನೆಲದ ಮೇಲೆ ಒಂದು ನಾಯಿ ಮಲಗಿದೆ, ಮರ್ತ್ತು ವಾತಾವರಣವು ಶಾಂತ ಮರ್ತ್ತು ಸ್ನೇಹಪೂರ್ಣವಾಗಿ ಕಾಣುತ್ತದೆ।';

  @override
  String get imageDescriptionConstruction => 'ಮೂರು ನಿರ್ಮಾಣ ಕಾರ್ಮಿಕರು ಹೆಲ್ಮೆಟ್‌ಗಳನ್ನು ಧರಿಸಿ ಒಂದು ಕಟ್ಟಡ ಯೋಜನೆಯನ್ನು ಚರ್ಚಿಸುತ್ತಿದ್ದಾರೆ। ಒಬ್ಬ ವ್ಯಕ್ತಿ ಬೋರ್ಡ್‌ನಲ್ಲಿ ಪ್ರದರ್ಶಿಸಲಾದ ದೊಡ್ಡ ಬ್ಲೂಪ್ರಿಂಟ್‌ನತ್ತ ಸೂಚಿಸುತ್ತಿದ್ದಾನೆ। ತಂಡವು ಒಂದು ನಿರ್ಮಾಣ ಯೋಜನೆಯನ್ನು ಯೋಜಿಸುತ್ತಿದೆ ಅಥವಾ ವಿಮರ್ಶಿಸುತ್ತಿದೆ ಎಂದು ತೋರುತ್ತದೆ।';

  @override
  String get imageDescriptionCrossing => 'ಒಬ್ಬ ಯುವಕ ಒಬ್ಬ ವೃದ್ಧ ಮಹಿಳೆಗೆ ಪಾದಚಾರಿ ಕ್ರಾಸಿಂಗ್‌ನಲ್ಲಿ ರಸ್ತೆ ದಾಟಲು ಸಹಾಯ ಮಾಡುತ್ತಿದ್ದಾನೆ। ಹತ್ತಿರದಲ್ಲಿ ಟ್ರಾಫಿಕ್ ಸಿಗ್ನಲ್‌ಗಳು ಮರ್ತ್ತು ಒಂದು ಕಾರು ಕಾಯುತ್ತಿದೆ। ದೃಶ್ಯವು ನಗರದ ವಾತಾವರಣದಲ್ಲಿ ದಯೆ ಮರ್ತ್ತು ಸುರಕ್ಷತೆಯನ್ನು ತೋರಿಸುತ್ತದೆ।';
}
