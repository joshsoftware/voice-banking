// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get appTitle => 'લિંગો વૉઇસ બેંકિંગ';

  @override
  String get loginPrompt => 'તમારો મોબાઇલ નંબર દાખલ કરો';

  @override
  String get otpPrompt => 'OTP દાખલ કરો';

  @override
  String get micHint => 'બોલવા માટે માઇક પર ટેપ કરો';

  @override
  String get tapToSpeak => 'બોલવા ટેપ કરો';

  @override
  String get listening => 'સાંભળી રહ્યા છીએ...';

  @override
  String get transcribing => 'લખાણમાં રૂપાંતર થઈ રહ્યું છે...';

  @override
  String get executing => 'તમારી વિનંતી પ્રક્રિયા કરવામાં આવી રહી છે...';

  @override
  String get otpSuccess => 'OTP સફળતાપૂર્વક ચકાસાયો!';

  @override
  String balanceResponse(Object amount) {
    return 'તમારું વર્તમાન બેલન્સ $amount રૂપિયા છે.';
  }

  @override
  String get failedIntent => 'માફ કરશો, મેં તે સમજી ન શક્યો.';

  @override
  String get recTxns => 'તાજેતરની વ્યવહારો';

  @override
  String get curBalance => 'ઉપલબ્ધ બેલન્સ';

  @override
  String get msgNoTransactionFound => 'કોઈ વ્યવહાર મળ્યા નથી.';

  @override
  String get logout => 'લોગઆઉટ';

  @override
  String get logoutConfirm => 'શું તમે ખરેખર લોગઆઉટ કરવા માંગો છો?';

  @override
  String get logoutSuccess => 'સફળતાપૂર્વક લોગઆઉટ થયા!';

  @override
  String get welcomeBack => 'પાછા સ્વાગત! ';

  @override
  String get voiceBankingDashboard => 'તમારો વૉઇસ બેંકિંગ ડેશબોર્ડ';

  @override
  String get availableBalance => 'ઉપલબ્ધ બેલન્સ';

  @override
  String get viewAll => 'બધા જુઓ';

  @override
  String get voice => 'વૉઇસ';

  @override
  String get stop => 'બંધ કરો';

  @override
  String get cancel => 'રદ કરો';

  @override
  String get stopVoiceBankingConfirm => 'વૉઇસ બેંકિંગ બંધ કરો? તમામ વર્તમાન વૉઇસ પ્રવૃત્તિ રદ કરવામાં આવશે.';

  @override
  String get welcomeTo => 'સ્વાગત છે';

  @override
  String get experienceBanking => 'વૉઇસની શક્તિથી બેંકિંગનો અનુભવ કરો';

  @override
  String get enterMobileNumber => 'મોબાઇલ નંબર દાખલ કરો';

  @override
  String get weWillSendOtp => 'તમારા નંબરને ચકાસવા માટે અમે તમને OTP મોકલીશું';

  @override
  String get mobileNumber => 'મોબાઇલ નંબર';

  @override
  String get enterYourMobileNumber => 'તમારો 10-અંકનો મોબાઇલ નંબર દાખલ કરો';

  @override
  String get sendOtp => 'OTP મોકલો';

  @override
  String get pleaseEnterValidMobile => 'કૃપા કરીને માન્ય 10-અંકનો મોબાઇલ નંબર દાખલ કરો';

  @override
  String get verifyYourPhone => 'તમારો ફોન ચકાસો';

  @override
  String get weHaveSentCode => 'અમે તમારા ફોન પર 6-અંકનો કોડ મોકલ્યો છે';

  @override
  String get enterVerificationCode => 'ચકાસણી કોડ દાખલ કરો';

  @override
  String get enterSixDigitCode => 'તમારા ફોન પર મોકલેલ 6-અંકનો કોડ દાખલ કરો';

  @override
  String get verifyOtp => 'OTP ચકાસો';

  @override
  String get didntReceiveCode => 'કોડ મળ્યો નથી? ';

  @override
  String resendIn(Object seconds) {
    return '$seconds સેકન્ડમાં ફરીથી મોકલો';
  }

  @override
  String get resendOtp => 'OTP ફરીથી મોકલો';

  @override
  String get otpValidFor => 'તમારો OTP 5 મિનિટ માટે માન્ય છે અને ફક્ત એક વાર વપરાય છે.';

  @override
  String get secureVerification => 'AI દ્વારા સંચાલિત સુરક્ષિત ચકાસણી';

  @override
  String get otpVerifiedSuccessfully => '✅ OTP સફળતાપૂર્વક ચકાસાયો!';

  @override
  String get invalidOtp => '❌ અમાન્ય OTP, કૃપા કરીને ફરીથી પ્રયાસ કરો';

  @override
  String newOtpSent(Object mobileNumber) {
    return ' નવો OTP $mobileNumber પર મોકલ્યો';
  }

  @override
  String get pleaseEnterOtp => 'કૃપા કરીને OTP દાખલ કરો';

  @override
  String get otpMustBeSixDigits => 'OTP 6 અંકનો હોવો જોઈએ';

  @override
  String get whyChooseVoiceBanking => 'વૉઇસ બેંકિંગ કેમ પસંદ કરો?';

  @override
  String get voiceCommands => 'વૉઇસ કમાન્ડ';

  @override
  String get controlWithVoice => 'તમારા વૉઇસથી નિયંત્રિત કરો';

  @override
  String get secure => 'સુરક્ષિત';

  @override
  String get bankGradeSecurity => 'બેંક-ગ્રેડ સુરક્ષા';

  @override
  String get multiLanguage => 'બહુભાષી';

  @override
  String get supportForLanguages => '10+ ભાષાઓનો સમર્થન';

  @override
  String get fast => 'ઝડપી';

  @override
  String get quickTransactions => 'ઝડપી વ્યવહાર';

  @override
  String get poweredByAI => 'AI ટેકનોલોજી દ્વારા સંચાલિત';

  @override
  String get paymentInitiated => 'પેમેન્ટ શરૂ કર્યું 🚀';

  @override
  String get viewAllTransactions => 'બધા વ્યવહાર જુઓ';

  @override
  String get aiIsSpeaking => 'AI બોલી રહ્યું છે…';

  @override
  String get validationRequired => 'આ ફીલ્ડ જરૂરી છે';

  @override
  String get validationEmail => 'કૃપા કરીને માન્ય ઇમેઇલ દાખલ કરો';

  @override
  String get validationPhone => 'કૃપા કરીને માન્ય ફોન નંબર દાખલ કરો';

  @override
  String get validationOtp => 'કૃપા કરીને માન્ય OTP દાખલ કરો';

  @override
  String get allTransactions => 'બધા વ્યવહાર';

  @override
  String get transactions => 'વ્યવહાર';

  @override
  String get loading => 'લોડ થઈ રહ્યું છે...';

  @override
  String get errorLoadingTransactions => 'વ્યવહાર લોડ કરવામાં ભૂલ';

  @override
  String get retry => 'ફરીથી પ્રયાસ કરો';

  @override
  String get noTransactionsFound => 'કોઈ વ્યવહાર મળ્યા નથી';

  @override
  String get noTransactionsDescription => 'તમારી પાસે હજુ સુધી કોઈ વ્યવહાર નથી';

  @override
  String get faq => 'વારંવાર પૂછાતા પ્રશ્નો';

  @override
  String get frequentlyAskedQuestions => 'વારંવાર પૂછાતા પ્રશ્નો';

  @override
  String get learnHowToUseVoiceBanking => 'વૉઇસ બેંકિંગનો અસરકારક ઉપયોગ કેવી રીતે કરવો તે શીખો';

  @override
  String get whatToSpeak => 'શું બોલવું';

  @override
  String get whatToSpeakDescription => 'ઉદાહરણ તરીકે, તમે પૂછી શકો છો કે મારું વર્તમાન બેલન્સ કેટલું છે';

  @override
  String get howToCheckTransactions => 'વ્યવહાર કેવી રીતે તપાસવા';

  @override
  String get howToCheckTransactionsDescription => 'તમે પૂછી શકો છો કે મારા છેલ્લા x વ્યવહાર શું છે';

  @override
  String get voiceCommandsDescription => 'સ્પષ્ટ અને કુદરતી રીતે બોલો. સિસ્ટમ વાતચીતની ભાષા સમજે છે.';

  @override
  String get supportedLanguages => 'સમર્થિત ભાષાઓ';

  @override
  String get supportedLanguagesDescription => 'હાલમાં અંગ્રેજી, હિન્દી, બંગાળી, ગુજરાતી, કન્નડ, મલયાલમ, મરાઠી, પંજાબી, તમિલ અને તેલુગુનો સમર્થન કરે છે.';

  @override
  String get privacySecurity => 'ગોપનીયતા અને સુરક્ષા';

  @override
  String get privacySecurityDescription => 'તમારો વૉઇસ ડેટા સુરક્ષિત રીતે પ્રક્રિયા કરવામાં આવે છે અને કાયમી રીતે સંગ્રહિત થતો નથી.';

  @override
  String get proTips => 'વિશેષજ્ઞ સૂચનો';

  @override
  String get tipQuietEnvironment => 'વધુ સારી ઓળખ માટે શાંત વાતાવરણમાં બોલો';

  @override
  String get tipNaturalLanguage => 'કુદરતી ભાષા વાપરો જેમ કે \"મારું બેલન્સ બતાવો\"';

  @override
  String get tipWaitForIndicator => 'બોલતા પહેલા સાંભળવાના સૂચકની રાહ જુઓ';

  @override
  String get needMoreHelp => 'વધુ મદદ જોઈએ?';

  @override
  String get contactSupportDescription => 'વધારાની સહાયતા માટે અમારી સહાયતા ટીમનો સંપર્ક કરો';

  @override
  String balanceSuccess(Object amount) {
    return 'તમારું વર્તમાન બેલન્સ $amount રૂપિયા છે.';
  }

  @override
  String transactionsFound(Object count) {
    return 'અહીં તમારા $count તાજેતરના લેનદેન છે.';
  }

  @override
  String get noTransactions => 'કોઈ લેનદેન મળ્યા નથી.';

  @override
  String transferSuccess(Object amount, Object recipient) {
    return '$recipientને $amount રૂપિયાનું ટ્રાન્સફર સફળતાપૂર્વક શરૂ થયું છે.';
  }

  @override
  String get transferFailed => 'ટ્રાન્સફર નિષ્ફળ. કૃપા કરીને ફરી પ્રયાસ કરો.';

  @override
  String get errorGeneric => 'માફ કરો, ભૂલ આવી. કૃપા કરીને ફરી પ્રયાસ કરો.';

  @override
  String get errorInsufficientFunds => 'અપૂર્ણ નિધિ. કૃપા કરીને તમારું બેલન્સ તપાસો.';

  @override
  String get pleaseSaySomething => 'કૃપા કરીને કંઈક કહો';

  @override
  String get voiceRegistration => 'વૉઇસ નોંધણી';

  @override
  String get pleaseWaitForUpload => 'કૃપા કરીને અપલોડ પૂર્ણ થવા માટે રાહ જુઓ';

  @override
  String get voiceRegistrationCompleted => 'વૉઇસ નોંધણી સફળતાપૂર્વક પૂર્ણ થઈ!';

  @override
  String get unknownState => 'અજ્ઞાત સ્થિતિ';

  @override
  String get uploadingVoiceRecordings => 'વૉઇસ રેકોર્ડિંગ અપલોડ થઈ રહી છે...';

  @override
  String imageNumber(Object number) {
    return 'છબી $number';
  }

  @override
  String get somethingWentWrong => 'કંઈક ખોટું થયું';

  @override
  String get imageNotAvailable => 'છબી ઉપલબ્ધ નથી';

  @override
  String stepOfTotal(Object current, Object total) {
    return 'પગલું $current ના $total';
  }

  @override
  String get describeImageInstruction => 'કૃપા કરીને આ છબીમાં તમે જે જુઓ છો તેનું વર્ણન કરો। સ્પષ્ટ રીતે બોલો અને મુખ્ય તત્વોનું વર્ણન કરો।';

  @override
  String get stopRecording => 'રેકોર્ડિંગ બંધ કરો';

  @override
  String get reRecord => 'ફરીથી રેકોર્ડ કરો';

  @override
  String get startRecording => 'રેકોર્ડિંગ શરૂ કરો';

  @override
  String get recording => 'રેકોર્ડ થઈ રહ્યું છે...';

  @override
  String get stopDescription => 'વર્ણન બંધ કરો';

  @override
  String get playDescription => 'વર્ણન ચલાવો';

  @override
  String get nextStep => 'આગળનું પગલું';

  @override
  String get register => 'નોંધણી કરો';

  @override
  String get pleaseWaitForDescription => 'કૃપા કરીને વર્ણન પૂર્ણ થવા માટે રાહ જુઓ।';

  @override
  String get microphonePermissionRequired => 'માઇક્રોફોન પરવાનગી જરૂરી છે। કૃપા કરીને સેટિંગ્સમાં તેને સક્ષમ કરો।';

  @override
  String failedToStartRecording(Object error) {
    return 'રેકોર્ડિંગ શરૂ કરવામાં અસફળ: $error';
  }

  @override
  String get recordingFailed => 'રેકોર્ડિંગ અસફળ થઈ। કૃપા કરીને ફરી પ્રયાસ કરો।';

  @override
  String get recordingFileNotFound => 'રેકોર્ડિંગ ફાઇલ મળી નથી। કૃપા કરીને ફરી પ્રયાસ કરો।';

  @override
  String get recordingEmpty => 'રેકોર્ડિંગ ખાલી છે। કૃપા કરીને ફરી પ્રયાસ કરો।';

  @override
  String failedToStopRecording(Object error) {
    return 'રેકોર્ડિંગ બંધ કરવામાં અસફળ: $error';
  }

  @override
  String get pleaseStopRecordingBeforePlay => 'કૃપા કરીને વર્ણન ચલાવતા પહેલા રેકોર્ડિંગ બંધ કરો।';

  @override
  String failedToPlayDescription(Object error) {
    return 'વર્ણન ચલાવવામાં અસફળ: $error';
  }

  @override
  String failedToStopDescription(Object error) {
    return 'વર્ણન બંધ કરવામાં અસફળ: $error';
  }

  @override
  String get pleaseRecordBeforeProceeding => 'કૃપા કરીને આગળ વધતા પહેલા તમારો અવાજ રેકોર્ડ કરો।';

  @override
  String get pleaseWaitForRecordingOrDescription => 'કૃપા કરીને રેકોર્ડિંગ અથવા વર્ણન પૂર્ણ થવા માટે રાહ જુઓ।';

  @override
  String get pleaseCompleteAllRecordings => 'કૃપા કરીને સબમિટ કરતા પહેલા બધા 3 રેકોર્ડિંગ પૂર્ણ કરો।';

  @override
  String get userIdNotFound => 'વપરાશકર્તા ID મળ્યું નથી। કૃપા કરીને ફરીથી લૉગ ઇન કરો।';

  @override
  String get recordingFilesMissing => 'એક અથવા વધુ રેકોર્ડિંગ ફાઇલો ગુમ થઈ ગઈ છે।';

  @override
  String get imageDescriptionBoardMeeting => 'એક પેશાવર વ્યક્તિ શહેરના દૃશ્યાવલીવાળી આકાશરેખા જોતી આધુનિક, સૂર્યપ્રકાશિત ઓફિસ બોર્ડરૂમમાં સહકર્મચારીઓને ડેટા પ્રસ્તુતિ આપે છે।';

  @override
  String get imageDescriptionBoyWithDog => 'ચશ્મા પહેરેલો એક છોકરો ધૂપભર્યા પાર્કના રસ્તા પર હસ્કી કૂતરો ચલાવે છે, પટ્ટો પકડીને મુસ્કુરાતો.';

  @override
  String get imageDescriptionChildrenPainting => 'પાંચ બાળકો મોટી બારીની નજીક કાર્પેટ પર બેસીને ઉજ્જવલ લિવિંગ રૂમમાં મળીને રંગબેરંગી ચિત્રો ખુશીથી દોરે છે।';

  @override
  String get imageDescriptionChildrenWithDog => 'ચાર બાળકો લીલા બગીચામાં બે કૂતરાઓ સાથે ખુશીથી ખેલે છે, ઉજ્જવલ દોપહરે ફ્રિસબી ફેંકે છે।';

  @override
  String get imageDescriptionConstructionSite => 'ચાર નિર્માણ પેશાવરો સલામતી વેસ્ટ અને હાર્ડ હેટ પહેરી ધૂળભરી સાઇટ પર મોટા આર્કિટેક્ચરલ બિલ્ડિંગ બ્લુપ્રિન્ટની કાળજીથી સમીક્ષા કરે છે।';

  @override
  String get imageDescriptionFamilyDinner => 'ચાર સભ્યોનો ખુશહાલ પરિવાર રેસ્ટોરાંમાં પરંપરાગત ભારતીય રાત્રિભોજન ભોગવે છે, ગરમ વાતાવરણમાં ખોરાક અને હાસ્ય શેર કરે છે।';

  @override
  String get imageDescriptionHoliCelebration => 'પરિવાર અને મિત્રોનો આનંદિત સમૂહ હોળી ઉજવે છે, હવામાં રંગીન પાવડરના જોરદાર વિસ્ફોટ વચ્ચે એકસાથે હસે છે।';

  @override
  String get imageDescriptionLadyPainting => 'એક યુવતી તેના સૂર્યભર્યા, આરામદાયક ઘરના આર્ટ સ્ટુડિયોમાં કેનવાસ પર સુંદર પીળા લેન્ડસ્કેપ દોરવા પર ધ્યાન કેન્દ્રિત કરે છે।';

  @override
  String get imageDescriptionMomAndSon => 'એક માતા તેના નાના દીકરાને સ્ટોવ પર રસોઈ કરવામાં મદદ કરે છે, ઉજ્જવલ આધુનિક સફેદ રસોડામાં લાકડાના સ્ટૂલ પર ઊભી રહીને।';

  @override
  String get imageDescriptionPeopleDiwaliCelebration => 'પરંપરાગત પોશાકમાં લોકો સજાવટી શેરી પર દીવાળી ઉજવે છે, જીવંત લાલટણો, ઝગમગતા દીવાસ અને ઉપર શાનદાર આતિશબાજી સાથે।';

  @override
  String get imageDescriptionTajMahal => 'ડેનિમ જેકેટ પહેરેલા યુવા મિત્રોનો સમૂહ છત પર ઊભો છે, કોફી પકડી પાછળ તાજ મહલ સાથે મુસ્કુરાતા.';

  @override
  String get imageDescriptionVillageScene => 'એક વૃદ્ધ કિસાન સોનેરી સૂર્યાસ્ત દરમિયાન મોટી ફસલ લદેલી લાકડાની બળદગાડી પર બેઠો છે, બે સફેદ બળદ ખેંચે છે।';

  @override
  String get imageDescriptionWomenDiwaliCelebration => 'ગુલાબી પરંપરાગત પોશાકમાં એક સ્ત્રી ઝગમગતા તેલના દીવાસોથી ઘેરાયેલી જમીન પર સુંદર રંગીન રંગોળી કાળજીથી બનાવે છે।';

  @override
  String get resetVoice => 'વૉઇસ રીસેટ કરો';

  @override
  String get resetVoiceConfirm => 'આ તમારું વૉઇસ પ્રોફાઇલ દૂર કરશે. તમારે ફરી વૉઇસ નોંધણી પૂર્ણ કરવી પડશે. ચાલુ રાખવું છે?';

  @override
  String get resetVoiceSuccess => 'વૉઇસ સફળતાપૂર્વક રીસેટ થયું. કૃપા કરીને ફરી નોંધણી પૂર્ણ કરો.';

  @override
  String get resetVoiceError => 'વૉઇસ રીસેટ કરવામાં નિષ્ફળ. કૃપા કરીને ફરી પ્રયાસ કરો.';
}
