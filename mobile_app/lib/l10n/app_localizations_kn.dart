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
  String get allTransactions => 'All Transactions';

  @override
  String get transactions => 'transactions';

  @override
  String get loading => 'Loading...';

  @override
  String get errorLoadingTransactions => 'Error loading transactions';

  @override
  String get retry => 'Retry';

  @override
  String get noTransactionsFound => 'No transactions found';

  @override
  String get noTransactionsDescription => 'You don\'t have any transactions yet';
}
