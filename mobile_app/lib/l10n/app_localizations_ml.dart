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
  String get tapToSpeak => 'സംസാരിക്കാൻ ടാപ്പ് ചെയ്യുക';

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
  String get stopVoiceBankingConfirm => 'വോയ്സ് ബാങ്കിംഗ് നിർത്തണോ? എല്ലാ നിലവിലെ വോയ്സ് പ്രവർത്തനങ്ങളും റദ്ദാക്കപ്പെടും.';

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

  @override
  String balanceSuccess(Object amount) {
    return 'നിങ്ങളുടെ നിലവിലെ ബാലൻസ് $amount രൂപയാണ്.';
  }

  @override
  String transactionsFound(Object count) {
    return 'നിങ്ങളുടെ $count ഏറ്റവും പുതിയ ഇടപാടുകൾ ഇതാ.';
  }

  @override
  String get noTransactions => 'ഇടപാടുകളൊന്നും കണ്ടെത്തിയില്ല.';

  @override
  String transferSuccess(Object amount, Object recipient) {
    return '$recipient-ന് $amount രൂപ ട്രാൻസ്ഫർ വിജയകരമായി ആരംഭിച്ചു.';
  }

  @override
  String get transferFailed => 'ട്രാൻസ്ഫർ പരാജയപ്പെട്ടു. ദയവായി വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get errorGeneric => 'ക്ഷമിക്കണം, ഒരു പിശക് സംഭവിച്ചു. ദയവായി വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get errorInsufficientFunds => 'ധനം പോരാ. ദയവായി നിങ്ങളുടെ ബാലൻസ് പരിശോധിക്കുക.';

  @override
  String get pleaseSaySomething => 'ദയവായി എന്തെങ്കിലും പറയുക';

  @override
  String get voiceRegistration => 'വോയ്‌സ് രജിസ്ട്രേഷൻ';

  @override
  String get pleaseWaitForUpload => 'ദയവായി അപ്‌ലോഡ് പൂർത്തിയാകുന്നത് വരെ കാത്തിരിക്കുക';

  @override
  String get voiceRegistrationCompleted => 'വോയ്‌സ് രജിസ്ട്രേഷൻ വിജയകരമായി പൂർത്തിയായി!';

  @override
  String get unknownState => 'അജ്ഞാത അവസ്ഥ';

  @override
  String get uploadingVoiceRecordings => 'വോയ്‌സ് റെക്കോർഡിംഗുകൾ അപ്‌ലോഡ് ചെയ്യുന്നു...';

  @override
  String imageNumber(Object number) {
    return 'ചിത്രം $number';
  }

  @override
  String get somethingWentWrong => 'എന്തോ തെറ്റ് സംഭവിച്ചു';

  @override
  String get imageNotAvailable => 'ചിത്രം ലഭ്യമല്ല';

  @override
  String stepOfTotal(Object current, Object total) {
    return 'ഘട്ടം $current ന്റെ $total';
  }

  @override
  String get describeImageInstruction => 'ദയവായി ഈ ചിത്രത്തിൽ നിങ്ങൾ കാണുന്നത് വിവരിക്കുക। വ്യക്തമായി സംസാരിക്കുക, പ്രധാന ഘടകങ്ങൾ വിവരിക്കുക।';

  @override
  String get stopRecording => 'റെക്കോർഡിംഗ് നിർത്തുക';

  @override
  String get reRecord => 'വീണ്ടും റെക്കോർഡ് ചെയ്യുക';

  @override
  String get startRecording => 'റെക്കോർഡിംഗ് ആരംഭിക്കുക';

  @override
  String get recording => 'റെക്കോർഡ് ചെയ്യുന്നു...';

  @override
  String get stopDescription => 'വിവരണം നിർത്തുക';

  @override
  String get playDescription => 'വിവരണം പ്ലേ ചെയ്യുക';

  @override
  String get nextStep => 'അടുത്ത ഘട്ടം';

  @override
  String get register => 'രജിസ്റ്റർ ചെയ്യുക';

  @override
  String get pleaseWaitForDescription => 'ദയവായി വിവരണം പൂർത്തിയാകുന്നത് വരെ കാത്തിരിക്കുക।';

  @override
  String get microphonePermissionRequired => 'മൈക്രോഫോൺ അനുമതി ആവശ്യമാണ്। ദയവായി സെറ്റിംഗുകളിൽ ഇത് പ്രവർത്തനക്ഷമമാക്കുക।';

  @override
  String failedToStartRecording(Object error) {
    return 'റെക്കോർഡിംഗ് ആരംഭിക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get recordingFailed => 'റെക്കോർഡിംഗ് പരാജയപ്പെട്ടു। ദയവായി വീണ്ടും ശ്രമിക്കുക।';

  @override
  String get recordingFileNotFound => 'റെക്കോർഡിംഗ് ഫയൽ കണ്ടെത്തിയില്ല। ദയവായി വീണ്ടും ശ്രമിക്കുക।';

  @override
  String get recordingEmpty => 'റെക്കോർഡിംഗ് ശൂന്യമാണ്। ദയവായി വീണ്ടും ശ്രമിക്കുക।';

  @override
  String failedToStopRecording(Object error) {
    return 'റെക്കോർഡിംഗ് നിർത്തുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get pleaseStopRecordingBeforePlay => 'ദയവായി വിവരണം പ്ലേ ചെയ്യുന്നതിന് മുമ്പ് റെക്കോർഡിംഗ് നിർത്തുക।';

  @override
  String failedToPlayDescription(Object error) {
    return 'വിവരണം പ്ലേ ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String failedToStopDescription(Object error) {
    return 'വിവരണം നിർത്തുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get pleaseRecordBeforeProceeding => 'ദയവായി മുന്നോട്ട് പോകുന്നതിന് മുമ്പ് നിങ്ങളുടെ വോയ്‌സ് റെക്കോർഡ് ചെയ്യുക।';

  @override
  String get pleaseWaitForRecordingOrDescription => 'ദയവായി റെക്കോർഡിംഗ് അല്ലെങ്കിൽ വിവരണം പൂർത്തിയാകുന്നത് വരെ കാത്തിരിക്കുക।';

  @override
  String get pleaseCompleteAllRecordings => 'ദയവായി സമർപ്പിക്കുന്നതിന് മുമ്പ് എല്ലാ 3 റെക്കോർഡിംഗുകളും പൂർത്തിയാക്കുക।';

  @override
  String get userIdNotFound => 'ഉപയോക്തൃ ID കണ്ടെത്തിയില്ല। ദയവായി വീണ്ടും ലോഗിൻ ചെയ്യുക।';

  @override
  String get recordingFilesMissing => 'ഒന്നോ അതിലധികമോ റെക്കോർഡിംഗ് ഫയലുകൾ കാണാതായിരിക്കുന്നു।';

  @override
  String get imageDescriptionCooking => 'ഒരു സ്ത്രീ സ്റ്റോവിൽ ഒരു പാത്രത്തിൽ എന്തെങ്കിലും ഇളക്കുകയാണ്, അരികിൽ ഒരു പുരുഷൻ ഒരു മിക്സിംഗ് പാത്രം പിടിച്ചുനിൽക്കുന്നു। അവർ ഒരുമിച്ച് അടുക്കളയിൽ ഭക്ഷണം തയ്യാറാക്കുന്നതായി തോന്നുന്നു। രംഗം ചൂടുള്ളതും സഹകരണപരവുമാണ്।';

  @override
  String get imageDescriptionLaptop => 'ഒരു യുവതി ഒരു ഡെസ്കിൽ ഇരുന്ന് തന്റെ ലാപ്‌ടോപ്പിൽ പ്രവർത്തിക്കുന്നു। മേശയിൽ പുസ്തകങ്ങളും ഒരു കോഫി കപ്പും ഉണ്ട്, മാളികയുടെ ചുറ്റും നിരവധി സസ്യങ്ങൾ വെച്ചിരിക്കുന്നു। സ്ഥലം സുഖകരവും വീട്ടിൽ നിന്ന് പ്രവർത്തിക്കാൻ അനുയോജ്യവുമാണ്।';

  @override
  String get imageDescriptionCoffee => 'മൂന്ന് പേർ ഒരു സുഖകരമായ കഫയിൽ ചെറിയ മേശകളിൽ ഇരിക്കുന്നു। അവരിൽ രണ്ട് പേർ ചായയും കേക്കും കഴിച്ചുകൊണ്ട് സംസാരിക്കുന്നു, മറ്റൊരു സ്ത്രീ അരികിൽ ഇരുന്ന് ഒരു പൂച്ച പിടിച്ചുനിൽക്കുന്നു। നിലത്ത് ഒരു നായ കിടക്കുന്നു, അന്തരീക്ഷം ശാന്തവും സൗഹാർദ്ദപരവുമാണ്।';

  @override
  String get imageDescriptionConstruction => 'മൂന്ന് നിർമ്മാണ തൊഴിലാളികൾ ഹെൽമെറ്റുകൾ ധരിച്ച് ഒരു കെട്ടിട പദ്ധതിയെക്കുറിച്ച് ചർച്ച ചെയ്യുന്നു। ഒരാൾ ബോർഡിൽ പ്രദർശിപ്പിച്ചിരിക്കുന്ന ഒരു വലിയ ബ്ലൂപ്രിന്റിനെ ചൂണ്ടിക്കാണിക്കുന്നു। ടീം ഒരു നിർമ്മാണ പ്രോജക്റ്റ് ആസൂത്രണം ചെയ്യുകയോ അവലോകനം ചെയ്യുകയോ ചെയ്യുന്നതായി തോന്നുന്നു।';

  @override
  String get imageDescriptionCrossing => 'ഒരു യുവാവ് ഒരു വൃദ്ധയെ പാദചാരി ക്രോസിംഗിൽ റോഡ് കടക്കാൻ സഹായിക്കുന്നു। അരികിൽ ട്രാഫിക് സിഗ്നലുകളും ഒരു കാറും കാത്തിരിക്കുന്നു। രംഗം നഗര അന്തരീക്ഷത്തിൽ ദയയും സുരക്ഷയും കാണിക്കുന്നു।';
}
