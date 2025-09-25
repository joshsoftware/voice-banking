// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'लिंगो वॉइस बैंकिंग';

  @override
  String get loginPrompt => 'अपना मोबाइल नंबर दर्ज करें';

  @override
  String get otpPrompt => 'ओटीपी दर्ज करें';

  @override
  String get micHint => 'बोलने के लिए माइक दबाएँ';

  @override
  String get listening => 'सुन रहा हूँ...';

  @override
  String get transcribing => 'लिख रहा हूँ...';

  @override
  String get executing => 'आपका अनुरोध संसाधित हो रहा है...';

  @override
  String get otpSuccess => 'OTP सफलतापूर्वक सत्यापित!';

  @override
  String balanceResponse(Object amount) {
    return 'आपका मौजूदा बैलेंस $amount रुपये है।';
  }

  @override
  String get failedIntent => 'क्षमा करें, मुझे यह समझ में नहीं आया।';

  @override
  String get recTxns => 'हाल के लेन-देन';

  @override
  String get curBalance => 'वर्तमान शेष राशि';

  @override
  String get msgNoTransactionFound => 'कोई लेन-देन नहीं मिला।';

  @override
  String get logout => 'लॉगआउट';

  @override
  String get logoutConfirm => 'क्या आप वाकई लॉगआउट करना चाहते हैं?';

  @override
  String get logoutSuccess => 'सफलतापूर्वक लॉगआउट हो गए!';

  @override
  String get welcomeBack => 'वापस स्वागत है! 👋';

  @override
  String get voiceBankingDashboard => 'आपका वॉइस बैंकिंग डैशबोर्ड';

  @override
  String get availableBalance => 'उपलब्ध शेष राशि';

  @override
  String get viewAll => 'सभी देखें';

  @override
  String get voice => 'वॉइस';

  @override
  String get stop => 'रोकें';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get welcomeTo => 'स्वागत है';

  @override
  String get experienceBanking => 'वॉइस की शक्ति से बैंकिंग का अनुभव करें';

  @override
  String get enterMobileNumber => 'मोबाइल नंबर दर्ज करें';

  @override
  String get weWillSendOtp => 'आपके नंबर को सत्यापित करने के लिए हम आपको एक OTP भेजेंगे';

  @override
  String get mobileNumber => 'मोबाइल नंबर';

  @override
  String get enterYourMobileNumber => 'अपना 10-अंकीय मोबाइल नंबर दर्ज करें';

  @override
  String get sendOtp => 'OTP भेजें';

  @override
  String get pleaseEnterValidMobile => 'कृपया एक वैध 10-अंकीय मोबाइल नंबर दर्ज करें';

  @override
  String get verifyYourPhone => 'अपना फोन सत्यापित करें';

  @override
  String get weHaveSentCode => 'हमने आपके फोन पर 6-अंकीय कोड भेजा है';

  @override
  String get enterVerificationCode => 'सत्यापन कोड दर्ज करें';

  @override
  String get enterSixDigitCode => 'अपने फोन पर भेजे गए 6-अंकीय कोड को दर्ज करें';

  @override
  String get verifyOtp => 'OTP सत्यापित करें';

  @override
  String get didntReceiveCode => 'कोड नहीं मिला? ';

  @override
  String resendIn(Object seconds) {
    return '$seconds सेकंड में पुनः भेजें';
  }

  @override
  String get resendOtp => 'OTP पुनः भेजें';

  @override
  String get otpValidFor => 'आपका OTP 5 मिनट के लिए वैध है और केवल एक बार उपयोग किया जा सकता है।';

  @override
  String get secureVerification => 'AI द्वारा संचालित सुरक्षित सत्यापन';

  @override
  String get otpVerifiedSuccessfully => '✅ OTP सफलतापूर्वक सत्यापित!';

  @override
  String get invalidOtp => '❌ अमान्य OTP, कृपया पुनः प्रयास करें';

  @override
  String newOtpSent(Object mobileNumber) {
    return ' नया OTP $mobileNumber पर भेजा गया';
  }

  @override
  String get pleaseEnterOtp => 'कृपया OTP दर्ज करें';

  @override
  String get otpMustBeSixDigits => 'OTP 6 अंकों का होना चाहिए';

  @override
  String get whyChooseVoiceBanking => 'वॉइस बैंकिंग क्यों चुनें?';

  @override
  String get voiceCommands => 'वॉइस कमांड';

  @override
  String get controlWithVoice => 'अपनी आवाज़ से नियंत्रित करें';

  @override
  String get secure => 'सुरक्षित';

  @override
  String get bankGradeSecurity => 'बैंक-ग्रेड सुरक्षा';

  @override
  String get multiLanguage => 'बहुभाषी';

  @override
  String get supportForLanguages => '10+ भाषाओं का समर्थन';

  @override
  String get fast => 'तेज़';

  @override
  String get quickTransactions => 'त्वरित लेन-देन';

  @override
  String get poweredByAI => 'AI तकनीक द्वारा संचालित';

  @override
  String get paymentInitiated => 'भुगतान शुरू किया गया 🚀';

  @override
  String get viewAllTransactions => 'सभी लेन-देन देखें';

  @override
  String get aiIsSpeaking => 'AI बोल रहा है…';

  @override
  String get validationRequired => 'यह फ़ील्ड आवश्यक है';

  @override
  String get validationEmail => 'कृपया एक वैध ईमेल दर्ज करें';

  @override
  String get validationPhone => 'कृपया एक वैध फोन नंबर दर्ज करें';

  @override
  String get validationOtp => 'कृपया एक वैध OTP दर्ज करें';

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
