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
}
