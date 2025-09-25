// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'लिंगो व्हॉइस बँकिंग';

  @override
  String get loginPrompt => 'आपला मोबाइल नंबर प्रविष्ट करा';

  @override
  String get otpPrompt => 'OTP प्रविष्ट करा';

  @override
  String get micHint => 'बोलण्यासाठी माइक टॅप करा';

  @override
  String get listening => 'ऐकत आहे...';

  @override
  String get transcribing => 'लिहित आहे...';

  @override
  String get executing => 'आपली विनंती प्रक्रिया करत आहे...';

  @override
  String get otpSuccess => 'OTP यशस्वीरित्या सत्यापित!';

  @override
  String balanceResponse(Object amount) {
    return 'आपला सध्याचा बॅलन्स $amount रुपये आहे.';
  }

  @override
  String get failedIntent => 'माफ करा, मला ते समजले नाही.';

  @override
  String get recTxns => 'अलीकडील व्यवहार';

  @override
  String get curBalance => 'उपलब्ध बॅलन्स';

  @override
  String get msgNoTransactionFound => 'कोणतेही व्यवहार सापडले नाहीत.';

  @override
  String get logout => 'लॉग आउट';

  @override
  String get logoutConfirm => 'तुम्हाला खरोखर लॉग आउट करायचे आहे?';

  @override
  String get logoutSuccess => 'यशस्वीरित्या लॉग आउट झाले!';

  @override
  String get welcomeBack => 'पुन्हा स्वागत! 👋';

  @override
  String get voiceBankingDashboard => 'तुमचे व्हॉइस बँकिंग डॅशबोर्ड';

  @override
  String get availableBalance => 'उपलब्ध बॅलन्स';

  @override
  String get viewAll => 'सर्व पहा';

  @override
  String get voice => 'व्हॉइस';

  @override
  String get stop => 'थांबवा';

  @override
  String get cancel => 'रद्द करा';

  @override
  String get welcomeTo => 'स्वागत';

  @override
  String get experienceBanking => 'व्हॉइसच्या शक्तीने बँकिंगचा अनुभव घ्या';

  @override
  String get enterMobileNumber => 'मोबाइल नंबर प्रविष्ट करा';

  @override
  String get weWillSendOtp => 'तुमचा नंबर सत्यापित करण्यासाठी आम्ही तुम्हाला OTP पाठवू';

  @override
  String get mobileNumber => 'मोबाइल नंबर';

  @override
  String get enterYourMobileNumber => 'तुमचा 10-अंकी मोबाइल नंबर प्रविष्ट करा';

  @override
  String get sendOtp => 'OTP पाठवा';

  @override
  String get pleaseEnterValidMobile => 'कृपया वैध 10-अंकी मोबाइल नंबर प्रविष्ट करा';

  @override
  String get verifyYourPhone => 'तुमचा फोन सत्यापित करा';

  @override
  String get weHaveSentCode => 'आम्ही तुमच्या फोनवर 6-अंकी कोड पाठवला आहे';

  @override
  String get enterVerificationCode => 'सत्यापन कोड प्रविष्ट करा';

  @override
  String get enterSixDigitCode => 'तुमच्या फोनवर पाठवलेला 6-अंकी कोड प्रविष्ट करा';

  @override
  String get verifyOtp => 'OTP सत्यापित करा';

  @override
  String get didntReceiveCode => 'कोड मिळाला नाही? ';

  @override
  String resendIn(Object seconds) {
    return '$seconds सेकंदात पुन्हा पाठवा';
  }

  @override
  String get resendOtp => 'OTP पुन्हा पाठवा';

  @override
  String get otpValidFor => 'तुमचा OTP 5 मिनिटांसाठी वैध आहे आणि फक्त एकदाच वापरला जाऊ शकतो.';

  @override
  String get secureVerification => 'AI द्वारे चालविलेले सुरक्षित सत्यापन';

  @override
  String get otpVerifiedSuccessfully => '✅ OTP यशस्वीरित्या सत्यापित!';

  @override
  String get invalidOtp => '❌ अवैध OTP, कृपया पुन्हा प्रयत्न करा';

  @override
  String newOtpSent(Object mobileNumber) {
    return ' नवीन OTP $mobileNumber वर पाठवला';
  }

  @override
  String get pleaseEnterOtp => 'कृपया OTP प्रविष्ट करा';

  @override
  String get otpMustBeSixDigits => 'OTP 6 अंकांचा असावा';

  @override
  String get whyChooseVoiceBanking => 'व्हॉइस बँकिंग का निवडा?';

  @override
  String get voiceCommands => 'व्हॉइस कमांड';

  @override
  String get controlWithVoice => 'तुमच्या व्हॉइसने नियंत्रित करा';

  @override
  String get secure => 'सुरक्षित';

  @override
  String get bankGradeSecurity => 'बँक-ग्रेड सुरक्षा';

  @override
  String get multiLanguage => 'बहुभाषी';

  @override
  String get supportForLanguages => '10+ भाषांचे समर्थन';

  @override
  String get fast => 'वेगवान';

  @override
  String get quickTransactions => 'द्रुत व्यवहार';

  @override
  String get poweredByAI => 'AI तंत्रज्ञानाने चालविलेले';

  @override
  String get paymentInitiated => 'पेमेंट सुरू केले 🚀';

  @override
  String get viewAllTransactions => 'सर्व व्यवहार पहा';

  @override
  String get aiIsSpeaking => 'AI बोलत आहे…';

  @override
  String get validationRequired => 'हे फील्ड आवश्यक आहे';

  @override
  String get validationEmail => 'कृपया वैध ईमेल प्रविष्ट करा';

  @override
  String get validationPhone => 'कृपया वैध फोन नंबर प्रविष्ट करा';

  @override
  String get validationOtp => 'कृपया वैध OTP प्रविष्ट करा';

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
