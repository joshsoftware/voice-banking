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
  String get tapToSpeak => 'మాట్లాడడానికి ట్యాప్ చేయండి';

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
  String get stopVoiceBankingConfirm => 'వాయిస్ బ్యాంకింగ్ ఆపాలా? అన్ని ప్రస్తుత వాయిస్ కార్యకలాపాలు రద్దు చేయబడతాయి.';

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

  @override
  String balanceSuccess(Object amount) {
    return 'మీ ప్రస్తుత బ్యాలెన్స్ $amount రూపాయలు.';
  }

  @override
  String transactionsFound(Object count) {
    return 'ఇక్కడ మీ $count ఇటీవలి లావాదేవీలు.';
  }

  @override
  String get noTransactions => 'లావాదేవీలు ఏవీ కనుగొనబడలేదు.';

  @override
  String transferSuccess(Object amount, Object recipient) {
    return '$recipientకు $amount రూపాయల బదిలీ విజయవంతంగా ప్రారంభించబడింది.';
  }

  @override
  String get transferFailed => 'బదిలీ విఫలమైంది. దయచేసి మళ్ళీ ప్రయత్నించండి.';

  @override
  String get errorGeneric => 'క్షమించండి, లోపం సంభవించింది. దయచేసి మళ్ళీ ప్రయత్నించండి.';

  @override
  String get errorInsufficientFunds => 'తగినంత నిధులు లేవు. దయచేసి మీ బ్యాలెన్స్ తనిఖీ చేయండి.';

  @override
  String get pleaseSaySomething => 'దయచేసి ఏదైనా చెప్పండి';

  @override
  String get voiceRegistration => 'వాయిస్ నమోదు';

  @override
  String get pleaseWaitForUpload => 'దయచేసి అప్‌లోడ్ పూర్తి కావడానికి వేచి ఉండండి';

  @override
  String get voiceRegistrationCompleted => 'వాయిస్ నమోదు విజయవంతంగా పూర్తయింది!';

  @override
  String get unknownState => 'తెలియని స్థితి';

  @override
  String get uploadingVoiceRecordings => 'వాయిస్ రికార్డింగ్‌లు అప్‌లోడ్ అవుతున్నాయి...';

  @override
  String imageNumber(Object number) {
    return 'చిత్రం $number';
  }

  @override
  String get somethingWentWrong => 'ఏదో తప్పు జరిగింది';

  @override
  String get imageNotAvailable => 'చిత్రం అందుబాటులో లేదు';

  @override
  String stepOfTotal(Object current, Object total) {
    return 'దశ $current లో $total';
  }

  @override
  String get describeImageInstruction => 'దయచేసి ఈ చిత్రంలో మీరు చూసే దానిని వివరించండి। స్పష్టంగా మాట్లాడండి మరియు ప్రధాన అంశాలను వివరించండి।';

  @override
  String get stopRecording => 'రికార్డింగ్ ఆపండి';

  @override
  String get reRecord => 'మళ్లీ రికార్డ్ చేయండి';

  @override
  String get startRecording => 'రికార్డింగ్ ప్రారంభించండి';

  @override
  String get recording => 'రికార్డ్ అవుతోంది...';

  @override
  String get stopDescription => 'వివరణ ఆపండి';

  @override
  String get playDescription => 'వివరణ ప్లే చేయండి';

  @override
  String get nextStep => 'తర్వాతి దశ';

  @override
  String get register => 'నమోదు చేయండి';

  @override
  String get pleaseWaitForDescription => 'దయచేసి వివరణ ముగియడానికి వేచి ఉండండి।';

  @override
  String get microphonePermissionRequired => 'మైక్రోఫోన్ అనుమతి అవసరం। దయచేసి సెట్టింగ్‌లలో దీన్ని ప్రారంభించండి।';

  @override
  String failedToStartRecording(Object error) {
    return 'రికార్డింగ్ ప్రారంభించడంలో విఫలమైంది: $error';
  }

  @override
  String get recordingFailed => 'రికార్డింగ్ విఫలమైంది। దయచేసి మళ్లీ ప్రయత్నించండి।';

  @override
  String get recordingFileNotFound => 'రికార్డింగ్ ఫైల్ కనుగొనబడలేదు। దయచేసి మళ్లీ ప్రయత్నించండి।';

  @override
  String get recordingEmpty => 'రికార్డింగ్ ఖాళీగా ఉంది। దయచేసి మళ్లీ ప్రయత్నించండి।';

  @override
  String failedToStopRecording(Object error) {
    return 'రికార్డింగ్ ఆపడంలో విఫలమైంది: $error';
  }

  @override
  String get pleaseStopRecordingBeforePlay => 'దయచేసి వివరణ ప్లే చేయడానికి ముందు రికార్డింగ్ ఆపండి।';

  @override
  String failedToPlayDescription(Object error) {
    return 'వివరణ ప్లే చేయడంలో విఫలమైంది: $error';
  }

  @override
  String failedToStopDescription(Object error) {
    return 'వివరణ ఆపడంలో విఫలమైంది: $error';
  }

  @override
  String get pleaseRecordBeforeProceeding => 'దయచేసి ముందుకు వెళ్లడానికి ముందు మీ వాయిస్‌ను రికార్డ్ చేయండి।';

  @override
  String get pleaseWaitForRecordingOrDescription => 'దయచేసి రికార్డింగ్ లేదా వివరణ పూర్తి కావడానికి వేచి ఉండండి।';

  @override
  String get pleaseCompleteAllRecordings => 'దయచేసి సమర్పించడానికి ముందు అన్ని 3 రికార్డింగ్‌లను పూర్తి చేయండి।';

  @override
  String get userIdNotFound => 'వినియోగదారు ID కనుగొనబడలేదు। దయచేసి మళ్లీ లాగిన్ చేయండి।';

  @override
  String get recordingFilesMissing => 'ఒకటి లేదా అంతకంటే ఎక్కువ రికార్డింగ్ ఫైళ్లు లేవు।';

  @override
  String get imageDescriptionCooking => 'ఒక మహిళ స్టవ్‌లో ఒక పాత్రలో ఏదో కదిలిస్తోంది, పక్కన ఒక మనిషి ఒక మిక్సింగ్ బౌల్ పట్టుకుని నిలబడి ఉన్నాడు। వారు కూడా వంటగదిలో ఆహారం తయారు చేస్తున్నట్లు కనిపిస్తోంది। దృశ్యం వెచ్చని మరియు సహకారంతో కూడినదిగా కనిపిస్తోంది।';

  @override
  String get imageDescriptionLaptop => 'ఒక యువతి ఒక డెస్క్‌లో కూర్చుని తన ల్యాప్‌టాప్‌లో పని చేస్తోంది। టేబుల్‌లో పుస్తకాలు మరియు ఒక కాఫీ కప్ ఉంది, మరియు గది చుట్టూ అనేక మొక్కలు ఉంచబడ్డాయి। స్థలం సౌకర్యవంతంగా మరియు ఇంటి నుండి పని చేయడానికి అనుకూలంగా కనిపిస్తోంది।';

  @override
  String get imageDescriptionCoffee => 'ముగ్గురు వ్యక్తులు ఒక సౌకర్యవంతమైన కాఫీలో చిన్న టేబుల్‌లలో కూర్చుని ఉన్నారు। వారిలో ఇద్దరు టీ మరియు కేక్ తింటూ మాట్లాడుతున్నారు, మరియు మరొక మహిళ దగ్గర కూర్చుని ఒక పిల్లిని పట్టుకుని ఉంది। నేలపై ఒక కుక్క పడుకుని ఉంది, మరియు వాతావరణం ప్రశాంతంగా మరియు స్నేహపూర్వకంగా కనిపిస్తోంది।';

  @override
  String get imageDescriptionConstruction => 'ముగ్గురు నిర్మాణ కార్మికులు హెల్మెట్‌లు ధరించి ఒక భవన ప్రణాళికను చర్చిస్తున్నారు। ఒక వ్యక్తి ఒక బోర్డ్‌లో ప్రదర్శించబడిన పెద్ద బ్లూప్రింట్‌ను సూచిస్తున్నాడు। బృందం ఒక నిర్మాణ ప్రాజెక్ట్‌ను ప్రణాళిక చేస్తోంది లేదా సమీక్షిస్తోంది।';

  @override
  String get imageDescriptionCrossing => 'ఒక యువకుడు ఒక వృద్ధ మహిళకు ఒక పాదచారి క్రాసింగ్‌లో రోడ్‌ను దాటడంలో సహాయం చేస్తున్నాడు। దగ్గరలో ట్రాఫిక్ సిగ్నల్‌లు మరియు ఒక కారు వేచి ఉంది। దృశ్యం ఒక నగర వాతావరణంలో దయ మరియు భద్రతను చూపిస్తోంది।';
}
