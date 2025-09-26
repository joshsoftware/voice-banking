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
}
