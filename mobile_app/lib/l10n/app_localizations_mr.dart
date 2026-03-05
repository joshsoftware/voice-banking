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
  String get tapToStop => 'थांबवण्यासाठी टॅप करा';

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
  String get somethingWentWrong => 'काहीतरी चुकीचे झाले, कृपया पुन्हा प्रयत्न करा!';

  @override
  String get imageNotAvailable => 'प्रतिमा उपलब्ध नाही';

  @override
  String stepOfTotal(Object current, Object total) {
    return 'चरण $current पैकी $total';
  }

  @override
  String describeImageInstruction(Object seconds) {
    return 'कृपया या प्रतिमेत आपण जे पाहत आहात ते $seconds सेकंदात वर्णन करा। स्पष्टपणे बोला आणि मुख्य घटकांचे वर्णन करा।';
  }

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
  String pleaseSpeakAtLeastSeconds(Object seconds) {
    return 'कृपया किमान $seconds सेकंद बोला।';
  }

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
  String get imageDescriptionBoardMeeting => 'एक व्यावसायिक पुरुष नगरदृश्य असलेल्या आधुनिक, उजेडी ऑफिस बोर्डरूममध्ये सहकर्म्यांना डेटा सादरीकरण देत आहे।';

  @override
  String get imageDescriptionBoyWithDog => 'चष्मा घातलेला मुलगा हसत उन्हाळ्याच्या पार्क मार्गावर हस्की कुत्र्याला दोरी पकडून चालवत आहे।';

  @override
  String get imageDescriptionChildrenPainting => 'पाच मुले मोठ्या खिडकीजवळ कार्पेटवर बसून उजळ लिव्हिंग रूममध्ये एकत्र रंगीत चित्रे आनंदाने रंगवत आहेत।';

  @override
  String get imageDescriptionChildrenWithDog => 'चार मुले हिरव्या बागेत दोन कुत्र्यांसोबत आनंदाने खेळत आहेत, उजळ दुपारी फ्रिसबी फेकत आहेत।';

  @override
  String get imageDescriptionConstructionSite => 'चार बांधकाम व्यावसायिक सुरक्षा वेस्ट आणि हार्ड हॅट घालून धुळीच्या साइटवर मोठ्या वास्तुशिल्प ब्लूप्रिंटचे काळजीपूर्वक पुनरावलोकन करत आहेत।';

  @override
  String get imageDescriptionFamilyDinner => 'चार सदस्यांचे आनंदी कुटुंब रेस्टॉरंटमध्ये पारंपरिक भारतीय रात्रीचे जेवण घेत आहे, उबदार वातावरणात अन्न आणि हास्य शेअर करत आहे।';

  @override
  String get imageDescriptionHoliCelebration => 'कुटुंब आणि मित्रांचा आनंदी गट होळी साजरा करत आहे, हवेत रंगीत पावडराच्या उत्साही स्फोटात एकत्र हसत आहे।';

  @override
  String get imageDescriptionLadyPainting => 'एक तरुणी तिच्या उन्हाळी, आरामदायक घरातील आर्ट स्टुडिओमध्ये कॅनव्हासवर सुंदर पिवळे लँडस्केप रंगवण्यावर लक्ष केंद्रित करते।';

  @override
  String get imageDescriptionMomAndSon => 'एक आई तिच्या लहान मुलाला स्टोव्हवर स्वयंपाक करण्यात मदत करते, उजळ आधुनिक पांढऱ्या स्वयंपाकघरात लाकडी स्टूलवर उभी राहून।';

  @override
  String get imageDescriptionPeopleDiwaliCelebration => 'पारंपरिक पोशाकात लोक सजलेल्या रस्त्यावर दिवाळी साजरी करत आहेत, तेजस्वी कंदील, चमकणारे दिवे आणि वर भव्य आतषबाजी।';

  @override
  String get imageDescriptionTajMahal => 'डेनिम जॅकेट घातलेले तरुण मित्र छतावर उभे आहेत, कॉफी पकडून मागे ताजमहाल असताना मुस्कुरत आहेत।';

  @override
  String get imageDescriptionVillageScene => 'एक वृद्ध शेतकरी सोनेरी सूर्यास्तादरम्यान मोठी पिके वाहून नेणाऱ्या लाकडी बैलगाडीवर बसला आहे, दोन पांढरे बैल ओढत आहेत।';

  @override
  String get imageDescriptionWomenDiwaliCelebration => 'गुलाबी पारंपरिक पोशाकातील महिला चमकणाऱ्या तेलाच्या दिव्यांनी वेढलेल्या जमिनीवर सुंदर रंगीत रंगोली काळजीपूर्वक तयार करते।';

  @override
  String get skip => 'वगळा';

  @override
  String get registerVoice => 'व्हॉईस नोंदणी करा';

  @override
  String get unregisterVoice => 'व्हॉईस नोंदणी रद्द करा';

  @override
  String get resetVoice => 'व्हॉईस रीसेट करा';

  @override
  String get resetVoiceConfirm => 'यामुळे तुमचा व्हॉईस प्रोफाइल हटवला जाईल. तुम्हाला पुन्हा व्हॉईस नोंदणी पूर्ण करावी लागेल. पुढे चालू ठेवायचे?';

  @override
  String get resetVoiceSuccess => 'व्हॉईस यशस्वीरित्या रीसेट झाला. कृपया पुन्हा नोंदणी पूर्ण करा.';

  @override
  String get resetVoiceError => 'व्हॉईस रीसेट करण्यात अयशस्वी. कृपया पुन्हा प्रयत्न करा.';

  @override
  String get audioStorageConsentTitle => 'ऑडिओ स्टोरेज संमती';

  @override
  String get audioStorageConsentMessage => 'व्हॉईस बँकिंग वापरण्यासाठी, प्रमाणीकरण आणि प्रक्रियेसाठी आम्हाला तुमच्या व्हॉईस रेकॉर्डिंग आमच्या सिस्टीममध्ये साठवण्याची गरज आहे. तुम्ही तुमचा ऑडिओ आमच्याकडे साठवण्यास सहमती दिली आहे का?';

  @override
  String get acceptConsent => 'मी स्वीकारतो/स्वीकारते';

  @override
  String get declineConsent => 'मी नकार देतो/देते';
}
