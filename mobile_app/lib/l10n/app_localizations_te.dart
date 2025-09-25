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
