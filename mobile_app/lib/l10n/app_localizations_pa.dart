// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get appTitle => 'ਲਿੰਗੋ ਵੌਇਸ ਬੈਂਕਿੰਗ';

  @override
  String get loginPrompt => 'ਆਪਣਾ ਮੋਬਾਈਲ ਨੰਬਰ ਦਰਜ ਕਰੋ';

  @override
  String get otpPrompt => 'OTP ਦਰਜ ਕਰੋ';

  @override
  String get micHint => 'ਬੋਲਣ ਲਈ ਮਾਈਕ ਟੈਪ ਕਰੋ';

  @override
  String get listening => 'ਸੁਣ ਰਿਹਾ ਹੈ...';

  @override
  String get transcribing => 'ਲਿਖ ਰਿਹਾ ਹੈ...';

  @override
  String get executing => 'ਤੁਹਾਡੀ ਬੇਨਤੀ ਪ੍ਰਕਿਰਿਆ ਕੀਤੀ ਜਾ ਰਹੀ ਹੈ...';

  @override
  String get otpSuccess => 'OTP ਸਫਲਤਾਪੂਰਵਕ ਪੜਤਾਲ ਕੀਤਾ ਗਿਆ!';

  @override
  String balanceResponse(Object amount) {
    return 'ਤੁਹਾਡਾ ਮੌਜੂਦਾ ਬੈਲੇਂਸ $amount ਰੁਪਏ ਹੈ।';
  }

  @override
  String get failedIntent => 'ਮਾਫ ਕਰਨਾ, ਮੈਂ ਇਹ ਨਹੀਂ ਸਮਝਿਆ।';

  @override
  String get recTxns => 'ਹਾਲ ਹੀ ਦੇ ਲੈਣ-ਦੇਣ';

  @override
  String get curBalance => 'ਉਪਲਬਧ ਬੈਲੇਂਸ';

  @override
  String get msgNoTransactionFound => 'ਕੋਈ ਲੈਣ-ਦੇਣ ਨਹੀਂ ਮਿਲੇ।';

  @override
  String get logout => 'ਲੌਗ ਆਉਟ';

  @override
  String get logoutConfirm => 'ਕੀ ਤੁਸੀਂ ਸੱਚਮੁੱਚ ਲੌਗ ਆਉਟ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ?';

  @override
  String get logoutSuccess => 'ਸਫਲਤਾਪੂਰਵਕ ਲੌਗ ਆਉਟ ਹੋਇਆ!';

  @override
  String get welcomeBack => 'ਵਾਪਸ ਸਵਾਗਤ! 👋';

  @override
  String get voiceBankingDashboard => 'ਤੁਹਾਡਾ ਵੌਇਸ ਬੈਂਕਿੰਗ ਡੈਸ਼ਬੋਰਡ';

  @override
  String get availableBalance => 'ਉਪਲਬਧ ਬੈਲੇਂਸ';

  @override
  String get viewAll => 'ਸਭ ਦੇਖੋ';

  @override
  String get voice => 'ਵੌਇਸ';

  @override
  String get stop => 'ਰੋਕੋ';

  @override
  String get cancel => 'ਰੱਦ ਕਰੋ';

  @override
  String get welcomeTo => 'ਸਵਾਗਤ';

  @override
  String get experienceBanking => 'ਵੌਇਸ ਦੀ ਸ਼ਕਤੀ ਨਾਲ ਬੈਂਕਿੰਗ ਦਾ ਅਨੁਭਵ ਕਰੋ';

  @override
  String get enterMobileNumber => 'ਮੋਬਾਈਲ ਨੰਬਰ ਦਰਜ ਕਰੋ';

  @override
  String get weWillSendOtp => 'ਤੁਹਾਡੇ ਨੰਬਰ ਨੂੰ ਸਥਿਰ ਕਰਨ ਲਈ ਅਸੀਂ ਤੁਹਾਨੂੰ OTP ਭੇਜਾਂਗੇ';

  @override
  String get mobileNumber => 'ਮੋਬਾਈਲ ਨੰਬਰ';

  @override
  String get enterYourMobileNumber => 'ਆਪਣਾ 10-ਅੰਕੀ ਮੋਬਾਈਲ ਨੰਬਰ ਦਰਜ ਕਰੋ';

  @override
  String get sendOtp => 'OTP ਭੇਜੋ';

  @override
  String get pleaseEnterValidMobile => 'ਕਿਰਪਾ ਕਰਕੇ ਵੈਧ 10-ਅੰਕੀ ਮੋਬਾਈਲ ਨੰਬਰ ਦਰਜ ਕਰੋ';

  @override
  String get verifyYourPhone => 'ਆਪਣਾ ਫੋਨ ਸਥਿਰ ਕਰੋ';

  @override
  String get weHaveSentCode => 'ਅਸੀਂ ਤੁਹਾਡੇ ਫੋਨ \'ਤੇ 6-ਅੰਕੀ ਕੋਡ ਭੇਜਿਆ ਹੈ';

  @override
  String get enterVerificationCode => 'ਸਥਿਰਤਾ ਕੋਡ ਦਰਜ ਕਰੋ';

  @override
  String get enterSixDigitCode => 'ਆਪਣੇ ਫੋਨ \'ਤੇ ਭੇਜੇ ਗਏ 6-ਅੰਕੀ ਕੋਡ ਨੂੰ ਦਰਜ ਕਰੋ';

  @override
  String get verifyOtp => 'OTP ਸਥਿਰ ਕਰੋ';

  @override
  String get didntReceiveCode => 'ਕੋਡ ਨਹੀਂ ਮਿਲਿਆ? ';

  @override
  String resendIn(Object seconds) {
    return '$seconds ਸਕਿੰਟਾਂ ਵਿੱਚ ਦੁਬਾਰਾ ਭੇਜੋ';
  }

  @override
  String get resendOtp => 'OTP ਦੁਬਾਰਾ ਭੇਜੋ';

  @override
  String get otpValidFor => 'ਤੁਹਾਡਾ OTP 5 ਮਿੰਟਾਂ ਲਈ ਵੈਧ ਹੈ ਅਤੇ ਸਿਰਫ਼ ਇੱਕ ਵਾਰ ਵਰਤਿਆ ਜਾ ਸਕਦਾ ਹੈ।';

  @override
  String get secureVerification => 'AI ਦੁਆਰਾ ਚਲਾਇਆ ਗਿਆ ਸੁਰੱਖਿਤ ਸਥਿਰਤਾ';

  @override
  String get otpVerifiedSuccessfully => '✅ OTP ਸਫਲਤਾਪੂਰਵਕ ਸਥਿਰ!';

  @override
  String get invalidOtp => '❌ ਅਵੈਧ OTP, ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String newOtpSent(Object mobileNumber) {
    return ' ਨਵਾਂ OTP $mobileNumber \'ਤੇ ਭੇਜਿਆ ਗਿਆ';
  }

  @override
  String get pleaseEnterOtp => 'ਕਿਰਪਾ ਕਰਕੇ OTP ਦਰਜ ਕਰੋ';

  @override
  String get otpMustBeSixDigits => 'OTP 6 ਅੰਕਾਂ ਦਾ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ';

  @override
  String get whyChooseVoiceBanking => 'ਵੌਇਸ ਬੈਂਕਿੰਗ ਕਿਨੀਂ ਚੁਣੋ?';

  @override
  String get voiceCommands => 'ਵੌਇਸ ਕਮਾਂਡ';

  @override
  String get controlWithVoice => 'ਆਪਣੀ ਵੌਇਸ ਨਾਲ ਨਿਯੰਤਰਿਤ ਕਰੋ';

  @override
  String get secure => 'ਸੁਰੱਖਿਤ';

  @override
  String get bankGradeSecurity => 'ਬੈਂਕ-ਗ੍ਰੇਡ ਸੁਰੱਖਿਆ';

  @override
  String get multiLanguage => 'ਬਹੁਭਾਸ਼ੀ';

  @override
  String get supportForLanguages => '10+ ਭਾਸ਼ਾਵਾਂ ਦਾ ਸਮਰਥਨ';

  @override
  String get fast => 'ਤੇਜ਼';

  @override
  String get quickTransactions => 'ਤੇਜ਼ ਲੈਣ-ਦੇਣ';

  @override
  String get poweredByAI => 'AI ਤਕਨਾਲੋਜੀ ਦੁਆਰਾ ਚਲਾਇਆ ਗਿਆ';

  @override
  String get paymentInitiated => 'ਭੁਗਤਾਨ ਸ਼ੁਰੂ ਕੀਤਾ ਗਿਆ 🚀';

  @override
  String get viewAllTransactions => 'ਸਭ ਲੈਣ-ਦੇਣ ਦੇਖੋ';

  @override
  String get aiIsSpeaking => 'AI ਬੋਲ ਰਿਹਾ ਹੈ…';

  @override
  String get validationRequired => 'ਇਹ ਫੀਲਡ ਜ਼ਰੂਰੀ ਹੈ';

  @override
  String get validationEmail => 'ਕਿਰਪਾ ਕਰਕੇ ਵੈਧ ਈਮੇਲ ਦਰਜ ਕਰੋ';

  @override
  String get validationPhone => 'ਕਿਰਪਾ ਕਰਕੇ ਵੈਧ ਫੋਨ ਨੰਬਰ ਦਰਜ ਕਰੋ';

  @override
  String get validationOtp => 'ਕਿਰਪਾ ਕਰਕੇ ਵੈਧ OTP ਦਰਜ ਕਰੋ';

  @override
  String get allTransactions => 'ਸਭ ਲੈਣ-ਦੇਣ';

  @override
  String get transactions => 'ਲੈਣ-ਦੇਣ';

  @override
  String get loading => 'ਲੋਡ ਹੋ ਰਿਹਾ ਹੈ...';

  @override
  String get errorLoadingTransactions => 'ਲੈਣ-ਦੇਣ ਲੋਡ ਕਰਨ ਵਿੱਚ ਗਲਤੀ';

  @override
  String get retry => 'ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get noTransactionsFound => 'ਕੋਈ ਲੈਣ-ਦੇਣ ਨਹੀਂ ਮਿਲੇ';

  @override
  String get noTransactionsDescription => 'ਤੁਹਾਡੇ ਕੋਲ ਅਜੇ ਤੱਕ ਕੋਈ ਲੈਣ-ਦੇਣ ਨਹੀਂ ਹੈ';

  @override
  String get faq => 'ਅਕਸਰ ਪੁੱਛੇ ਜਾਣ ਵਾਲੇ ਸਵਾਲ';

  @override
  String get frequentlyAskedQuestions => 'ਅਕਸਰ ਪੁੱਛੇ ਜਾਣ ਵਾਲੇ ਸਵਾਲ';

  @override
  String get learnHowToUseVoiceBanking => 'ਵੌਇਸ ਬੈਂਕਿੰਗ ਦਾ ਪ੍ਰਭਾਵਸ਼ੀਲ ਉਪਯੋਗ ਕਿਵੇਂ ਕਰਨਾ ਹੈ ਸਿੱਖੋ';

  @override
  String get whatToSpeak => 'ਕੀ ਬੋਲਣਾ ਹੈ';

  @override
  String get whatToSpeakDescription => 'ਉਦਾਹਰਣ ਲਈ, ਤੁਸੀਂ ਪੁੱਛ ਸਕਦੇ ਹੋ ਕਿ ਮੇਰਾ ਮੌਜੂਦਾ ਬੈਲੇਂਸ ਕਿੰਨਾ ਹੈ';

  @override
  String get howToCheckTransactions => 'ਲੈਣ-ਦੇਣ ਕਿਵੇਂ ਚੈੱਕ ਕਰਨੇ';

  @override
  String get howToCheckTransactionsDescription => 'ਤੁਸੀਂ ਪੁੱਛ ਸਕਦੇ ਹੋ ਕਿ ਮੇਰੇ ਆਖਰੀ x ਲੈਣ-ਦੇਣ ਕੀ ਹਨ';

  @override
  String get voiceCommandsDescription => 'ਸਪਸ਼ਟ ਅਤੇ ਕੁਦਰਤੀ ਤਰ੍ਹਾਂ ਬੋਲੋ। ਸਿਸਟਮ ਗੱਲਬਾਤ ਦੀ ਭਾਸ਼ਾ ਸਮਝਦਾ ਹੈ।';

  @override
  String get supportedLanguages => 'ਸਮਰਥਿਤ ਭਾਸ਼ਾਵਾਂ';

  @override
  String get supportedLanguagesDescription => 'ਵਰਤਮਾਨ ਵਿੱਚ ਅੰਗਰੇਜ਼ੀ, ਹਿੰਦੀ, ਬੰਗਾਲੀ, ਗੁਜਰਾਤੀ, ਕੰਨੜ, ਮਲਿਆਲਮ, ਮਰਾਠੀ, ਪੰਜਾਬੀ, ਤਮਿਲ ਅਤੇ ਤੇਲਗੂ ਭਾਸ਼ਾਵਾਂ ਦਾ ਸਮਰਥਨ ਕਰਦਾ ਹੈ।';

  @override
  String get privacySecurity => 'ਗੁਪਤਤਾ ਅਤੇ ਸੁਰੱਖਿਆ';

  @override
  String get privacySecurityDescription => 'ਤੁਹਾਡਾ ਵੌਇਸ ਡੇਟਾ ਸੁਰੱਖਿਤ ਢੰਗ ਨਾਲ ਪ੍ਰਕਿਰਿਆ ਕੀਤਾ ਜਾਂਦਾ ਹੈ ਅਤੇ ਸਥਾਈ ਤੌਰ \'ਤੇ ਸਟੋਰ ਨਹੀਂ ਕੀਤਾ ਜਾਂਦਾ।';

  @override
  String get proTips => 'ਪ੍ਰੋਫੈਸ਼ਨਲ ਸੁਝਾਅ';

  @override
  String get tipQuietEnvironment => 'ਬਿਹਤਰ ਪਛਾਣ ਲਈ ਸ਼ਾਂਤ ਮਾਹੌਲ ਵਿੱਚ ਬੋਲੋ';

  @override
  String get tipNaturalLanguage => 'ਕੁਦਰਤੀ ਭਾਸ਼ਾ ਵਰਤੋ ਜਿਵੇਂ \"ਮੇਰਾ ਬੈਲੇਂਸ ਦਿਖਾਓ\"';

  @override
  String get tipWaitForIndicator => 'ਬੋਲਣ ਤੋਂ ਪਹਿਲਾਂ ਸੁਣਨ ਦੇ ਸੰਕੇਤਕ ਲਈ ਉਡੀਕ ਕਰੋ';

  @override
  String get needMoreHelp => 'ਹੋਰ ਮਦਦ ਚਾਹੀਦੀ ਹੈ?';

  @override
  String get contactSupportDescription => 'ਵਾਧੂ ਸਹਾਇਤਾ ਲਈ ਸਾਡੀ ਸਹਾਇਤਾ ਟੀਮ ਨਾਲ ਸੰਪਰਕ ਕਰੋ';

  @override
  String balanceSuccess(Object amount) {
    return 'ਤੁਹਾਡਾ ਮੌਜੂਦਾ ਬੈਲੇਂਸ $amount ਰੁਪਏ ਹੈ।';
  }

  @override
  String transactionsFound(Object count) {
    return 'ਇੱਥੇ ਤੁਹਾਡੇ $count ਸਭ ਤੋਂ ਹਾਲ ਹੀ ਦੇ ਲੈਣ-ਦੇਣ ਹਨ।';
  }

  @override
  String get noTransactions => 'ਕੋਈ ਲੈਣ-ਦੇਣ ਨਹੀਂ ਮਿਲੇ।';

  @override
  String transferSuccess(Object amount, Object recipient) {
    return '$recipient ਨੂੰ $amount ਰੁਪਏ ਦਾ ਟ੍ਰਾਂਸਫਰ ਸਫਲਤਾਪੂਰਵਕ ਸ਼ੁਰੂ ਕੀਤਾ ਗਿਆ ਹੈ।';
  }

  @override
  String get transferFailed => 'ਟ੍ਰਾਂਸਫਰ ਅਸਫਲ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get errorGeneric => 'ਮਾਫ ਕਰਨਾ, ਮੈਨੂੰ ਇੱਕ ਗਲਤੀ ਆਈ ਹੈ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get errorInsufficientFunds => 'ਅਪਰਿਆਪਤ ਫੰਡ। ਕਿਰਪਾ ਕਰਕੇ ਆਪਣਾ ਬੈਲੇਂਸ ਚੈੱਕ ਕਰੋ।';

  @override
  String otpNotification(Object otp) {
    return 'ਲਿੰਗੋ ਵੌਇਸ ਬੈਂਕਿੰਗ OTP: $otp';
  }

  @override
  String get loginFailed => 'ਲੌਗਿਨ ਅਸਫਲ';

  @override
  String networkError(Object error) {
    return 'ਨੈੱਟਵਰਕ ਗਲਤੀ: $error';
  }

  @override
  String verificationFailed(Object error) {
    return 'ਪੜਤਾਲ ਅਸਫਲ: $error';
  }

  @override
  String resendInSeconds(Object seconds) {
    return '$seconds ਸਕਿੰਟਾਂ ਵਿੱਚ ਦੁਬਾਰਾ ਭੇਜੋ';
  }

  @override
  String resendOtpFailed(Object message) {
    return 'OTP ਦੁਬਾਰਾ ਭੇਜਣ ਵਿੱਚ ਅਸਫਲ: $message';
  }

  @override
  String get transactionDetails => 'ਲੈਣ-ਦੇਣ ਦੇ ਵੇਰਵੇ';

  @override
  String sessionId(Object sessionId) {
    return 'ਸੈਸ਼ਨ ID: $sessionId...';
  }

  @override
  String get close => 'ਬੰਦ ਕਰੋ';

  @override
  String get debit => 'ਡੈਬਿਟ';

  @override
  String get credit => 'ਕ੍ਰੈਡਿਟ';

  @override
  String get mobileNumberNotFound => 'ਮੋਬਾਈਲ ਨੰਬਰ ਨਹੀਂ ਮਿਲਿਆ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਲੌਗਿਨ ਕਰੋ।';

  @override
  String get english => 'English';

  @override
  String get hindi => 'हिन्दी';

  @override
  String get tamil => 'தமிழ்';

  @override
  String get telugu => 'తెలుగు';

  @override
  String get bengali => 'বাংলা';

  @override
  String get gujarati => 'ગુજરાતી';

  @override
  String get malayalam => 'മലയാളം';

  @override
  String get marathi => 'मराठी';

  @override
  String get kannada => 'ಕನ್ನಡ';

  @override
  String get punjabi => 'ਪੰਜਾਬੀ';
}
