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
  String get tapToSpeak => 'बोलने के लिए टैप करें';

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
  String get stopVoiceBankingConfirm => 'वॉइस बैंकिंग बंद करें? सभी वर्तमान वॉइस गतिविधि रद्द हो जाएगी।';

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
  String get allTransactions => 'सभी लेन-देन';

  @override
  String get transactions => 'लेन-देन';

  @override
  String get loading => 'लोड हो रहा है...';

  @override
  String get errorLoadingTransactions => 'लेन-देन लोड करने में त्रुटि';

  @override
  String get retry => 'पुनः प्रयास करें';

  @override
  String get noTransactionsFound => 'कोई लेन-देन नहीं मिला';

  @override
  String get noTransactionsDescription => 'आपके पास अभी तक कोई लेन-देन नहीं है';

  @override
  String get faq => 'अक्सर पूछे जाने वाले प्रश्न';

  @override
  String get frequentlyAskedQuestions => 'अक्सर पूछे जाने वाले प्रश्न';

  @override
  String get learnHowToUseVoiceBanking => 'वॉइस बैंकिंग का प्रभावी उपयोग करना सीखें';

  @override
  String get whatToSpeak => 'क्या बोलना है';

  @override
  String get whatToSpeakDescription => 'उदाहरण के लिए, आप पूछ सकते हैं कि मेरा वर्तमान बैलेंस क्या है';

  @override
  String get howToCheckTransactions => 'लेन-देन कैसे देखें';

  @override
  String get howToCheckTransactionsDescription => 'आप पूछ सकते हैं कि मेरे अंतिम x लेन-देन क्या हैं';

  @override
  String get voiceCommandsDescription => 'स्पष्ट और प्राकृतिक रूप से बोलें। सिस्टम बातचीत की भाषा को समझता है।';

  @override
  String get supportedLanguages => 'समर्थित भाषाएं';

  @override
  String get supportedLanguagesDescription => 'वर्तमान में अंग्रेजी, हिंदी, बंगाली, गुजराती, कन्नड़, मलयालम, मराठी, पंजाबी, तमिल और तेलुगु का समर्थन करता है।';

  @override
  String get privacySecurity => 'गोपनीयता और सुरक्षा';

  @override
  String get privacySecurityDescription => 'आपका वॉइस डेटा सुरक्षित रूप से प्रोसेस किया जाता है और स्थायी रूप से संग्रहीत नहीं किया जाता।';

  @override
  String get proTips => 'विशेषज्ञ सुझाव';

  @override
  String get tipQuietEnvironment => 'बेहतर पहचान के लिए शांत वातावरण में बोलें';

  @override
  String get tipNaturalLanguage => 'प्राकृतिक भाषा का उपयोग करें जैसे \"मेरा बैलेंस दिखाएं\"';

  @override
  String get tipWaitForIndicator => 'बोलने से पहले सुनने के संकेतक की प्रतीक्षा करें';

  @override
  String get needMoreHelp => 'और सहायता चाहिए?';

  @override
  String get contactSupportDescription => 'अतिरिक्त सहायता के लिए हमारी सहायता टीम से संपर्क करें';

  @override
  String balanceSuccess(Object amount) {
    return 'आपका वर्तमान बैलेंस $amount रुपये है।';
  }

  @override
  String transactionsFound(Object count) {
    return 'यहां आपके $count सबसे हाल के लेनदेन हैं।';
  }

  @override
  String get noTransactions => 'कोई लेनदेन नहीं मिला।';

  @override
  String transferSuccess(Object amount, Object recipient) {
    return '$recipient को $amount रुपये का ट्रांसफर सफलतापूर्वक शुरू किया गया है।';
  }

  @override
  String get transferFailed => 'ट्रांसफर विफल। कृपया पुनः प्रयास करें।';

  @override
  String get errorGeneric => 'क्षमा करें, एक त्रुटि हुई। कृपया पुनः प्रयास करें।';

  @override
  String get errorInsufficientFunds => 'अपर्याप्त धन। कृपया अपना बैलेंस जांचें।';

  @override
  String get pleaseSaySomething => 'कृपया कुछ बोलें';

  @override
  String get voiceRegistration => 'वॉइस पंजीकरण';

  @override
  String get pleaseWaitForUpload => 'कृपया अपलोड पूरा होने की प्रतीक्षा करें';

  @override
  String get voiceRegistrationCompleted => 'वॉइस पंजीकरण सफलतापूर्वक पूरा हो गया!';

  @override
  String get unknownState => 'अज्ञात स्थिति';

  @override
  String get uploadingVoiceRecordings => 'वॉइस रिकॉर्डिंग अपलोड हो रही है...';

  @override
  String imageNumber(Object number) {
    return 'छवि $number';
  }

  @override
  String get somethingWentWrong => 'कुछ गलत हो गया';

  @override
  String get imageNotAvailable => 'छवि उपलब्ध नहीं है';

  @override
  String stepOfTotal(Object current, Object total) {
    return 'चरण $current का $total';
  }

  @override
  String get describeImageInstruction => 'कृपया इस छवि में जो आप देख रहे हैं उसका वर्णन करें। स्पष्ट रूप से बोलें और मुख्य तत्वों का वर्णन करें।';

  @override
  String get stopRecording => 'रिकॉर्डिंग रोकें';

  @override
  String get reRecord => 'पुनः रिकॉर्ड करें';

  @override
  String get startRecording => 'रिकॉर्डिंग शुरू करें';

  @override
  String get recording => 'रिकॉर्डिंग हो रही है...';

  @override
  String get stopDescription => 'वर्णन रोकें';

  @override
  String get playDescription => 'वर्णन चलाएं';

  @override
  String get nextStep => 'अगला चरण';

  @override
  String get register => 'पंजीकरण करें';

  @override
  String get pleaseWaitForDescription => 'कृपया वर्णन समाप्त होने की प्रतीक्षा करें।';

  @override
  String get microphonePermissionRequired => 'माइक्रोफोन अनुमति आवश्यक है। कृपया इसे सेटिंग्स में सक्षम करें।';

  @override
  String failedToStartRecording(Object error) {
    return 'रिकॉर्डिंग शुरू करने में विफल: $error';
  }

  @override
  String get recordingFailed => 'रिकॉर्डिंग विफल हो गई। कृपया पुनः प्रयास करें।';

  @override
  String get recordingFileNotFound => 'रिकॉर्डिंग फ़ाइल नहीं मिली। कृपया पुनः प्रयास करें।';

  @override
  String get recordingEmpty => 'रिकॉर्डिंग खाली है। कृपया पुनः प्रयास करें।';

  @override
  String failedToStopRecording(Object error) {
    return 'रिकॉर्डिंग रोकने में विफल: $error';
  }

  @override
  String get pleaseStopRecordingBeforePlay => 'कृपया वर्णन चलाने से पहले रिकॉर्डिंग रोकें।';

  @override
  String failedToPlayDescription(Object error) {
    return 'वर्णन चलाने में विफल: $error';
  }

  @override
  String failedToStopDescription(Object error) {
    return 'वर्णन रोकने में विफल: $error';
  }

  @override
  String get pleaseRecordBeforeProceeding => 'कृपया आगे बढ़ने से पहले अपनी आवाज़ रिकॉर्ड करें।';

  @override
  String get pleaseWaitForRecordingOrDescription => 'कृपया रिकॉर्डिंग या वर्णन पूरा होने की प्रतीक्षा करें।';

  @override
  String get pleaseCompleteAllRecordings => 'कृपया सबमिट करने से पहले सभी 3 रिकॉर्डिंग पूरी करें।';

  @override
  String get userIdNotFound => 'उपयोगकर्ता ID नहीं मिला। कृपया फिर से लॉग इन करें।';

  @override
  String get recordingFilesMissing => 'एक या अधिक रिकॉर्डिंग फ़ाइलें गायब हैं।';

  @override
  String get imageDescriptionBoardMeeting => 'एक पेशेवर व्यक्ति आधुनिक, धूप से भरी ऑफिस बोर्डरूम में शहर के नज़ारे वाली खिड़की के सामने सहकर्मियों को डेटा प्रस्तुति दे रहा है।';

  @override
  String get imageDescriptionBoyWithDog => 'चश्मे वाला एक लड़का धूप वाले पार्क के रास्ते पर हस्की कुत्ते को पट्टा पकड़कर चलाते हुए मुस्कुरा रहा है।';

  @override
  String get imageDescriptionChildrenPainting => 'पाँच बच्चे बड़ी खिड़की के पास कालीन पर बैठकर उज्ज्वल बैठक में मिलकर रंगीन चित्र खुशी-खुशी पेंट कर रहे हैं।';

  @override
  String get imageDescriptionChildrenWithDog => 'चार बच्चे हरी-भरी बगीचे में दो कुत्तों के साथ खुशी से खेल रहे हैं, धूप दोपहर में फ्रिसबी उछाल रहे हैं।';

  @override
  String get imageDescriptionConstructionSite => 'चार निर्माण पेशेवर सुरक्षा वस्त्र और हार्ड हेट पहने धूल भरी साइट पर बड़ी वास्तुशिल्प निर्माण ब्लूप्रिंट की सावधानी से समीक्षा कर रहे हैं।';

  @override
  String get imageDescriptionFamilyDinner => 'खुशहाल चार सदस्यों वाला परिवार रेस्तराँ में पारंपरिक भारतीय रात्रिभोज का आनंद ले रहा है, गर्म माहौल में खाना और हँसी बाँट रहा है।';

  @override
  String get imageDescriptionHoliCelebration => 'परिवार और दोस्तों का खुशनुमा समूह होली मना रहा है, हवा में रंगीन पाउडर के ज़ोरदार उड़ाव के बीच साथ हँस रहा है।';

  @override
  String get imageDescriptionLadyPainting => 'एक युवती अपने धूप भरे, आरामदायक घर के आर्ट स्टूडियो में कैनवस पर सुंदर पीला लैंडस्केप पेंट करने पर ध्यान दे रही है।';

  @override
  String get imageDescriptionMomAndSon => 'एक माँ अपने छोटे बेटे को चूल्हे पर खाना बनाने में मदद कर रही है, उज्ज्वल आधुनिक सफेद रसोई में लकड़ी के स्टूल पर खड़े होकर।';

  @override
  String get imageDescriptionPeopleDiwaliCelebration => 'पारंपरिक पोशाक में लोग सजी हुई गली पर दीवाली मना रहे हैं, जगमगाते दीये, रंगीन लालटेन और ऊपर शानदार आतिशबाज़ी के साथ।';

  @override
  String get imageDescriptionTajMahal => 'डेनिम जैकेट पहने युवा दोस्तों का समूह छत पर खड़ा है, कॉफी पकड़े ताज महल पीछे मुस्कुरा रहे हैं।';

  @override
  String get imageDescriptionVillageScene => 'एक बुजुर्ग किसान सुनहरी सूर्यास्त के दौरान बड़ी फसल लादे लकड़ी की बैलगाड़ी पर बैठा है, जिसे दो सफेद बैल खींच रहे हैं।';

  @override
  String get imageDescriptionWomenDiwaliCelebration => 'गुलाबी पारंपरिक पोशाक वाली एक महिला जगमगाते तेल के दीयों से घिरी ज़मीन पर सुंदर रंगीन रंगोली बना रही है।';
}
