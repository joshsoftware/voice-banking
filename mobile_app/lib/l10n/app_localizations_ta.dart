// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'லிங்கோ வாய்ஸ் பேங்கிங்';

  @override
  String get loginPrompt => 'உங்கள் மொபைல் எண்ணை உள்ளிடவும்';

  @override
  String get otpPrompt => 'OTP உள்ளிடவும்';

  @override
  String get micHint => 'பேச மைக் டேப் செய்யவும்';

  @override
  String get listening => 'கேட்டுக்கொண்டிருக்கிறது...';

  @override
  String get transcribing => 'எழுதிக்கொண்டிருக்கிறது...';

  @override
  String get executing => 'உங்கள் கோரிக்கையை செயலாக்குகிறது...';

  @override
  String get otpSuccess => 'OTP வெற்றிகரமாக சரிபார்க்கப்பட்டது!';

  @override
  String balanceResponse(Object amount) {
    return 'உங்கள் தற்போதைய இருப்பு $amount ரூபாய்.';
  }

  @override
  String get failedIntent => 'மன்னிக்கவும், எனக்கு அது புரியவில்லை.';

  @override
  String get recTxns => 'சமீபத்திய பரிவர்த்தனைகள்';

  @override
  String get curBalance => 'கிடைக்கும் இருப்பு';

  @override
  String get msgNoTransactionFound => 'பரிவர்த்தனைகள் எதுவும் கிடைக்கவில்லை.';

  @override
  String get logout => 'வெளியேறு';

  @override
  String get logoutConfirm => 'நீங்கள் உண்மையில் வெளியேற விரும்புகிறீர்களா?';

  @override
  String get logoutSuccess => 'வெற்றிகரமாக வெளியேறியது!';

  @override
  String get welcomeBack => 'மீண்டும் வரவேற்கிறோம்! ';

  @override
  String get voiceBankingDashboard => 'உங்கள் வாய்ஸ் பேங்கிங் டாஷ்போர்டு';

  @override
  String get availableBalance => 'கிடைக்கும் இருப்பு';

  @override
  String get viewAll => 'அனைத்தையும் பார்க்க';

  @override
  String get voice => 'வாய்ஸ்';

  @override
  String get stop => 'நிறுத்து';

  @override
  String get cancel => 'ரத்து செய்';

  @override
  String get welcomeTo => 'வரவேற்கிறோம்';

  @override
  String get experienceBanking => 'வாய்ஸின் சக்தியால் பேங்கிங் அனுபவிக்கவும்';

  @override
  String get enterMobileNumber => 'மொபைல் எண்ணை உள்ளிடவும்';

  @override
  String get weWillSendOtp => 'உங்கள் எண்ணை சரிபார்க்க நாங்கள் உங்களுக்கு OTP அனுப்புவோம்';

  @override
  String get mobileNumber => 'மொபைல் எண்';

  @override
  String get enterYourMobileNumber => 'உங்கள் 10-இலக்க மொபைல் எண்ணை உள்ளிடவும்';

  @override
  String get sendOtp => 'OTP அனுப்பு';

  @override
  String get pleaseEnterValidMobile => 'தயவுசெய்து சரியான 10-இலக்க மொபைல் எண்ணை உள்ளிடவும்';

  @override
  String get verifyYourPhone => 'உங்கள் தொலைபேசியை சரிபார்க்கவும்';

  @override
  String get weHaveSentCode => 'உங்கள் தொலைபேசியில் 6-இலக்க குறியீட்டை அனுப்பியுள்ளோம்';

  @override
  String get enterVerificationCode => 'சரிபார்ப்பு குறியீட்டை உள்ளிடவும்';

  @override
  String get enterSixDigitCode => 'உங்கள் தொலைபேசியில் அனுப்பப்பட்ட 6-இலக்க குறியீட்டை உள்ளிடவும்';

  @override
  String get verifyOtp => 'OTP சரிபார்க்கவும்';

  @override
  String get didntReceiveCode => 'குறியீடு கிடைக்கவில்லையா? ';

  @override
  String resendIn(Object seconds) {
    return '$seconds வினாடிகளில் மீண்டும் அனுப்பு';
  }

  @override
  String get resendOtp => 'OTP மீண்டும் அனுப்பு';

  @override
  String get otpValidFor => 'உங்கள் OTP 5 நிமிடங்களுக்கு செல்லுபடியாகும் மற்றும் ஒரு முறை மட்டுமே பயன்படுத்தலாம்.';

  @override
  String get secureVerification => 'AI மூலம் இயக்கப்படும் பாதுகாப்பான சரிபார்ப்பு';

  @override
  String get otpVerifiedSuccessfully => '✅ OTP வெற்றிகரமாக சரிபார்க்கப்பட்டது!';

  @override
  String get invalidOtp => '❌ தவறான OTP, தயவுசெய்து மீண்டும் முயற்சிக்கவும்';

  @override
  String newOtpSent(Object mobileNumber) {
    return ' புதிய OTP $mobileNumber க்கு அனுப்பப்பட்டது';
  }

  @override
  String get pleaseEnterOtp => 'தயவுசெய்து OTP உள்ளிடவும்';

  @override
  String get otpMustBeSixDigits => 'OTP 6 இலக்கங்களாக இருக்க வேண்டும்';

  @override
  String get whyChooseVoiceBanking => 'வாய்ஸ் பேங்கிங் ஏன் தேர்ந்தெடுக்க வேண்டும்?';

  @override
  String get voiceCommands => 'வாய்ஸ் கட்டளைகள்';

  @override
  String get controlWithVoice => 'உங்கள் வாய்ஸ் மூலம் கட்டுப்படுத்தவும்';

  @override
  String get secure => 'பாதுகாப்பான';

  @override
  String get bankGradeSecurity => 'வங்கி-தர பாதுகாப்பு';

  @override
  String get multiLanguage => 'பல மொழி';

  @override
  String get supportForLanguages => '10+ மொழிகளுக்கு ஆதரவு';

  @override
  String get fast => 'வேகமான';

  @override
  String get quickTransactions => 'விரைவான பரிவர்த்தனைகள்';

  @override
  String get poweredByAI => 'AI தொழில்நுட்பத்தால் இயக்கப்படுகிறது';

  @override
  String get paymentInitiated => 'பணம் செலுத்துதல் தொடங்கப்பட்டது ';

  @override
  String get viewAllTransactions => 'அனைத்து பரிவர்த்தனைகளையும் பார்க்க';

  @override
  String get aiIsSpeaking => 'AI பேசிக்கொண்டிருக்கிறது…';

  @override
  String get validationRequired => 'இந்த புலம் தேவை';

  @override
  String get validationEmail => 'தயவுசெய்து சரியான மின்னஞ்சலை உள்ளிடவும்';

  @override
  String get validationPhone => 'தயவுசெய்து சரியான தொலைபேசி எண்ணை உள்ளிடவும்';

  @override
  String get validationOtp => 'தயவுசெய்து சரியான OTP உள்ளிடவும்';

  @override
  String get allTransactions => 'அனைத்து பரிவர்த்தனைகள்';

  @override
  String get transactions => 'பரிவர்த்தனைகள்';

  @override
  String get loading => 'ஏற்றுகிறது...';

  @override
  String get errorLoadingTransactions => 'பரிவர்த்தனைகளை ஏற்றுவதில் பிழை';

  @override
  String get retry => 'மீண்டும் முயற்சிக்கவும்';

  @override
  String get noTransactionsFound => 'பரிவர்த்தனைகள் எதுவும் கிடைக்கவில்லை';

  @override
  String get noTransactionsDescription => 'உங்களிடம் இன்னும் பரிவர்த்தனைகள் எதுவும் இல்லை';

  @override
  String get faq => 'அடிக்கடி கேட்கப்படும் கேள்விகள்';

  @override
  String get frequentlyAskedQuestions => 'அடிக்கடி கேட்கப்படும் கேள்விகள்';

  @override
  String get learnHowToUseVoiceBanking => 'வாய்ஸ் பேங்கிங் திறம்பட எவ்வாறு பயன்படுத்துவது என்பதைக் கற்றுக்கொள்ளுங்கள்';

  @override
  String get whatToSpeak => 'என்ன பேச வேண்டும்';

  @override
  String get whatToSpeakDescription => 'உதாரணமாக, எனது தற்போதைய இருப்பு எவ்வளவு என்று நீங்கள் கேட்கலாம்';

  @override
  String get howToCheckTransactions => 'பரிவர்த்தனைகளை எவ்வாறு சரிபார்க்கலாம்';

  @override
  String get howToCheckTransactionsDescription => 'எனது கடைசி x பரிவர்த்தனைகள் என்னவென்று நீங்கள் கேட்கலாம்';

  @override
  String get voiceCommandsDescription => 'தெளிவாகவும் இயல்பாகவும் பேசுங்கள். கணினி உரையாடல் மொழியை புரிந்துகொள்கிறது.';

  @override
  String get supportedLanguages => 'ஆதரவளிக்கப்படும் மொழிகள்';

  @override
  String get supportedLanguagesDescription => 'தற்போது ஆங்கிலம், இந்தி, வங்காளம், குஜராத்தி, கன்னடம், மலையாளம், மராத்தி, பஞ்சாபி, தமிழ் மற்றும் தெலுங்கு மொழிகளுக்கு ஆதரவளிக்கிறது.';

  @override
  String get privacySecurity => 'தனியுரிமை மற்றும் பாதுகாப்பு';

  @override
  String get privacySecurityDescription => 'உங்கள் வாய்ஸ் தரவு பாதுகாப்பாக செயலாக்கப்படுகிறது மற்றும் நிரந்தரமாக சேமிக்கப்படுவதில்லை.';

  @override
  String get proTips => 'தொழில்முறை குறிப்புகள்';

  @override
  String get tipQuietEnvironment => 'சிறந்த அங்கீகாரத்திற்காக அமைதியான சூழலில் பேசுங்கள்';

  @override
  String get tipNaturalLanguage => 'இயற்கையான மொழியைப் பயன்படுத்துங்கள் எடுத்துக்காட்டாக \"எனது இருப்பைக் காட்டுங்கள்\"';

  @override
  String get tipWaitForIndicator => 'பேசுவதற்கு முன் கேட்கும் குறிகாட்டிக்காக காத்திருக்கவும்';

  @override
  String get needMoreHelp => 'மேலும் உதவி தேவையா?';

  @override
  String get contactSupportDescription => 'கூடுதல் உதவிக்காக எங்கள் ஆதரவு குழுவைத் தொடர்பு கொள்ளுங்கள்';
}
