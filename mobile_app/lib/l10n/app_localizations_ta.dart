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
  String get tapToSpeak => 'பேச தட்டவும்';

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
  String get stopVoiceBankingConfirm => 'குரல் வங்கியை நிறுத்துவதா? அனைத்து தற்போதைய குரல் செயல்பாடுகளும் ரத்து செய்யப்படும்.';

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

  @override
  String balanceSuccess(Object amount) {
    return 'உங்கள் தற்போதைய இருப்பு $amount ரூபாய்.';
  }

  @override
  String transactionsFound(Object count) {
    return 'இங்கே உங்கள் $count சமீபத்திய பரிவர்த்தனைகள்.';
  }

  @override
  String get noTransactions => 'பரிவர்த்தனைகள் எதுவும் காணப்படவில்லை.';

  @override
  String transferSuccess(Object amount, Object recipient) {
    return '$recipientக்கு $amount ரூபாய் பரிமாற்றம் வெற்றிகரமாக தொடங்கப்பட்டது.';
  }

  @override
  String get transferFailed => 'பரிமாற்றம் தோல்வி. தயவுசெய்து மீண்டும் முயற்சிக்கவும்.';

  @override
  String get errorGeneric => 'மன்னிக்கவும், பிழை ஏற்பட்டது. தயவுசெய்து மீண்டும் முயற்சிக்கவும்.';

  @override
  String get errorInsufficientFunds => 'போதுமான நிதி இல்லை. தயவுசெய்து உங்கள் இருப்பை சரிபார்க்கவும்.';

  @override
  String get pleaseSaySomething => 'தயவுசெய்து ஏதாவது சொல்லுங்கள்';

  @override
  String get voiceRegistration => 'குரல் பதிவு';

  @override
  String get pleaseWaitForUpload => 'தயவுசெய்து பதிவேற்றம் முடியும் வரை காத்திருக்கவும்';

  @override
  String get voiceRegistrationCompleted => 'குரல் பதிவு வெற்றிகரமாக முடிக்கப்பட்டது!';

  @override
  String get unknownState => 'அறியப்படாத நிலை';

  @override
  String get uploadingVoiceRecordings => 'குரல் பதிவுகள் பதிவேற்றப்படுகின்றன...';

  @override
  String imageNumber(Object number) {
    return 'படம் $number';
  }

  @override
  String get somethingWentWrong => 'ஏதோ தவறு நடந்தது, தயவுசெய்து மீண்டும் முயற்சிக்கவும்!';

  @override
  String get imageNotAvailable => 'படம் கிடைக்கவில்லை';

  @override
  String stepOfTotal(Object current, Object total) {
    return 'படி $current இன் $total';
  }

  @override
  String describeImageInstruction(Object seconds) {
    return 'தயவுசெய்து இந்த படத்தில் நீங்கள் பார்க்கும் விஷயத்தை $seconds வினாடிகளில் விவரிக்கவும்। தெளிவாக பேசுங்கள் மற்றும் முக்கிய கூறுகளை விவரிக்கவும்।';
  }

  @override
  String get stopRecording => 'பதிவை நிறுத்து';

  @override
  String get reRecord => 'மீண்டும் பதிவு செய்';

  @override
  String get startRecording => 'பதிவைத் தொடங்கு';

  @override
  String get recording => 'பதிவு செய்யப்படுகிறது...';

  @override
  String get stopDescription => 'விளக்கத்தை நிறுத்து';

  @override
  String get playDescription => 'விளக்கத்தை இயக்கு';

  @override
  String get nextStep => 'அடுத்த படி';

  @override
  String get register => 'பதிவு செய்';

  @override
  String get pleaseWaitForDescription => 'தயவுசெய்து விளக்கம் முடியும் வரை காத்திருக்கவும்।';

  @override
  String get microphonePermissionRequired => 'மைக்ரோஃபோன் அனுமதி தேவை। தயவுசெய்து அமைப்புகளில் அதை இயக்கவும்।';

  @override
  String failedToStartRecording(Object error) {
    return 'பதிவைத் தொடங்க முடியவில்லை: $error';
  }

  @override
  String get recordingFailed => 'பதிவு தோல்வியடைந்தது। தயவுசெய்து மீண்டும் முயற்சிக்கவும்।';

  @override
  String get recordingFileNotFound => 'பதிவு கோப்பு கிடைக்கவில்லை। தயவுசெய்து மீண்டும் முயற்சிக்கவும்।';

  @override
  String get recordingEmpty => 'பதிவு காலியாக உள்ளது। தயவுசெய்து மீண்டும் முயற்சிக்கவும்।';

  @override
  String pleaseSpeakAtLeastSeconds(Object seconds) {
    return 'தயவுசெய்து குறைந்தது $seconds வினாடிகள் பேசுங்கள்।';
  }

  @override
  String failedToStopRecording(Object error) {
    return 'பதிவை நிறுத்த முடியவில்லை: $error';
  }

  @override
  String get pleaseStopRecordingBeforePlay => 'தயவுசெய்து விளக்கத்தை இயக்குவதற்கு முன் பதிவை நிறுத்தவும்।';

  @override
  String failedToPlayDescription(Object error) {
    return 'விளக்கத்தை இயக்க முடியவில்லை: $error';
  }

  @override
  String failedToStopDescription(Object error) {
    return 'விளக்கத்தை நிறுத்த முடியவில்லை: $error';
  }

  @override
  String get pleaseRecordBeforeProceeding => 'தயவுசெய்து முன்னேறுவதற்கு முன் உங்கள் குரலை பதிவு செய்யவும்।';

  @override
  String get pleaseWaitForRecordingOrDescription => 'தயவுசெய்து பதிவு அல்லது விளக்கம் முடியும் வரை காத்திருக்கவும்।';

  @override
  String get pleaseCompleteAllRecordings => 'தயவுசெய்து சமர்ப்பிப்பதற்கு முன் அனைத்து 3 பதிவுகளையும் முடிக்கவும்।';

  @override
  String get userIdNotFound => 'பயனர் ID கிடைக்கவில்லை। தயவுசெய்து மீண்டும் உள்நுழையவும்।';

  @override
  String get recordingFilesMissing => 'ஒன்று அல்லது அதற்கு மேற்பட்ட பதிவு கோப்புகள் காணவில்லை।';

  @override
  String get imageDescriptionBoardMeeting => 'ஒரு திறமையான ஆண் நகரக் காட்சியைக் காணும் நவீன, சூரிய ஒளி நிறைந்த அலுவலக கூடத்தில் சக ஊழியர்களுக்கு தரவு விளக்கக்காட்சி அளிக்கிறார்.';

  @override
  String get imageDescriptionBoyWithDog => 'கண்ணாடி அணிந்த சிறுவன் சூரிய ஒளி நிறைந்த பூங்கா பாதையில் ஹஸ்கி நாயை நடத்திக்கொண்டு வளையைப் பிடித்து புன்னகைக்கிறான்.';

  @override
  String get imageDescriptionChildrenPainting => 'ஐந்து குழந்தைகள் பெரிய சாளரத்திற்கு அருகில் கம்பளத்தில் அமர்ந்து பிரகாசமான வாழ்க்கை அறையில் சேர்ந்து வண்ணமயமான படங்களை மகிழ்ச்சியாக வரைகிறார்கள்.';

  @override
  String get imageDescriptionChildrenWithDog => 'நான்கு குழந்தைகள் பசுமையான தோட்டத்தில் இரண்டு நாய்களுடன் மகிழ்ச்சியாக விளையாடுகிறார்கள், பிரகாசமான பிற்பகலில் ஃப்ரிஸ்பீ வீசுகிறார்கள்.';

  @override
  String get imageDescriptionConstructionSite => 'நான்கு கட்டுமான வல்லுநர்கள் பாதுகாப்பு வெஸ்ட்கள் மற்றும் கடின தலைக்கவசங்கள் அணிந்து தூசி நிறைந்த தளத்தில் பெரிய கட்டிட வரைபடத்தை கவனமாக மதிப்பாய்வு செய்கிறார்கள்.';

  @override
  String get imageDescriptionFamilyDinner => 'நான்கு உறுப்பினர்கள் கொண்ட மகிழ்ச்சியான குடும்பம் உணவகத்தில் பாரம்பரிய இந்திய இரவு உணவை அனுபவிக்கிறது, ச warmth ாப்பான சூழலில் உணவும் சிரிப்பும் பகிர்கிறது.';

  @override
  String get imageDescriptionHoliCelebration => 'குடும்பம் மற்றும் நண்பர்களின் மகிழ்ச்சியான குழு ஹோலி கொண்டாடுகிறது, காற்றில் வண்ணத் தூளின் பிரகாசமான வெடிப்புக்கு இடையில் சேர்ந்து சிரிக்கிறார்கள்.';

  @override
  String get imageDescriptionLadyPainting => 'ஒரு இளம் பெண் தனது சூரிய ஒளி நிறைந்த, வசதியான வீட்டு கலை ஸ்டூடியோவில் கேன்வாஸில் அழகான மஞ்சள் இயற்கைக் காட்சியை வரைவதில் கவனம் செலுத்துகிறார்.';

  @override
  String get imageDescriptionMomAndSon => 'ஒரு தாய் பிரகாசமான நவீன வெள்ளை சமையலறையில் மர நாற்காலியில் நின்று தனது சிறிய மகனுக்கு அடுப்பில் சமைக்க உதவுகிறார்.';

  @override
  String get imageDescriptionPeopleDiwaliCelebration => 'பாரம்பரிய உடை அணிந்த மக்கள் அலங்கரிக்கப்பட்ட தெருவில் தீபாவளி கொண்டாடுகிறார்கள், பிரகாசமான விளக்குகள், எரியும் விளக்குகள் மற்றும் மேலே கண்கொள்ளா வாணவேடிக்கை.';

  @override
  String get imageDescriptionTajMahal => 'டெனிம் ஜாக்கெட் அணிந்த இளம் நண்பர்கள் கூட்டம் மாடியில் நின்று காபி பிடித்து பின்னால் தாஜ்மஹால் உடன் புன்னகைக்கிறார்கள்.';

  @override
  String get imageDescriptionVillageScene => 'ஒரு முதிய விவசாயி பொன்னிற சூரிய அஸ்தமனத்தின் போது பெரிய அறுவடையை சுமந்த மர எருது வண்டியில் அமர்ந்திருக்கிறார், இரண்டு வெள்ளை எருதுகள் இழுக்கின்றன.';

  @override
  String get imageDescriptionWomenDiwaliCelebration => 'இளஞ்சிவப்பு பாரம்பரிய உடை அணிந்த பெண் எரியும் எண்ணெய் விளக்குகளால் சூழப்பட்ட நிலத்தில் அழகான வண்ணமயமான ரங்கோலியை கவனமாக உருவாக்குகிறார்.';

  @override
  String get skip => 'தவிர்';

  @override
  String get registerVoice => 'குரலை பதிவு செய்';

  @override
  String get unregisterVoice => 'குரல் பதிவை ரத்து செய்';

  @override
  String get resetVoice => 'குரலை மீட்டமை';

  @override
  String get resetVoiceConfirm => 'இது உங்கள் குரல் சுயவிவரத்தை நீக்கும். குரல் பதிவை மீண்டும் முடிக்க வேண்டும். தொடரவா?';

  @override
  String get resetVoiceSuccess => 'குரல் வெற்றிகரமாக மீட்டமைக்கப்பட்டது. மீண்டும் பதிவு செய்யுங்கள்.';

  @override
  String get resetVoiceError => 'குரலை மீட்டமைக்க தோல்வி. மீண்டும் முயற்சிக்கவும்.';

  @override
  String get audioStorageConsentTitle => 'ஆடியோ சேமிப்பு ஒப்புதல்';

  @override
  String get audioStorageConsentMessage => 'குரல் வங்கியைப் பயன்படுத்த, அங்கீகாரம் மற்றும் செயலாக்கத்திற்காக உங்கள் குரல் பதிவுகளை எங்கள் சிஸ்டத்தில் சேமிக்க வேண்டும். உங்கள் ஆடியோவை எங்களிடம் சேமிப்பதற்கு நீங்கள் ஒப்புக்கொள்கிறீர்களா?';

  @override
  String get acceptConsent => 'நான் ஏற்றுக்கொள்கிறேன்';

  @override
  String get declineConsent => 'நான் நிராகரிக்கிறேன்';
}
