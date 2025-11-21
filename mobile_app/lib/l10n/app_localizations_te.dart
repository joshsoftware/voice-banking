// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appTitle => 'లింగో వాయిస్ బ్యాంకింగ్';

  @override
  String get loginPrompt => 'మీ మొబైల్ నంబర్‌ను నమోదు చేయండి';

  @override
  String get otpPrompt => 'OTP నమోదు చేయండి';

  @override
  String get micHint => 'మాట్లాడడానికి మైక్‌ను ట్యాప్ చేయండి';

  @override
  String get listening => 'వింటోంది...';

  @override
  String get transcribing => 'రాస్తోంది...';

  @override
  String get executing => 'మీ అభ్యర్థనను ప్రాసెస్ చేస్తోంది...';

  @override
  String get otpSuccess => 'OTP విజయవంతంగా ధృవీకరించబడింది!';

  @override
  String balanceResponse(Object amount) {
    return 'మీ ప్రస్తుత బ్యాలెన్స్ $amount రూపాయలు.';
  }

  @override
  String get failedIntent => 'క్షమించండి, నాకు అది అర్థం కాలేదు.';

  @override
  String get recTxns => 'ఇటీవలి లావాదేవీలు';

  @override
  String get curBalance => 'అందుబాటులో ఉన్న బ్యాలెన్స్';

  @override
  String get msgNoTransactionFound => 'లావాదేవీలు ఏవీ కనుగొనబడలేదు.';

  @override
  String get logout => 'లాగ్ అవుట్';

  @override
  String get logoutConfirm => 'మీరు నిజంగా లాగ్ అవుట్ చేయాలనుకుంటున్నారా?';

  @override
  String get logoutSuccess => 'విజయవంతంగా లాగ్ అవుట్ అయ్యింది!';

  @override
  String get welcomeBack => 'మళ్లీ స్వాగతం! 👋';

  @override
  String get voiceBankingDashboard => 'మీ వాయిస్ బ్యాంకింగ్ డాష్‌బోర్డ్';

  @override
  String get availableBalance => 'అందుబాటులో ఉన్న బ్యాలెన్స్';

  @override
  String get viewAll => 'అన్నీ చూడండి';

  @override
  String get voice => 'వాయిస్';

  @override
  String get stop => 'ఆపు';

  @override
  String get cancel => 'రద్దు చేయి';

  @override
  String get welcomeTo => 'స్వాగతం';

  @override
  String get experienceBanking => 'వాయిస్ శక్తితో బ్యాంకింగ్‌ను అనుభవించండి';

  @override
  String get enterMobileNumber => 'మొబైల్ నంబర్‌ను నమోదు చేయండి';

  @override
  String get weWillSendOtp => 'మీ నంబర్‌ను ధృవీకరించడానికి మేము మీకు OTP పంపుతాము';

  @override
  String get mobileNumber => 'మొబైల్ నంబర్';

  @override
  String get enterYourMobileNumber => 'మీ 10-అంకెల మొబైల్ నంబర్‌ను నమోదు చేయండి';

  @override
  String get sendOtp => 'OTP పంపండి';

  @override
  String get pleaseEnterValidMobile => 'దయచేసి చెల్లుబాటు అయ్యే 10-అంకెల మొబైల్ నంబర్‌ను నమోదు చేయండి';

  @override
  String get verifyYourPhone => 'మీ ఫోన్‌ను ధృవీకరించండి';

  @override
  String get weHaveSentCode => 'మేము మీ ఫోన్‌కు 6-అంకెల కోడ్‌ను పంపాము';

  @override
  String get enterVerificationCode => 'ధృవీకరణ కోడ్‌ను నమోదు చేయండి';

  @override
  String get enterSixDigitCode => 'మీ ఫోన్‌కు పంపిన 6-అంకెల కోడ్‌ను నమోదు చేయండి';

  @override
  String get verifyOtp => 'OTP ధృవీకరించండి';

  @override
  String get didntReceiveCode => 'కోడ్ రాలేదా? ';

  @override
  String resendIn(Object seconds) {
    return '$seconds సెకన్లలో మళ్లీ పంపండి';
  }

  @override
  String get resendOtp => 'OTP మళ్లీ పంపండి';

  @override
  String get otpValidFor => 'మీ OTP 5 నిమిషాలకు చెల్లుబాటు అవుతుంది మరియు ఒకసారి మాత్రమే ఉపయోగించవచ్చు.';

  @override
  String get secureVerification => 'AI ద్వారా నడపబడే సురక్షిత ధృవీకరణ';

  @override
  String get otpVerifiedSuccessfully => '✅ OTP విజయవంతంగా ధృవీకరించబడింది!';

  @override
  String get invalidOtp => '❌ చెల్లని OTP, దయచేసి మళ్లీ ప్రయత్నించండి';

  @override
  String newOtpSent(Object mobileNumber) {
    return ' కొత్త OTP $mobileNumber కు పంపబడింది';
  }

  @override
  String get pleaseEnterOtp => 'దయచేసి OTP నమోదు చేయండి';

  @override
  String get otpMustBeSixDigits => 'OTP 6 అంకెలుగా ఉండాలి';

  @override
  String get whyChooseVoiceBanking => 'వాయిస్ బ్యాంకింగ్‌ను ఎందుకు ఎంచుకోవాలి?';

  @override
  String get voiceCommands => 'వాయిస్ కమాండ్‌లు';

  @override
  String get controlWithVoice => 'మీ వాయిస్‌తో నియంత్రించండి';

  @override
  String get secure => 'సురక్షిత';

  @override
  String get bankGradeSecurity => 'బ్యాంక్-గ్రేడ్ సురక్ష';

  @override
  String get multiLanguage => 'బహుభాషా';

  @override
  String get supportForLanguages => '10+ భాషలకు మద్దతు';

  @override
  String get fast => 'వేగవంతమైన';

  @override
  String get quickTransactions => 'త్వరిత లావాదేవీలు';

  @override
  String get poweredByAI => 'AI సాంకేతికవిద్య ద్వారా నడపబడుతోంది';

  @override
  String get paymentInitiated => 'చెల్లింపు ప్రారంభించబడింది ';

  @override
  String get viewAllTransactions => 'అన్ని లావాదేవీలను చూడండి';

  @override
  String get aiIsSpeaking => 'AI మాట్లాడుతోంది…';

  @override
  String get validationRequired => 'ఈ ఫీల్డ్ అవసరం';

  @override
  String get validationEmail => 'దయచేసి చెల్లుబాటు అయ్యే ఇమెయిల్ నమోదు చేయండి';

  @override
  String get validationPhone => 'దయచేసి చెల్లుబాటు అయ్యే ఫోన్ నంబర్ నమోదు చేయండి';

  @override
  String get validationOtp => 'దయచేసి చెల్లుబాటు అయ్యే OTP నమోదు చేయండి';

  @override
  String get allTransactions => 'అన్ని లావాదేవీలు';

  @override
  String get transactions => 'లావాదేవీలు';

  @override
  String get loading => 'లోడ్ అవుతోంది...';

  @override
  String get errorLoadingTransactions => 'లావాదేవీలను లోడ్ చేయడంలో లోపం';

  @override
  String get retry => 'మళ్లీ ప్రయత్నించండి';

  @override
  String get noTransactionsFound => 'లావాదేవీలు ఏవీ కనుగొనబడలేదు';

  @override
  String get noTransactionsDescription => 'మీకు ఇంకా లావాదేవీలు లేవు';

  @override
  String get faq => 'తరచుగా అడిగే ప్రశ్నలు';

  @override
  String get frequentlyAskedQuestions => 'తరచుగా అడిగే ప్రశ్నలు';

  @override
  String get learnHowToUseVoiceBanking => 'వాయిస్ బ్యాంకింగ్‌ను ప్రభావవంతంగా ఎలా ఉపయోగించాలో నేర్చుకోండి';

  @override
  String get whatToSpeak => 'ఏమి మాట్లాడాలి';

  @override
  String get whatToSpeakDescription => 'ఉదాహరణకు, నా ప్రస్తుత బ్యాలెన్స్ ఎంత అని మీరు అడగవచ్చు';

  @override
  String get howToCheckTransactions => 'లావాదేవీలను ఎలా తనిఖీ చేయాలి';

  @override
  String get howToCheckTransactionsDescription => 'నా చివరి x లావాదేవీలు ఏమిటి అని మీరు అడగవచ్చు';

  @override
  String get voiceCommandsDescription => 'స్పష్టంగా మరియు సహజంగా మాట్లాడండి. సిస్టమ్ సంభాషణ భాషను అర్థం చేసుకుంటుంది.';

  @override
  String get supportedLanguages => 'మద్దతు ఉన్న భాషలు';

  @override
  String get supportedLanguagesDescription => 'ప్రస్తుతం ఆంగ్లం, హిందీ, బెంగాలీ, గుజరాతీ, కన్నడ, మలయాళం, మరాఠీ, పంజాబీ, తమిళం మరియు తెలుగు భాషలకు మద్దతు ఇస్తుంది.';

  @override
  String get privacySecurity => 'గోప్యత మరియు భద్రత';

  @override
  String get privacySecurityDescription => 'మీ వాయిస్ డేటా సురక్షితంగా ప్రాసెస్ చేయబడుతుంది మరియు శాశ్వతంగా నిల్వ చేయబడదు.';

  @override
  String get proTips => 'వృత్తిపరమైన చిట్కాలు';

  @override
  String get tipQuietEnvironment => 'మెరుగైన గుర్తింపు కోసం నిశ్శబ్ద వాతావరణంలో మాట్లాడండి';

  @override
  String get tipNaturalLanguage => 'సహజ భాషను ఉపయోగించండి ఉదాహరణకు \"నా బ్యాలెన్స్ చూపించండి\"';

  @override
  String get tipWaitForIndicator => 'మాట్లాడే ముందు వినే సూచిక కోసం వేచి ఉండండి';

  @override
  String get needMoreHelp => 'మరింత సహాయం కావాలా?';

  @override
  String get contactSupportDescription => 'అదనపు సహాయం కోసం మా మద్దతు బృందాన్ని సంప్రదించండి';
}
