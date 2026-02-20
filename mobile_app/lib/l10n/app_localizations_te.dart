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
  String get imageDescriptionBoardMeeting => 'ఒక ప్రొఫెషనల్ వ్యక్తి నగర దృశ్యాన్ని చూసే ఆధునిక, సూర్యకాంతి నిండిన ఆఫీస్ బోర్డ్ రూమ్‌లో సహోద్యోగులకు డేటా ప్రదర్శన ఇస్తున్నాడు.';

  @override
  String get imageDescriptionBoyWithDog => 'అద్దాలు ధరించిన అబ్బాయి సూర్యకాంతి నిండిన పార్క్ మార్గంలో హస్కీ కుక్కను నడిపిస్తూ చిక్కు పట్టుకుని చిరునవ్వు నవ్వుతున్నాడు.';

  @override
  String get imageDescriptionChildrenPainting => 'ఐదుగురు పిల్లలు పెద్ద కిటికీ దగ్గర కార్పెట్ మీద కూర్చుని ప్రకాశవంతమైన లివింగ్ రూమ్‌లో కలిసి రంగురంగుల చిత్రాలను సంతోషంగా వేస్తున్నారు.';

  @override
  String get imageDescriptionChildrenWithDog => 'నలుగురు పిల్లలు పచ్చని తోటలో రెండు కుక్కలతో సంతోషంగా ఆడుతున్నారు, ప్రకాశవంతమైన మధ్యాహ్నంలో ఫ్రిస్బీ విసిరేస్తున్నారు.';

  @override
  String get imageDescriptionConstructionSite => 'నలుగురు నిర్మాణ ప్రొఫెషనల్స్ భద్రతా వెస్ట్‌లు మరియు హార్డ్ హ్యాట్‌లు ధరించి ధూళి నిండిన సైట్‌లో పెద్ద ఆర్కిటెక్చరల్ బిల్డింగ్ బ్లూప్రింట్‌ను జాగ్రత్తగా సమీక్షిస్తున్నారు.';

  @override
  String get imageDescriptionFamilyDinner => 'నలుగురు సభ్యుల సంతోషకరమైన కుటుంబం రెస్టారెంట్‌లో సాంప్రదాయ భారతీయ రాత్రి భోజనం ఆస్వాదిస్తోంది, వెచ్చని వాతావరణంలో ఆహారం మరియు నవ్వు పంచుకుంటోంది.';

  @override
  String get imageDescriptionHoliCelebration => 'కుటుంబం మరియు స్నేహితుల సంతోషకరమైన గుంపు హోలి జరుపుకుంటోంది, గాలిలో రంగురంగుల పొడి పేలుడు మధ్యలో కలిసి నవ్వుతోంది.';

  @override
  String get imageDescriptionLadyPainting => 'ఒక యువతి తన సూర్యకాంతి నిండిన, సుఖకరమైన ఇంటి ఆర్ట్ స్టూడియోలో కెన్వాస్ మీద అందమైన పసుపు ల్యాండ్‌స్కేప్ వేయడంపై దృష్టి పెడుతోంది.';

  @override
  String get imageDescriptionMomAndSon => 'ఒక తల్లి తన చిన్న కుమారుడికి స్టోవ్ వద్ద వంట చేయడంలో సహాయం చేస్తోంది, ప్రకాశవంతమైన ఆధునిక తెల్ల వంటగదిలో చెక్క స్టూల్ మీద నిలబడి.';

  @override
  String get imageDescriptionPeopleDiwaliCelebration => 'సాంప్రదాయ వేషధారణలో ఉన్న వ్యక్తులు అలంకరించిన వీధిలో దీపావళి జరుపుకుంటున్నారు, ప్రకాశవంతమైన లాంతర్లు, మెరిసే దీపాలు మరియు పైన అద్భుతమైన అతిస్ఫోటన.';

  @override
  String get imageDescriptionTajMahal => 'డెనిమ్ జాకెట్లు ధరించిన యువ స్నేహితుల గుంపు పైకప్పుపై నిలబడి కాఫీ పట్టుకుని వెనుక తాజ్ మహల్ తో చిరునవ్వు నవ్వుతోంది.';

  @override
  String get imageDescriptionVillageScene => 'ఒక వృద్ధ రైతు స్వర్ణ సూర్యాస్తమయ సమయంలో పెద్ద పంటను మోసే చెక్క బుల్లock కార్ట్ మీద కూర్చుని ఉన్నాడు, రెండు తెల్ల ఎద్దులు లాగుతున్నాయి.';

  @override
  String get imageDescriptionWomenDiwaliCelebration => 'పింక్ సాంప్రదాయ వస్త్రం ధరించిన మహిళ మెరిసే నూనె దీపాలతో చుట్టుకొన్న నేల మీద అందమైన రంగురంగుల రంగోలిని జాగ్రత్తగా సృష్టిస్తోంది.';

  @override
  String get resetVoice => 'వాయిస్ రీసెట్ చేయి';

  @override
  String get resetVoiceConfirm => 'ఇది మీ వాయిస్ ప్రొఫైల్‌ను తొలగిస్తుంది. మీరు మళ్ళీ వాయిస్ నమోదును పూర్తి చేయాలి. కొనసాగించాలా?';

  @override
  String get resetVoiceSuccess => 'వాయిస్ విజయవంతంగా రీసెట్ చేయబడింది. మళ్ళీ నమోదు పూర్తి చేయండి.';

  @override
  String get resetVoiceError => 'వాయిస్ రీసెట్ చేయడంలో విఫలమైంది. మళ్ళీ ప్రయత్నించండి.';

  @override
  String get audioStorageConsentTitle => 'ఆడియో నిల్వ సమ్మతి';

  @override
  String get audioStorageConsentMessage => 'వాయిస్ బ్యాంకింగ్ ఉపయోగించడానికి, ప్రమాణీకరణ మరియు ప్రాసెసింగ్ కోసం మేము మీ వాయిస్ రికార్డింగ్‌లను మా సిస్టమ్‌లో నిల్వ చేయాలి. మీ ఆడియోను మాతో నిల్వ చేయడానికి మీరు అంగీకరిస్తున్నారా?';

  @override
  String get acceptConsent => 'నేను అంగీకరిస్తాను';

  @override
  String get declineConsent => 'నేను తిరస్కరిస్తాను';
}
