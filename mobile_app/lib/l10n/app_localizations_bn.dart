// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'লিঙ্গো ভয়েস ব্যাংকিং';

  @override
  String get loginPrompt => 'আপনার মোবাইল নম্বর লিখুন';

  @override
  String get otpPrompt => 'ওটিপি লিখুন';

  @override
  String get micHint => 'কথা বলার জন্য মাইক্রোফোনে ট্যাপ করুন';

  @override
  String get tapToSpeak => 'বলতে ট্যাপ করুন';

  @override
  String get listening => 'শোনা হচ্ছে...';

  @override
  String get transcribing => 'লেখায় রূপান্তর হচ্ছে...';

  @override
  String get executing => 'আপনার অনুরোধ প্রক্রিয়া করা হচ্ছে...';

  @override
  String get otpSuccess => 'ওটিপি সফলভাবে যাচাই করা হয়েছে!';

  @override
  String balanceResponse(Object amount) {
    return 'আপনার বর্তমান জের $amount টাকা।';
  }

  @override
  String get failedIntent => 'দুঃখিত, আমি বুঝতে পারিনি।';

  @override
  String get recTxns => 'সদ্য সম্পন্ন লেনদেন';

  @override
  String get curBalance => 'উপলব্ধ জের';

  @override
  String get msgNoTransactionFound => 'কোন লেনদেন পাওয়া যায়নি।';

  @override
  String get logout => 'লগআউট';

  @override
  String get logoutConfirm => 'আপনি কি নিশ্চিত যে আপনি লগআউট করতে চান?';

  @override
  String get logoutSuccess => 'সফলভাবে লগআউট হয়েছে!';

  @override
  String get welcomeBack => 'আবার স্বাগতম! 👋';

  @override
  String get voiceBankingDashboard => 'আপনার ভয়েস ব্যাংকিং ড্যাশবোর্ড';

  @override
  String get availableBalance => 'উপলব্ধ জের';

  @override
  String get viewAll => 'সব দেখুন';

  @override
  String get voice => 'ভয়েস';

  @override
  String get stop => 'বন্ধ করুন';

  @override
  String get cancel => 'বাতিল';

  @override
  String get stopVoiceBankingConfirm => 'ভয়েস ব্যাংকিং বন্ধ করবেন? সমস্ত বর্তমান ভয়েস কার্যকলাপ বাতিল করা হবে।';

  @override
  String get welcomeTo => 'স্বাগতম';

  @override
  String get experienceBanking => 'ভয়েসের শক্তিতে ব্যাংকিংয়ের অভিজ্ঞতা নিন';

  @override
  String get enterMobileNumber => 'মোবাইল নম্বর লিখুন';

  @override
  String get weWillSendOtp => 'আপনার নম্বর যাচাই করার জন্য আমরা আপনাকে একটি OTP পাঠাব';

  @override
  String get mobileNumber => 'মোবাইল নম্বর';

  @override
  String get enterYourMobileNumber => 'আপনার ১০-অঙ্কের মোবাইল নম্বর লিখুন';

  @override
  String get sendOtp => 'OTP পাঠান';

  @override
  String get pleaseEnterValidMobile => 'অনুগ্রহ করে একটি বৈধ ১০-অঙ্কের মোবাইল নম্বর লিখুন';

  @override
  String get verifyYourPhone => 'আপনার ফোন যাচাই করুন';

  @override
  String get weHaveSentCode => 'আমরা একটি ৬-অঙ্কের কোড পাঠিয়েছি';

  @override
  String get enterVerificationCode => 'যাচাইকরণ কোড লিখুন';

  @override
  String get enterSixDigitCode => 'আপনার ফোনে পাঠানো ৬-অঙ্কের কোড লিখুন';

  @override
  String get verifyOtp => 'OTP যাচাই করুন';

  @override
  String get didntReceiveCode => 'কোড পেলেন না? ';

  @override
  String resendIn(Object seconds) {
    return 'পুনরায় পাঠান $secondsসেকেন্ডে';
  }

  @override
  String get resendOtp => 'OTP পুনরায় পাঠান';

  @override
  String get otpValidFor => 'আপনার OTP ৫ মিনিটের জন্য বৈধ এবং শুধুমাত্র একবার ব্যবহার করা যাবে।';

  @override
  String get secureVerification => 'AI দ্বারা সুরক্ষিত যাচাইকরণ';

  @override
  String get otpVerifiedSuccessfully => '✅ OTP সফলভাবে যাচাই করা হয়েছে!';

  @override
  String get invalidOtp => '❌ অবৈধ OTP, অনুগ্রহ করে আবার চেষ্টা করুন';

  @override
  String newOtpSent(Object mobileNumber) {
    return '📱 নতুন OTP পাঠানো হয়েছে $mobileNumber';
  }

  @override
  String get pleaseEnterOtp => 'অনুগ্রহ করে OTP লিখুন';

  @override
  String get otpMustBeSixDigits => 'OTP অবশ্যই ৬ অঙ্কের হতে হবে';

  @override
  String get whyChooseVoiceBanking => 'কেন ভয়েস ব্যাংকিং বেছে নেবেন?';

  @override
  String get voiceCommands => 'ভয়েস কমান্ড';

  @override
  String get controlWithVoice => 'আপনার ভয়েস দিয়ে নিয়ন্ত্রণ করুন';

  @override
  String get secure => 'নিরাপদ';

  @override
  String get bankGradeSecurity => 'ব্যাংক-গ্রেড নিরাপত্তা';

  @override
  String get multiLanguage => 'বহুভাষিক';

  @override
  String get supportForLanguages => '১০+ ভাষার সমর্থন';

  @override
  String get fast => 'দ্রুত';

  @override
  String get quickTransactions => 'দ্রুত লেনদেন';

  @override
  String get poweredByAI => 'AI প্রযুক্তি দ্বারা চালিত';

  @override
  String get paymentInitiated => 'পেমেন্ট শুরু হয়েছে 🚀';

  @override
  String get viewAllTransactions => 'সব লেনদেন দেখুন';

  @override
  String get aiIsSpeaking => 'AI কথা বলছে…';

  @override
  String get validationRequired => 'এই ক্ষেত্রটি প্রয়োজন';

  @override
  String get validationEmail => 'অনুগ্রহ করে একটি বৈধ ইমেইল লিখুন';

  @override
  String get validationPhone => 'অনুগ্রহ করে একটি বৈধ ফোন নম্বর লিখুন';

  @override
  String get validationOtp => 'অনুগ্রহ করে একটি বৈধ OTP লিখুন';

  @override
  String get allTransactions => 'সব লেনদেন';

  @override
  String get transactions => 'লেনদেন';

  @override
  String get loading => 'লোড হচ্ছে...';

  @override
  String get errorLoadingTransactions => 'লেনদেন লোড করতে ত্রুটি';

  @override
  String get retry => 'পুনরায় চেষ্টা করুন';

  @override
  String get noTransactionsFound => 'কোন লেনদেন পাওয়া যায়নি';

  @override
  String get noTransactionsDescription => 'আপনার এখনো কোন লেনদেন নেই';

  @override
  String get faq => 'প্রায়শই জিজ্ঞাসিত প্রশ্ন';

  @override
  String get frequentlyAskedQuestions => 'প্রায়শই জিজ্ঞাসিত প্রশ্ন';

  @override
  String get learnHowToUseVoiceBanking => 'ভয়েস ব্যাংকিংয়ের কার্যকর ব্যবহার শিখুন';

  @override
  String get whatToSpeak => 'কী বলতে হবে';

  @override
  String get whatToSpeakDescription => 'উদাহরণস্বরূপ, আপনি জিজ্ঞাসা করতে পারেন আমার বর্তমান ব্যালেন্স কত';

  @override
  String get howToCheckTransactions => 'লেনদেন কীভাবে দেখবেন';

  @override
  String get howToCheckTransactionsDescription => 'আপনি জিজ্ঞাসা করতে পারেন আমার শেষ x লেনদেন কী';

  @override
  String get voiceCommandsDescription => 'স্পষ্ট এবং স্বাভাবিকভাবে কথা বলুন। সিস্টেম কথোপকথনের ভাষা বুঝতে পারে।';

  @override
  String get supportedLanguages => 'সমর্থিত ভাষা';

  @override
  String get supportedLanguagesDescription => 'বর্তমানে ইংরেজি, হিন্দি, বাংলা, গুজরাটি, কন্নড়, মালয়ালম, মারাঠি, পাঞ্জাবি, তামিল এবং তেলুগু সমর্থন করে।';

  @override
  String get privacySecurity => 'গোপনীয়তা ও নিরাপত্তা';

  @override
  String get privacySecurityDescription => 'আপনার ভয়েস ডেটা নিরাপদে প্রক্রিয়াজাত করা হয় এবং স্থায়ীভাবে সংরক্ষণ করা হয় না।';

  @override
  String get proTips => 'বিশেষজ্ঞ পরামর্শ';

  @override
  String get tipQuietEnvironment => 'ভালো স্বীকৃতির জন্য শান্ত পরিবেশে কথা বলুন';

  @override
  String get tipNaturalLanguage => 'প্রাকৃতিক ভাষা ব্যবহার করুন যেমন \"আমার ব্যালেন্স দেখান\"';

  @override
  String get tipWaitForIndicator => 'কথা বলার আগে শোনার নির্দেশকের জন্য অপেক্ষা করুন';

  @override
  String get needMoreHelp => 'আরো সাহায্য প্রয়োজন?';

  @override
  String get contactSupportDescription => 'অতিরিক্ত সহায়তার জন্য আমাদের সহায়তা দলকে যোগাযোগ করুন';

  @override
  String balanceSuccess(Object amount) {
    return 'আপনার বর্তমান জের $amount টাকা।';
  }

  @override
  String transactionsFound(Object count) {
    return 'এখানে আপনার $countটি সাম্প্রতিক লেনদেন।';
  }

  @override
  String get noTransactions => 'কোন লেনদেন পাওয়া যায়নি।';

  @override
  String transferSuccess(Object amount, Object recipient) {
    return '$recipient-এ $amount টাকার ট্রান্সফার সফলভাবে শুরু হয়েছে।';
  }

  @override
  String get transferFailed => 'ট্রান্সফার ব্যর্থ। অনুগ্রহ করে আবার চেষ্টা করুন।';

  @override
  String get errorGeneric => 'দুঃখিত, একটি ত্রুটি হয়েছে। অনুগ্রহ করে আবার চেষ্টা করুন।';

  @override
  String get errorInsufficientFunds => 'অপর্যাপ্ত তহবিল। অনুগ্রহ করে আপনার ব্যালেন্স পরীক্ষা করুন।';

  @override
  String get pleaseSaySomething => 'অনুগ্রহ করে কিছু বলুন';

  @override
  String get voiceRegistration => 'ভয়েস নিবন্ধন';

  @override
  String get pleaseWaitForUpload => 'অনুগ্রহ করে আপলোড সম্পূর্ণ হওয়ার জন্য অপেক্ষা করুন';

  @override
  String get voiceRegistrationCompleted => 'ভয়েস নিবন্ধন সফলভাবে সম্পন্ন হয়েছে!';

  @override
  String get unknownState => 'অজানা অবস্থা';

  @override
  String get uploadingVoiceRecordings => 'ভয়েস রেকর্ডিং আপলোড করা হচ্ছে...';

  @override
  String imageNumber(Object number) {
    return 'ছবি $number';
  }

  @override
  String get somethingWentWrong => 'কিছু ভুল হয়েছে';

  @override
  String get imageNotAvailable => 'ছবি পাওয়া যায়নি';

  @override
  String stepOfTotal(Object current, Object total) {
    return 'ধাপ $current এর $total';
  }

  @override
  String get describeImageInstruction => 'অনুগ্রহ করে এই ছবিতে যা দেখছেন তা বর্ণনা করুন। স্পষ্টভাবে কথা বলুন এবং মূল উপাদানগুলি বর্ণনা করুন।';

  @override
  String get stopRecording => 'রেকর্ডিং বন্ধ করুন';

  @override
  String get reRecord => 'পুনরায় রেকর্ড করুন';

  @override
  String get startRecording => 'রেকর্ডিং শুরু করুন';

  @override
  String get recording => 'রেকর্ডিং হচ্ছে...';

  @override
  String get stopDescription => 'বর্ণনা বন্ধ করুন';

  @override
  String get playDescription => 'বর্ণনা চালান';

  @override
  String get nextStep => 'পরবর্তী ধাপ';

  @override
  String get register => 'নিবন্ধন করুন';

  @override
  String get pleaseWaitForDescription => 'অনুগ্রহ করে বর্ণনা শেষ হওয়ার জন্য অপেক্ষা করুন।';

  @override
  String get microphonePermissionRequired => 'মাইক্রোফোন অনুমতি প্রয়োজন। অনুগ্রহ করে সেটিংসে এটি সক্রিয় করুন।';

  @override
  String failedToStartRecording(Object error) {
    return 'রেকর্ডিং শুরু করতে ব্যর্থ: $error';
  }

  @override
  String get recordingFailed => 'রেকর্ডিং ব্যর্থ হয়েছে। অনুগ্রহ করে আবার চেষ্টা করুন।';

  @override
  String get recordingFileNotFound => 'রেকর্ডিং ফাইল পাওয়া যায়নি। অনুগ্রহ করে আবার চেষ্টা করুন।';

  @override
  String get recordingEmpty => 'রেকর্ডিং খালি। অনুগ্রহ করে আবার চেষ্টা করুন।';

  @override
  String failedToStopRecording(Object error) {
    return 'রেকর্ডিং বন্ধ করতে ব্যর্থ: $error';
  }

  @override
  String get pleaseStopRecordingBeforePlay => 'অনুগ্রহ করে বর্ণনা চালানোর আগে রেকর্ডিং বন্ধ করুন।';

  @override
  String failedToPlayDescription(Object error) {
    return 'বর্ণনা চালাতে ব্যর্থ: $error';
  }

  @override
  String failedToStopDescription(Object error) {
    return 'বর্ণনা বন্ধ করতে ব্যর্থ: $error';
  }

  @override
  String get pleaseRecordBeforeProceeding => 'অনুগ্রহ করে এগিয়ে যাওয়ার আগে আপনার ভয়েস রেকর্ড করুন।';

  @override
  String get pleaseWaitForRecordingOrDescription => 'অনুগ্রহ করে রেকর্ডিং বা বর্ণনা সম্পূর্ণ হওয়ার জন্য অপেক্ষা করুন।';

  @override
  String get pleaseCompleteAllRecordings => 'অনুগ্রহ করে জমা দেওয়ার আগে ৩টি রেকর্ডিং সম্পূর্ণ করুন।';

  @override
  String get userIdNotFound => 'ব্যবহারকারী ID পাওয়া যায়নি। অনুগ্রহ করে আবার লগইন করুন।';

  @override
  String get recordingFilesMissing => 'এক বা একাধিক রেকর্ডিং ফাইল অনুপস্থিত।';

  @override
  String get imageDescriptionBoardMeeting => 'একজন পেশাদার ব্যক্তি একটি আধুনিক, রৌদ্রোজ্জ্বল অফিস বোর্ডরুমে দৃশ্যাবলী শহরের আকাশরেখা উপেক্ষা করে সহকর্মীদের কাছে ডেটা উপস্থাপনা দিচ্ছেন।';

  @override
  String get imageDescriptionBoyWithDog => 'চশমা পরা একটি ছেলে রৌদ্রোজ্জ্বল পার্কের পথে হাস্কি কুকুর হাঁটাচ্ছে, পট্টা ধরে হাসছে।';

  @override
  String get imageDescriptionChildrenPainting => 'পাঁচটি শিশু বড় জানালার কাছে কার্পেটে বসে উজ্জ্বল বসার ঘরে একসাথে আনন্দে রঙিন ছবি আঁকছে।';

  @override
  String get imageDescriptionChildrenWithDog => 'চারটি শিশু ঘন সবুজ বাগানে দুটি কুকুরের সাথে আনন্দে খেলছে, উজ্জ্বল বিকেলে ফ্রিসবি ছুড়ে দিচ্ছে।';

  @override
  String get imageDescriptionConstructionSite => 'চারজন নির্মাণ পেশাদার সুরক্ষা ভেস্ট এবং হার্ড হ্যাট পরা ধূলিময় সাইটে বড় স্থাপত্য বিল্ডিং ব্লুপ্রিন্ট সাবধানে পর্যালোচনা করছেন।';

  @override
  String get imageDescriptionFamilyDinner => 'চার সদস্যের একটি খুশি পরিবার রেস্তোরাঁতে ঐতিহ্যবাহী ভারতীয় রাতের খাবার উপভোগ করছে, উষ্ণ পরিবেশে খাবার এবং হাসি ভাগ করছে।';

  @override
  String get imageDescriptionHoliCelebration => 'পরিবার ও বন্ধুদের একটি আনন্দময় দল হোলি উদযাপন করছে, বাতাসে রঙিন গুঁড়োর প্রাণবন্ত বিস্ফোরণের মধ্যে একসাথে হাসছে।';

  @override
  String get imageDescriptionLadyPainting => 'একজন তরুণী তার রৌদ্রোজ্জ্বল, আরামদায়ক বাড়ির আর্ট স্টুডিওতে ক্যানভাসে সুন্দর হলুদ ল্যান্ডস্কেপ আঁকতে মনোনিবেশ করছেন।';

  @override
  String get imageDescriptionMomAndSon => 'একজন মা তার ছোট ছেলেকে চুলায় রান্না করতে সাহায্য করছেন, উজ্জ্বল আধুনিক সাদা রান্নাঘরে কাঠের স্টুলে দাঁড়িয়ে।';

  @override
  String get imageDescriptionPeopleDiwaliCelebration => 'ঐতিহ্যবাহী পোশাকে মানুষ সজ্জিত রাস্তায় দীপাবলি উদযাপন করছে, প্রাণবন্ত লণ্ঠন, জ্বলন্ত দিয়াস এবং মাথার উপরে চমকপ্রদ আতশবাজি সহ।';

  @override
  String get imageDescriptionTajMahal => 'ডেনিম জ্যাকেট পরা তরুণ বন্ধুদের একটি দল ছাদে দাঁড়িয়ে কফি ধরে পিছনে তাজমহল নিয়ে হাসছে।';

  @override
  String get imageDescriptionVillageScene => 'একজন বয়স্ক কৃষক সোনালি সূর্যাস্তের সময় বড় ফসল বোঝাই কাঠের বলদ গাড়ির উপর বসে আছেন, দুটি সাদা বলদ টানছে।';

  @override
  String get imageDescriptionWomenDiwaliCelebration => 'গোলাপী ঐতিহ্যবাহী পোশাক পরা একজন মহিলা জ্বলন্ত তেলের দিয়ার মধ্যে মাটিতে সুন্দর রঙিন রঙ্গোলি সাবধানে তৈরি করছেন।';

  @override
  String get resetVoice => 'ভয়েস রিসেট করুন';

  @override
  String get resetVoiceConfirm => 'এটি আপনার ভয়েস প্রোফাইল মুছে ফেলবে। আপনাকে আবার ভয়েস নিবন্ধন সম্পূর্ণ করতে হবে। চালিয়ে যেতে চান?';

  @override
  String get resetVoiceSuccess => 'ভয়েস সফলভাবে রিসেট হয়েছে। অনুগ্রহ করে আবার নিবন্ধন সম্পূর্ণ করুন।';

  @override
  String get resetVoiceError => 'ভয়েস রিসেট করতে ব্যর্থ। অনুগ্রহ করে আবার চেষ্টা করুন।';

  @override
  String get audioStorageConsentTitle => 'অডিও স্টোরেজ সম্মতি';

  @override
  String get audioStorageConsentMessage => 'ভয়েস ব্যাংকিং ব্যবহার করার জন্য, প্রমাণীকরণ এবং প্রক্রিয়াকরণের জন্য আমাদের সিস্টেমে আপনার ভয়েস রেকর্ডিং সংরক্ষণ করা প্রয়োজন। আপনি কি আপনার অডিও আমাদের সাথে সংরক্ষণ করতে সম্মত?';

  @override
  String get acceptConsent => 'আমি গ্রহণ করি';

  @override
  String get declineConsent => 'আমি প্রত্যাখ্যান করি';
}
