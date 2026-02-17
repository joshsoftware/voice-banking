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
  String get tapToSpeak => 'ਬੋਲਣ ਲਈ ਟੈਪ ਕਰੋ';

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
  String get stopVoiceBankingConfirm => 'ਵੌਇਸ ਬੈਂਕਿੰਗ ਰੋਕੋ? ਸਾਰੀ ਮੌਜੂਦਾ ਵੌਇਸ ਗਤੀਵਿਧੀ ਰੱਦ ਹੋ ਜਾਵੇਗੀ।';

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
  String get noTransactions => 'ਕੋਈ ਲੈਣ-ਦੇਣ ਨਹੀਂ ਮਿਲੀ।';

  @override
  String transferSuccess(Object amount, Object recipient) {
    return '$recipient ਨੂੰ $amount ਰੁਪਏ ਦਾ ਟ੍ਰਾਂਸਫਰ ਸਫਲਤਾਪੂਰਵਕ ਸ਼ੁਰੂ ਕੀਤਾ ਗਿਆ ਹੈ।';
  }

  @override
  String get transferFailed => 'ਟ੍ਰਾਂਸਫਰ ਅਸਫਲ। ਕ੍ਰਿਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get errorGeneric => 'ਮਾਫ਼ ਕਰੋ, ਗਲਤੀ ਆਈ। ਕ੍ਰਿਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get errorInsufficientFunds => 'ਅਪੂਰਨ ਫੰਡ। ਕ੍ਰਿਪਾ ਕਰਕੇ ਆਪਣਾ ਬੈਲੇਂਸ ਜਾਂਚੋ।';

  @override
  String get pleaseSaySomething => 'ਕ੍ਰਿਪਾ ਕਰਕੇ ਕੁਝ ਕਹੋ';

  @override
  String get voiceRegistration => 'ਵੌਇਸ ਰਜਿਸਟ੍ਰੇਸ਼ਨ';

  @override
  String get pleaseWaitForUpload => 'ਕਿਰਪਾ ਕਰਕੇ ਅਪਲੋਡ ਪੂਰਾ ਹੋਣ ਦਾ ਇੰਤਜ਼ਾਰ ਕਰੋ';

  @override
  String get voiceRegistrationCompleted => 'ਵੌਇਸ ਰਜਿਸਟ੍ਰੇਸ਼ਨ ਸਫਲਤਾਪੂਰਵਕ ਪੂਰੀ ਹੋ ਗਈ!';

  @override
  String get unknownState => 'ਅਣਜਾਣ ਸਥਿਤੀ';

  @override
  String get uploadingVoiceRecordings => 'ਵੌਇਸ ਰਿਕਾਰਡਿੰਗਾਂ ਅਪਲੋਡ ਹੋ ਰਹੀਆਂ ਹਨ...';

  @override
  String imageNumber(Object number) {
    return 'ਚਿੱਤਰ $number';
  }

  @override
  String get somethingWentWrong => 'ਕੁਝ ਗਲਤ ਹੋ ਗਿਆ';

  @override
  String get imageNotAvailable => 'ਚਿੱਤਰ ਉਪਲਬਧ ਨਹੀਂ ਹੈ';

  @override
  String stepOfTotal(Object current, Object total) {
    return 'ਕਦਮ $current ਦਾ $total';
  }

  @override
  String get describeImageInstruction => 'ਕਿਰਪਾ ਕਰਕੇ ਇਸ ਚਿੱਤਰ ਵਿੱਚ ਜੋ ਤੁਸੀਂ ਦੇਖ ਰਹੇ ਹੋ ਉਸਦਾ ਵਰਣਨ ਕਰੋ। ਸਪੱਸ਼ਟ ਤੌਰ \'ਤੇ ਬੋਲੋ ਅਤੇ ਮੁੱਖ ਤੱਤਾਂ ਦਾ ਵਰਣਨ ਕਰੋ।';

  @override
  String get stopRecording => 'ਰਿਕਾਰਡਿੰਗ ਰੋਕੋ';

  @override
  String get reRecord => 'ਦੁਬਾਰਾ ਰਿਕਾਰਡ ਕਰੋ';

  @override
  String get startRecording => 'ਰਿਕਾਰਡਿੰਗ ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get recording => 'ਰਿਕਾਰਡ ਹੋ ਰਿਹਾ ਹੈ...';

  @override
  String get stopDescription => 'ਵਰਣਨ ਰੋਕੋ';

  @override
  String get playDescription => 'ਵਰਣਨ ਚਲਾਓ';

  @override
  String get nextStep => 'ਅਗਲਾ ਕਦਮ';

  @override
  String get register => 'ਰਜਿਸਟਰ ਕਰੋ';

  @override
  String get pleaseWaitForDescription => 'ਕਿਰਪਾ ਕਰਕੇ ਵਰਣਨ ਪੂਰਾ ਹੋਣ ਦਾ ਇੰਤਜ਼ਾਰ ਕਰੋ।';

  @override
  String get microphonePermissionRequired => 'ਮਾਈਕ੍ਰੋਫੋਨ ਇਜਾਜ਼ਤ ਲੋੜੀਂਦੀ ਹੈ। ਕਿਰਪਾ ਕਰਕੇ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਇਸਨੂੰ ਸਮਰੱਥ ਕਰੋ।';

  @override
  String failedToStartRecording(Object error) {
    return 'ਰਿਕਾਰਡਿੰਗ ਸ਼ੁਰੂ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get recordingFailed => 'ਰਿਕਾਰਡਿੰਗ ਅਸਫਲ ਹੋ ਗਈ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get recordingFileNotFound => 'ਰਿਕਾਰਡਿੰਗ ਫਾਈਲ ਨਹੀਂ ਮਿਲੀ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get recordingEmpty => 'ਰਿਕਾਰਡਿੰਗ ਖਾਲੀ ਹੈ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String failedToStopRecording(Object error) {
    return 'ਰਿਕਾਰਡਿੰਗ ਰੋਕਣ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get pleaseStopRecordingBeforePlay => 'ਕਿਰਪਾ ਕਰਕੇ ਵਰਣਨ ਚਲਾਉਣ ਤੋਂ ਪਹਿਲਾਂ ਰਿਕਾਰਡਿੰਗ ਰੋਕੋ।';

  @override
  String failedToPlayDescription(Object error) {
    return 'ਵਰਣਨ ਚਲਾਉਣ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String failedToStopDescription(Object error) {
    return 'ਵਰਣਨ ਰੋਕਣ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get pleaseRecordBeforeProceeding => 'ਕਿਰਪਾ ਕਰਕੇ ਅੱਗੇ ਵਧਣ ਤੋਂ ਪਹਿਲਾਂ ਆਪਣੀ ਆਵਾਜ਼ ਰਿਕਾਰਡ ਕਰੋ।';

  @override
  String get pleaseWaitForRecordingOrDescription => 'ਕਿਰਪਾ ਕਰਕੇ ਰਿਕਾਰਡਿੰਗ ਜਾਂ ਵਰਣਨ ਪੂਰਾ ਹੋਣ ਦਾ ਇੰਤਜ਼ਾਰ ਕਰੋ।';

  @override
  String get pleaseCompleteAllRecordings => 'ਕਿਰਪਾ ਕਰਕੇ ਜਮ੍ਹਾ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਸਾਰੀਆਂ 3 ਰਿਕਾਰਡਿੰਗਾਂ ਪੂਰੀਆਂ ਕਰੋ।';

  @override
  String get userIdNotFound => 'ਯੂਜ਼ਰ ID ਨਹੀਂ ਮਿਲੀ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਲਾਗਇਨ ਕਰੋ।';

  @override
  String get recordingFilesMissing => 'ਇੱਕ ਜਾਂ ਵਧੇਰੇ ਰਿਕਾਰਡਿੰਗ ਫਾਈਲਾਂ ਗੁੰਮ ਹਨ।';

  @override
  String get imageDescriptionCooking => 'ਇੱਕ ਔਰਤ ਸਟੋਵ \'ਤੇ ਇੱਕ ਬਰਤਨ ਵਿੱਚ ਕੁਝ ਹਿਲਾ ਰਹੀ ਹੈ ਜਦੋਂ ਕਿ ਇੱਕ ਆਦਮੀ ਉਸਦੇ ਕੋਲ ਇੱਕ ਮਿਕਸਿੰਗ ਬਾਉਲ ਫੜ ਕੇ ਖੜ੍ਹਾ ਹੈ। ਲੱਗਦਾ ਹੈ ਕਿ ਉਹ ਇਕੱਠੇ ਰਸੋਈ ਵਿੱਚ ਖਾਣਾ ਤਿਆਰ ਕਰ ਰਹੇ ਹਨ। ਦ੍ਰਿਸ਼ ਗਰਮ ਅਤੇ ਸਹਿਯੋਗੀ ਲੱਗਦਾ ਹੈ।';

  @override
  String get imageDescriptionLaptop => 'ਇੱਕ ਜਵਾਨ ਔਰਤ ਇੱਕ ਡੈਸਕ \'ਤੇ ਬੈਠੀ ਆਪਣੇ ਲੈਪਟਾਪ \'ਤੇ ਕੰਮ ਕਰ ਰਹੀ ਹੈ। ਮੇਜ਼ \'ਤੇ ਕਿਤਾਬਾਂ ਅਤੇ ਇੱਕ ਕੌਫੀ ਕੱਪ ਹੈ, ਅਤੇ ਕਮਰੇ ਦੇ ਆਲੇ-ਦੁਆਲੇ ਕਈ ਪੌਦੇ ਰੱਖੇ ਗਏ ਹਨ। ਜਗ੍ਹਾ ਆਰਾਮਦਾਇਕ ਅਤੇ ਘਰ ਤੋਂ ਕੰਮ ਕਰਨ ਲਈ ਢੁਕਵੀਂ ਲੱਗਦੀ ਹੈ।';

  @override
  String get imageDescriptionCoffee => 'ਤਿੰਨ ਲੋਕ ਇੱਕ ਆਰਾਮਦਾਇਕ ਕੈਫੇ ਵਿੱਚ ਛੋਟੀਆਂ ਮੇਜ਼ਾਂ \'ਤੇ ਬੈਠੇ ਹਨ। ਉਨ੍ਹਾਂ ਵਿੱਚੋਂ ਦੋ ਚਾਹ ਅਤੇ ਕੇਕ ਖਾ ਰਹੇ ਹਨ ਅਤੇ ਗੱਲਾਂ ਕਰ ਰਹੇ ਹਨ, ਅਤੇ ਇੱਕ ਹੋਰ ਔਰਤ ਨੇੜੇ ਬੈਠੀ ਇੱਕ ਬਿੱਲੀ ਫੜੀ ਹੋਈ ਹੈ। ਫਰਸ਼ \'ਤੇ ਇੱਕ ਕੁੱਤਾ ਪਿਆ ਹੈ, ਅਤੇ ਮਾਹੌਲ ਸ਼ਾਂਤ ਅਤੇ ਦੋਸਤਾਨਾ ਲੱਗਦਾ ਹੈ।';

  @override
  String get imageDescriptionConstruction => 'ਤਿੰਨ ਨਿਰਮਾਣ ਮਜ਼ਦੂਰ ਹੈਲਮੈਟ ਪਹਿਨ ਕੇ ਇੱਕ ਇਮਾਰਤ ਦੀ ਯੋਜਨਾ \'ਤੇ ਚਰਚਾ ਕਰ ਰਹੇ ਹਨ। ਇੱਕ ਵਿਅਕਤੀ ਇੱਕ ਬੋਰਡ \'ਤੇ ਪ੍ਰਦਰਸ਼ਿਤ ਇੱਕ ਵੱਡੇ ਬਲੂਪ੍ਰਿੰਟ ਵੱਲ ਇਸ਼ਾਰਾ ਕਰ ਰਿਹਾ ਹੈ। ਟੀਮ ਇੱਕ ਨਿਰਮਾਣ ਪ੍ਰੋਜੈਕਟ ਦੀ ਯੋਜਨਾ ਬਣਾ ਰਹੀ ਹੈ ਜਾਂ ਸਮੀਖਿਆ ਕਰ ਰਹੀ ਹੈ।';

  @override
  String get imageDescriptionCrossing => 'ਇੱਕ ਜਵਾਨ ਆਦਮੀ ਇੱਕ ਬਜ਼ੁਰਗ ਔਰਤ ਦੀ ਮਦਦ ਕਰ ਰਿਹਾ ਹੈ ਇੱਕ ਪੈਦਲ ਯਾਤਰੀ ਕਰਾਸਿੰਗ \'ਤੇ ਸੜਕ ਪਾਰ ਕਰਨ ਵਿੱਚ। ਨੇੜੇ ਟ੍ਰੈਫਿਕ ਸਿਗਨਲ ਅਤੇ ਇੱਕ ਕਾਰ ਇੰਤਜ਼ਾਰ ਕਰ ਰਹੀ ਹੈ। ਦ੍ਰਿਸ਼ ਇੱਕ ਸ਼ਹਿਰੀ ਮਾਹੌਲ ਵਿੱਚ ਦਇਆ ਅਤੇ ਸੁਰੱਖਿਆ ਦਿਖਾਉਂਦਾ ਹੈ।';
}
