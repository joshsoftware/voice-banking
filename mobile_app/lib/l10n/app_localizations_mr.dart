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
  String get allTransactions => 'सर्व व्यवहार';

  @override
  String get transactions => 'व्यवहार';

  @override
  String get loading => 'लोड होत आहे...';

  @override
  String get errorLoadingTransactions => 'व्यवहार लोड करताना त्रुटी';

  @override
  String get retry => 'पुन्हा प्रयत्न करा';

  @override
  String get noTransactionsFound => 'कोणतेही व्यवहार सापडले नाहीत';

  @override
  String get noTransactionsDescription => 'तुमच्याकडे अद्याप कोणतेही व्यवहार नाहीत';

  @override
  String get faq => 'नेहमी विचारले जाणारे प्रश्न';

  @override
  String get frequentlyAskedQuestions => 'नेहमी विचारले जाणारे प्रश्न';

  @override
  String get learnHowToUseVoiceBanking => 'व्हॉइस बँकिंगचा प्रभावी वापर कसा करावा हे शिका';

  @override
  String get whatToSpeak => 'काय बोलावे';

  @override
  String get whatToSpeakDescription => 'उदाहरणार्थ, तुम्ही माझा सध्याचा बॅलन्स किती आहे असे विचारू शकता';

  @override
  String get howToCheckTransactions => 'व्यवहार कसे तपासावे';

  @override
  String get howToCheckTransactionsDescription => 'तुम्ही माझे शेवटचे x व्यवहार काय आहेत असे विचारू शकता';

  @override
  String get voiceCommandsDescription => 'स्पष्ट आणि नैसर्गिकरित्या बोला. सिस्टम संभाषणाची भाषा समजते.';

  @override
  String get supportedLanguages => 'समर्थित भाषा';

  @override
  String get supportedLanguagesDescription => 'सध्या इंग्रजी, हिंदी, बंगाली, गुजराती, कन्नड, मलयाळम, मराठी, पंजाबी, तमिळ आणि तेलुगू भाषांना समर्थन देते.';

  @override
  String get privacySecurity => 'गोपनीयता आणि सुरक्षा';

  @override
  String get privacySecurityDescription => 'तुमचा व्हॉइस डेटा सुरक्षितपणे प्रक्रिया केला जातो आणि कायमस्वरूपी संग्रहित केला जात नाही.';

  @override
  String get proTips => 'व्यावसायिक सल्ले';

  @override
  String get tipQuietEnvironment => 'चांगल्या ओळखीसाठी शांत वातावरणात बोला';

  @override
  String get tipNaturalLanguage => 'नैसर्गिक भाषा वापरा जसे की \"माझा बॅलन्स दाखवा\"';

  @override
  String get tipWaitForIndicator => 'बोलण्यापूर्वी ऐकण्याच्या सूचकाची वाट पहा';

  @override
  String get needMoreHelp => 'अधिक मदत हवी?';

  @override
  String get contactSupportDescription => 'अतिरिक्त सहाय्यासाठी आमच्या सहाय्य टीमशी संपर्क साधा';

  @override
  String balanceSuccess(Object amount) {
    return 'तुमचा सध्याचा बॅलन्स $amount रुपये आहे।';
  }

  @override
  String transactionsFound(Object count) {
    return 'येथे तुमचे $count सर्वात अलीकडील व्यवहार आहेत।';
  }

  @override
  String get noTransactions => 'कोणतेही व्यवहार सापडले नाहीत।';

  @override
  String transferSuccess(Object amount, Object recipient) {
    return '$recipient ला $amount रुपयांचे स्थानांतरण यशस्वीरित्या सुरू केले गेले आहे।';
  }

  @override
  String get transferFailed => 'स्थानांतरण अयशस्वी। कृपया पुन्हा प्रयत्न करा।';

  @override
  String get errorGeneric => 'माफ करा, मला एक त्रुटी आली आहे। कृपया पुन्हा प्रयत्न करा।';

  @override
  String get errorInsufficientFunds => 'अपुरे निधी। कृपया तुमचा बॅलन्स तपासा।';

  @override
  String otpNotification(Object otp) {
    return 'लिंगो व्हॉइस बँकिंग OTP: $otp';
  }

  @override
  String get loginFailed => 'लॉगिन अयशस्वी';

  @override
  String networkError(Object error) {
    return 'नेटवर्क त्रुटी: $error';
  }

  @override
  String verificationFailed(Object error) {
    return 'सत्यापन अयशस्वी: $error';
  }

  @override
  String resendInSeconds(Object seconds) {
    return '$seconds सेकंदात पुन्हा पाठवा';
  }

  @override
  String resendOtpFailed(Object message) {
    return 'OTP पुन्हा पाठवण्यात अयशस्वी: $message';
  }

  @override
  String get transactionDetails => 'व्यवहार तपशील';

  @override
  String sessionId(Object sessionId) {
    return 'सत्र ID: $sessionId...';
  }

  @override
  String get close => 'बंद करा';

  @override
  String get debit => 'डेबिट';

  @override
  String get credit => 'क्रेडिट';

  @override
  String get mobileNumberNotFound => 'मोबाइल नंबर सापडला नाही। कृपया पुन्हा लॉगिन करा।';

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
