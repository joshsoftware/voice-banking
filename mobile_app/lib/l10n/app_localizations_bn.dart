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
}
