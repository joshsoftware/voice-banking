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
}
