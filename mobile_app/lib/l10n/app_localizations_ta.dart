// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'லிங்கோ வொய்ஸ் வங்கிப்பணி';

  @override
  String get loginPrompt => 'உங்கள் கைபேசி எண்ணை உள்ளிடவும்';

  @override
  String get otpPrompt => 'OTP ஐ உள்ளிடவும்';

  @override
  String get micHint => 'பேச மைக் அழுத்தவும்';

  @override
  String get listening => 'கேட்கிறேன்...';

  @override
  String get transcribing => 'எழுதுகிறேன்...';

  @override
  String get executing => 'உங்கள் கோரிக்கை செயலாக்கப்படுகிறது...';

  @override
  String get otpSuccess => 'OTP வெற்றிகரமாக சரிபார்க்கப்பட்டது!';

  @override
  String balanceResponse(Object amount) {
    return 'உங்களின் தற்போதைய இருப்பு $amount ரூபாய்.';
  }

  @override
  String get failedIntent => 'மன்னிக்கவும், எனக்கு அது புரியவில்லை.';

  @override
  String get recTxns => 'சமீபத்திய பரிவர்த்தனைகள்';

  @override
  String get curBalance => 'நடப்பு இருப்பு';

  @override
  String get msgNoTransactionFound => 'No transactions found.';

  @override
  String get logout => 'Logout';

  @override
  String get logoutConfirm => 'Are you sure you want to logout?';

  @override
  String get logoutSuccess => 'Logged out successfully!';

  @override
  String get welcomeBack => 'Welcome back! 👋';

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
}
