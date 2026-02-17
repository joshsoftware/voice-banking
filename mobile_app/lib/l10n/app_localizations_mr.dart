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
  String get tapToSpeak => 'बोलण्यासाठी टॅप करा';

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
  String get stopVoiceBankingConfirm => 'व्हॉइस बँकिंग थांबवायचे? सर्व सध्याची व्हॉइस क्रिया रद्द होईल.';

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
    return 'तुमचे वर्तमान बॅलन्स $amount रुपये आहे.';
  }

  @override
  String transactionsFound(Object count) {
    return 'येथे तुमच्या $count अलीकडील व्यवहार आहेत.';
  }

  @override
  String get noTransactions => 'कोणतेही व्यवहार आढळले नाहीत.';

  @override
  String transferSuccess(Object amount, Object recipient) {
    return '$recipient ला $amount रुपये हस्तांतरण यशस्वीरित्या सुरू झाले.';
  }

  @override
  String get transferFailed => 'हस्तांतरण अयशस्वी. कृपया पुन्हा प्रयत्न करा.';

  @override
  String get errorGeneric => 'क्षमा करा, त्रुटी आली. कृपया पुन्हा प्रयत्न करा.';

  @override
  String get errorInsufficientFunds => 'अपुरे निधी. कृपया तुमचे बॅलन्स तपासा.';

  @override
  String get pleaseSaySomething => 'कृपया काहीतरी बोला';

  @override
  String get voiceRegistration => 'व्हॉइस नोंदणी';

  @override
  String get pleaseWaitForUpload => 'कृपया अपलोड पूर्ण होण्याची प्रतीक्षा करा';

  @override
  String get voiceRegistrationCompleted => 'व्हॉइस नोंदणी यशस्वीरित्या पूर्ण झाली!';

  @override
  String get unknownState => 'अज्ञात स्थिती';

  @override
  String get uploadingVoiceRecordings => 'व्हॉइस रेकॉर्डिंग अपलोड होत आहेत...';

  @override
  String imageNumber(Object number) {
    return 'प्रतिमा $number';
  }

  @override
  String get somethingWentWrong => 'काहीतरी चुकीचे झाले';

  @override
  String get imageNotAvailable => 'प्रतिमा उपलब्ध नाही';

  @override
  String stepOfTotal(Object current, Object total) {
    return 'चरण $current पैकी $total';
  }

  @override
  String get describeImageInstruction => 'कृपया या प्रतिमेत आपण जे पाहत आहात ते वर्णन करा। स्पष्टपणे बोला आणि मुख्य घटकांचे वर्णन करा।';

  @override
  String get stopRecording => 'रेकॉर्डिंग थांबवा';

  @override
  String get reRecord => 'पुन्हा रेकॉर्ड करा';

  @override
  String get startRecording => 'रेकॉर्डिंग सुरू करा';

  @override
  String get recording => 'रेकॉर्ड होत आहे...';

  @override
  String get stopDescription => 'वर्णन थांबवा';

  @override
  String get playDescription => 'वर्णन प्ले करा';

  @override
  String get nextStep => 'पुढील चरण';

  @override
  String get register => 'नोंदणी करा';

  @override
  String get pleaseWaitForDescription => 'कृपया वर्णन संपेपर्यंत प्रतीक्षा करा।';

  @override
  String get microphonePermissionRequired => 'मायक्रोफोन परवानगी आवश्यक आहे। कृपया सेटिंग्जमध्ये ती सक्षम करा।';

  @override
  String failedToStartRecording(Object error) {
    return 'रेकॉर्डिंग सुरू करण्यात अयशस्वी: $error';
  }

  @override
  String get recordingFailed => 'रेकॉर्डिंग अयशस्वी झाली। कृपया पुन्हा प्रयत्न करा।';

  @override
  String get recordingFileNotFound => 'रेकॉर्डिंग फाइल सापडली नाही। कृपया पुन्हा प्रयत्न करा।';

  @override
  String get recordingEmpty => 'रेकॉर्डिंग रिकामी आहे। कृपया पुन्हा प्रयत्न करा।';

  @override
  String failedToStopRecording(Object error) {
    return 'रेकॉर्डिंग थांबवण्यात अयशस्वी: $error';
  }

  @override
  String get pleaseStopRecordingBeforePlay => 'कृपया वर्णन प्ले करण्यापूर्वी रेकॉर्डिंग थांबवा।';

  @override
  String failedToPlayDescription(Object error) {
    return 'वर्णन प्ले करण्यात अयशस्वी: $error';
  }

  @override
  String failedToStopDescription(Object error) {
    return 'वर्णन थांबवण्यात अयशस्वी: $error';
  }

  @override
  String get pleaseRecordBeforeProceeding => 'कृपया पुढे जाण्यापूर्वी आपला आवाज रेकॉर्ड करा।';

  @override
  String get pleaseWaitForRecordingOrDescription => 'कृपया रेकॉर्डिंग किंवा वर्णन पूर्ण होईपर्यंत प्रतीक्षा करा।';

  @override
  String get pleaseCompleteAllRecordings => 'कृपया सबमिट करण्यापूर्वी सर्व 3 रेकॉर्डिंग पूर्ण करा।';

  @override
  String get userIdNotFound => 'वापरकर्ता ID सापडला नाही। कृपया पुन्हा लॉग इन करा।';

  @override
  String get recordingFilesMissing => 'एक किंवा अधिक रेकॉर्डिंग फाइल्स गहाळ आहेत।';

  @override
  String get imageDescriptionCooking => 'एक महिला स्टोववर एका भांड्यात काहीतरी हलवत आहे, तर एक पुरुष तिच्या बाजूला एक मिक्सिंग बाउल धरून उभा आहे। असे दिसते की ते एकत्र स्वयंपाकघरात जेवण तयार करत आहेत। दृश्य उबदार आणि सहकार्यपूर्ण दिसते।';

  @override
  String get imageDescriptionLaptop => 'एक तरुणी एका डेस्कवर बसून तिच्या लॅपटॉपवर काम करत आहे। टेबलावर पुस्तकें आणि एक कॉफी कप आहे, आणि खोलीभोवती अनेक वनस्पती ठेवल्या आहेत। जागा आरामदायक आणि घरापासून काम करण्यासाठी योग्य दिसते।';

  @override
  String get imageDescriptionCoffee => 'तीन लोक एक आरामदायक कॅफेमध्ये लहान टेबलांवर बसले आहेत। त्यापैकी दोघे चहा आणि केक खात असून बोलत आहेत, आणि दुसरी महिला जवळ बसून एक मांजर धरून आहे। मजल्यावर एक कुत्रा पडलेला आहे, आणि वातावरण शांत आणि मैत्रीपूर्ण दिसते।';

  @override
  String get imageDescriptionConstruction => 'तीन बांधकाम कामगार हेल्मेट घालून एका इमारतीच्या योजनेवर चर्चा करत आहेत। एक व्यक्ती बोर्डवर प्रदर्शित केलेल्या मोठ्या ब्लूप्रिंटकडे निर्देश करत आहे। संघ एका बांधकाम प्रकल्पाची योजना करत आहे किंवा पुनरावलोकन करत आहे असे दिसते।';

  @override
  String get imageDescriptionCrossing => 'एक तरुण पुरुष एका वृद्ध महिलेला पादचारी क्रॉसिंगवर रस्ता ओलांडण्यात मदत करत आहे। जवळ ट्रॅफिक सिग्नल आणि एक कार वाट पाहत आहे। दृश्य शहरी वातावरणात दया आणि सुरक्षा दर्शवते।';
}
