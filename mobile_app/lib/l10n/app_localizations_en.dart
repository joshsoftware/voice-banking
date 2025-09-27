// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Lingo Voice Banking';

  @override
  String get loginPrompt => 'Enter your mobile number';

  @override
  String get otpPrompt => 'Enter OTP';

  @override
  String get micHint => 'Tap the mic to speak';

  @override
  String get listening => 'Listening...';

  @override
  String get transcribing => 'Transcribing...';

  @override
  String get executing => 'Processing your request...';

  @override
  String get otpSuccess => 'OTP verified successfully!';

  @override
  String balanceResponse(Object amount) {
    return 'Your current balance is $amount rupees.';
  }

  @override
  String get failedIntent => 'Sorry, I didn\'t catch that.';

  @override
  String get recTxns => 'Recent transactions';

  @override
  String get curBalance => 'Available balance';

  @override
  String get msgNoTransactionFound => 'No transactions found.';

  @override
  String get logout => 'Logout';

  @override
  String get logoutConfirm => 'Are you sure you want to logout?';

  @override
  String get logoutSuccess => 'Logged out successfully!';

  @override
  String get welcomeBack => 'Welcome! ';

  @override
  String get voiceBankingDashboard => 'Your voice banking dashboard';

  @override
  String get availableBalance => 'Available Balance';

  @override
  String get viewAll => 'View All';

  @override
  String get voice => 'Voice';

  @override
  String get stop => 'Stop';

  @override
  String get cancel => 'Cancel';

  @override
  String get welcomeTo => 'Welcome to';

  @override
  String get experienceBanking => 'Experience banking with the power of voice';

  @override
  String get enterMobileNumber => 'Enter Mobile Number';

  @override
  String get weWillSendOtp => 'We\'ll send you an OTP to verify your number';

  @override
  String get mobileNumber => 'Mobile Number';

  @override
  String get enterYourMobileNumber => 'Enter your 10-digit mobile number';

  @override
  String get sendOtp => 'Send OTP';

  @override
  String get pleaseEnterValidMobile => 'Please enter a valid 10-digit mobile number';

  @override
  String get verifyYourPhone => 'Verify Your Phone';

  @override
  String get weHaveSentCode => 'We\'ve sent a 6-digit code to';

  @override
  String get enterVerificationCode => 'Enter Verification Code';

  @override
  String get enterSixDigitCode => 'Enter the 6-digit code sent to your phone';

  @override
  String get verifyOtp => 'Verify OTP';

  @override
  String get didntReceiveCode => 'Didn\'t receive the code? ';

  @override
  String resendIn(Object seconds) {
    return 'Resend in ${seconds}s';
  }

  @override
  String get resendOtp => 'Resend OTP';

  @override
  String get otpValidFor => 'Your OTP is valid for 5 minutes and can only be used once.';

  @override
  String get secureVerification => 'Secure verification powered by AI';

  @override
  String get otpVerifiedSuccessfully => '✅ OTP verified successfully!';

  @override
  String get invalidOtp => '❌ Invalid OTP, please try again';

  @override
  String newOtpSent(Object mobileNumber) {
    return ' New OTP sent to $mobileNumber';
  }

  @override
  String get pleaseEnterOtp => 'Please enter the OTP';

  @override
  String get otpMustBeSixDigits => 'OTP must be 6 digits';

  @override
  String get whyChooseVoiceBanking => 'Why Choose Voice Banking?';

  @override
  String get voiceCommands => 'Voice Commands';

  @override
  String get controlWithVoice => 'Control with your voice';

  @override
  String get secure => 'Secure';

  @override
  String get bankGradeSecurity => 'Bank-grade security';

  @override
  String get multiLanguage => 'Multi-language';

  @override
  String get supportForLanguages => 'Support for 10+ languages';

  @override
  String get fast => 'Fast';

  @override
  String get quickTransactions => 'Quick transactions';

  @override
  String get poweredByAI => 'Powered by AI Technology';

  @override
  String get paymentInitiated => 'Payment initiated 🚀';

  @override
  String get viewAllTransactions => 'View all transactions';

  @override
  String get aiIsSpeaking => 'AI is speaking…';

  @override
  String get validationRequired => 'This field is required';

  @override
  String get validationEmail => 'Please enter a valid email';

  @override
  String get validationPhone => 'Please enter a valid phone number';

  @override
  String get validationOtp => 'Please enter a valid OTP';

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

  @override
  String get faq => 'FAQ';

  @override
  String get frequentlyAskedQuestions => 'Frequently Asked Questions';

  @override
  String get learnHowToUseVoiceBanking => 'Learn how to use voice banking effectively';

  @override
  String get whatToSpeak => 'What to speak';

  @override
  String get whatToSpeakDescription => 'For example, You can ask what is my current balance';

  @override
  String get howToCheckTransactions => 'How to check transactions';

  @override
  String get howToCheckTransactionsDescription => 'You can ask what is my last x transactions';

  @override
  String get voiceCommandsDescription => 'Speak clearly and naturally. The system understands conversational language.';

  @override
  String get supportedLanguages => 'Supported Languages';

  @override
  String get supportedLanguagesDescription => 'Currently supports English, Hindi, Bengali, Gujarati, Kannada, Malayalam, Marathi, Punjabi, Tamil, and Telugu.';

  @override
  String get privacySecurity => 'Privacy & Security';

  @override
  String get privacySecurityDescription => 'Your voice data is processed securely and is not stored permanently.';

  @override
  String get proTips => 'Pro Tips';

  @override
  String get tipQuietEnvironment => 'Speak in a quiet environment for better recognition';

  @override
  String get tipNaturalLanguage => 'Use natural language like \"Show me my balance\"';

  @override
  String get tipWaitForIndicator => 'Wait for the listening indicator before speaking';

  @override
  String get needMoreHelp => 'Need More Help?';

  @override
  String get contactSupportDescription => 'Contact our support team for additional assistance';

  @override
  String balanceSuccess(Object amount) {
    return 'Your current balance is $amount rupees.';
  }

  @override
  String transactionsFound(Object count) {
    return 'Here are your $count most recent transactions.';
  }

  @override
  String get noTransactions => 'No transactions found.';

  @override
  String transferSuccess(Object amount, Object recipient) {
    return 'Transfer of $amount rupees to $recipient has been initiated successfully.';
  }

  @override
  String get transferFailed => 'Transfer failed. Please try again.';

  @override
  String get errorGeneric => 'Sorry, I encountered an error. Please try again.';

  @override
  String get errorInsufficientFunds => 'Insufficient funds. Please check your balance.';

  @override
  String otpNotification(Object otp) {
    return 'Lingo Voice Banking OTP: $otp';
  }

  @override
  String get loginFailed => 'Login failed';

  @override
  String networkError(Object error) {
    return 'Network error: $error';
  }

  @override
  String verificationFailed(Object error) {
    return 'Verification failed: $error';
  }

  @override
  String resendInSeconds(Object seconds) {
    return 'Resend in ${seconds}s';
  }

  @override
  String resendOtpFailed(Object message) {
    return 'Failed to resend OTP: $message';
  }

  @override
  String get transactionDetails => 'Transaction Details';

  @override
  String sessionId(Object sessionId) {
    return 'Session ID: $sessionId...';
  }

  @override
  String get close => 'Close';

  @override
  String get debit => 'Debit';

  @override
  String get credit => 'Credit';

  @override
  String get mobileNumberNotFound => 'Mobile number not found. Please login again.';

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
