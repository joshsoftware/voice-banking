// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get appTitle => 'ലിംഗോ വോയ്സ് ബാങ്കിംഗ്';

  @override
  String get loginPrompt => 'നിങ്ങളുടെ മൊബൈൽ നമ്പർ നൽകുക';

  @override
  String get otpPrompt => 'OTP നൽകുക';

  @override
  String get micHint => 'സംസാരിക്കാൻ മൈക്കിൽ ടാപ്പ് ചെയ്യുക';

  @override
  String get listening => 'കേൾക്കുന്നു...';

  @override
  String get transcribing => 'എഴുത്താക്കുന്നു...';

  @override
  String get executing => 'നിങ്ങളുടെ അഭ്യർത്ഥന പ്രോസസ്സ് ചെയ്യുന്നു...';

  @override
  String get otpSuccess => 'OTP വിജയകരമായി സ്ഥിരീകരിച്ചു!';

  @override
  String balanceResponse(Object amount) {
    return 'നിങ്ങളുടെ നിലവിലെ ബാലൻസ് $amount രൂപയാണ്.';
  }

  @override
  String get failedIntent => 'ക്ഷമിക്കണം, എനിക്ക് അത് മനസ്സിലായില്ല.';

  @override
  String get recTxns => 'ഏറ്റവും പുതിയ ഇടപാടുകൾ';

  @override
  String get curBalance => 'ലഭ്യമായ ബാലൻസ്';

  @override
  String get msgNoTransactionFound => 'ഇടപാടുകൾ കണ്ടെത്തിയില്ല.';

  @override
  String get logout => 'ലോഗ് ഔട്ട്';

  @override
  String get logoutConfirm => 'നിങ്ങൾക്ക് ശരിക്കും ലോഗ് ഔട്ട് ചെയ്യണോ?';

  @override
  String get logoutSuccess => 'വിജയകരമായി ലോഗ് ഔട്ട് ചെയ്തു!';

  @override
  String get welcomeBack => 'വീണ്ടും സ്വാഗതം! ';

  @override
  String get voiceBankingDashboard => 'നിങ്ങളുടെ വോയ്സ് ബാങ്കിംഗ് ഡാഷ്‌ബോർഡ്';

  @override
  String get availableBalance => 'ലഭ്യമായ ബാലൻസ്';

  @override
  String get viewAll => 'എല്ലാം കാണുക';

  @override
  String get voice => 'വോയ്സ്';

  @override
  String get stop => 'നിർത്തുക';

  @override
  String get cancel => 'റദ്ദാക്കുക';

  @override
  String get welcomeTo => 'സ്വാഗതം';

  @override
  String get experienceBanking => 'വോയ്സിന്റെ ശക്തിയിൽ ബാങ്കിംഗ് അനുഭവിക്കുക';

  @override
  String get enterMobileNumber => 'മൊബൈൽ നമ്പർ നൽകുക';

  @override
  String get weWillSendOtp => 'നിങ്ങളുടെ നമ്പർ പരിശോധിക്കാൻ ഞങ്ങൾ നിങ്ങൾക്ക് OTP അയയ്ക്കും';

  @override
  String get mobileNumber => 'മൊബൈൽ നമ്പർ';

  @override
  String get enterYourMobileNumber => 'നിങ്ങളുടെ 10-അക്ക മൊബൈൽ നമ്പർ നൽകുക';

  @override
  String get sendOtp => 'OTP അയയ്ക്കുക';

  @override
  String get pleaseEnterValidMobile => 'ദയവായി സാധുവായ 10-അക്ക മൊബൈൽ നമ്പർ നൽകുക';

  @override
  String get verifyYourPhone => 'നിങ്ങളുടെ ഫോൺ പരിശോധിക്കുക';

  @override
  String get weHaveSentCode => 'ഞങ്ങൾ നിങ്ങളുടെ ഫോണിൽ 6-അക്ക കോഡ് അയച്ചിട്ടുണ്ട്';

  @override
  String get enterVerificationCode => 'പരിശോധന കോഡ് നൽകുക';

  @override
  String get enterSixDigitCode => 'നിങ്ങളുടെ ഫോണിൽ അയച്ച 6-അക്ക കോഡ് നൽകുക';

  @override
  String get verifyOtp => 'OTP പരിശോധിക്കുക';

  @override
  String get didntReceiveCode => 'കോഡ് ലഭിച്ചില്ല? ';

  @override
  String resendIn(Object seconds) {
    return '$seconds സെക്കൻഡിൽ വീണ്ടും അയയ്ക്കുക';
  }

  @override
  String get resendOtp => 'OTP വീണ്ടും അയയ്ക്കുക';

  @override
  String get otpValidFor => 'നിങ്ങളുടെ OTP 5 മിനിറ്റ് സാധുവാണ്, ഒരു തവണ മാത്രം ഉപയോഗിക്കാം.';

  @override
  String get secureVerification => 'AI ഉപയോഗിച്ച് സുരക്ഷിത പരിശോധന';

  @override
  String get otpVerifiedSuccessfully => '✅ OTP വിജയകരമായി പരിശോധിച്ചു!';

  @override
  String get invalidOtp => '❌ അസാധുവായ OTP, ദയവായി വീണ്ടും ശ്രമിക്കുക';

  @override
  String newOtpSent(Object mobileNumber) {
    return ' പുതിയ OTP $mobileNumber ലേക്ക് അയച്ചു';
  }

  @override
  String get pleaseEnterOtp => 'ദയവായി OTP നൽകുക';

  @override
  String get otpMustBeSixDigits => 'OTP 6 അക്കങ്ങളായിരിക്കണം';

  @override
  String get whyChooseVoiceBanking => 'വോയ്സ് ബാങ്കിംഗ് എന്തുകൊണ്ട് തിരഞ്ഞെടുക്കണം?';

  @override
  String get voiceCommands => 'വോയ്സ് കമാൻഡുകൾ';

  @override
  String get controlWithVoice => 'നിങ്ങളുടെ വോയ്സ് ഉപയോഗിച്ച് നിയന്ത്രിക്കുക';

  @override
  String get secure => 'സുരക്ഷിതം';

  @override
  String get bankGradeSecurity => 'ബാങ്ക്-ഗ്രേഡ് സുരക്ഷ';

  @override
  String get multiLanguage => 'ബഹുഭാഷാ';

  @override
  String get supportForLanguages => '10+ ഭാഷകൾക്ക് പിന്തുണ';

  @override
  String get fast => 'വേഗതയുള്ള';

  @override
  String get quickTransactions => 'വേഗത്തിലുള്ള ഇടപാടുകൾ';

  @override
  String get poweredByAI => 'AI സാങ്കേതികവിദ്യയാൽ പ്രവർത്തിക്കുന്നു';

  @override
  String get paymentInitiated => 'പേയ്‌മെന്റ് ആരംഭിച്ചു ';

  @override
  String get viewAllTransactions => 'എല്ലാ ഇടപാടുകളും കാണുക';

  @override
  String get aiIsSpeaking => 'AI സംസാരിക്കുന്നു…';

  @override
  String get validationRequired => 'ഈ ഫീൽഡ് ആവശ്യമാണ്';

  @override
  String get validationEmail => 'ദയവായി സാധുവായ ഇമെയിൽ നൽകുക';

  @override
  String get validationPhone => 'ദയവായി സാധുവായ ഫോൺ നമ്പർ നൽകുക';

  @override
  String get validationOtp => 'ദയവായി സാധുവായ OTP നൽകുക';

  @override
  String get allTransactions => 'എല്ലാ ഇടപാടുകളും';

  @override
  String get transactions => 'ഇടപാടുകൾ';

  @override
  String get loading => 'ലോഡ് ചെയ്യുന്നു...';

  @override
  String get errorLoadingTransactions => 'ഇടപാടുകൾ ലോഡ് ചെയ്യുന്നതിൽ പിശക്';

  @override
  String get retry => 'വീണ്ടും ശ്രമിക്കുക';

  @override
  String get noTransactionsFound => 'ഇടപാടുകൾ കണ്ടെത്തിയില്ല';

  @override
  String get noTransactionsDescription => 'നിങ്ങൾക്ക് ഇതുവരെ ഇടപാടുകൾ ഇല്ല';

  @override
  String get faq => 'പതിവായി ചോദിക്കുന്ന ചോദ്യങ്ങൾ';

  @override
  String get frequentlyAskedQuestions => 'പതിവായി ചോദിക്കുന്ന ചോദ്യങ്ങൾ';

  @override
  String get learnHowToUseVoiceBanking => 'വോയ്സ് ബാങ്കിംഗ് ഫലപ്രദമായി എങ്ങനെ ഉപയോഗിക്കാമെന്ന് പഠിക്കുക';

  @override
  String get whatToSpeak => 'എന്താണ് പറയേണ്ടത്';

  @override
  String get whatToSpeakDescription => 'ഉദാഹരണത്തിന്, നിങ്ങൾക്ക് എന്റെ നിലവിലെ ബാലൻസ് എത്രയാണെന്ന് ചോദിക്കാം';

  @override
  String get howToCheckTransactions => 'ഇടപാടുകൾ എങ്ങനെ പരിശോധിക്കാം';

  @override
  String get howToCheckTransactionsDescription => 'നിങ്ങൾക്ക് എന്റെ അവസാന x ഇടപാടുകൾ എന്താണെന്ന് ചോദിക്കാം';

  @override
  String get voiceCommandsDescription => 'വ്യക്തമായും സ്വാഭാവികമായും സംസാരിക്കുക. സിസ്റ്റം സംഭാഷണ ഭാഷ മനസ്സിലാക്കുന്നു.';

  @override
  String get supportedLanguages => 'പിന്തുണയുള്ള ഭാഷകൾ';

  @override
  String get supportedLanguagesDescription => 'നിലവിൽ ഇംഗ്ലീഷ്, ഹിന്ദി, ബംഗാളി, ഗുജറാത്തി, കന്നഡ, മലയാളം, മറാഠി, പഞ്ചാബി, തമിഴ്, തെലുഗു ഭാഷകൾക്ക് പിന്തുണ നൽകുന്നു.';

  @override
  String get privacySecurity => 'സ്വകാര്യതയും സുരക്ഷയും';

  @override
  String get privacySecurityDescription => 'നിങ്ങളുടെ വോയ്സ് ഡാറ്റ സുരക്ഷിതമായി പ്രോസസ്സ് ചെയ്യപ്പെടുന്നു, സ്ഥിരമായി സംഭരിക്കപ്പെടുന്നില്ല.';

  @override
  String get proTips => 'പ്രൊഫഷണൽ നുറുങ്ങുകൾ';

  @override
  String get tipQuietEnvironment => 'മികച്ച തിരിച്ചറിയലിനായി ശാന്തമായ പരിസ്ഥിതിയിൽ സംസാരിക്കുക';

  @override
  String get tipNaturalLanguage => 'സ്വാഭാവിക ഭാഷ ഉപയോഗിക്കുക ഉദാഹരണത്തിന് \"എന്റെ ബാലൻസ് കാണിക്കുക\"';

  @override
  String get tipWaitForIndicator => 'സംസാരിക്കുന്നതിന് മുമ്പ് കേൾക്കുന്ന സൂചകത്തിനായി കാത്തിരിക്കുക';

  @override
  String get needMoreHelp => 'കൂടുതൽ സഹായം വേണോ?';

  @override
  String get contactSupportDescription => 'അധിക സഹായത്തിനായി ഞങ്ങളുടെ സപ്പോർട്ട് ടീമുമായി ബന്ധപ്പെടുക';
}
