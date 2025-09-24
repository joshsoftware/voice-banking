// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get appTitle => 'ਲਿੰਗੋ ਵੌਇਸ ਬੈਂਕਿੰਗ';

  @override
  String get loginPrompt => 'ਆਪਣਾ ਮੋਬਾਈਲ ਨੰਬਰ ਦਰਜ ਕਰੋ';

  @override
  String get otpPrompt => 'OTP ਦਰਜ ਕਰੋ';

  @override
  String get micHint => 'ਬੋਲਣ ਲਈ ਮਾਈਕ \'ਤੇ ਟੈਪ ਕਰੋ';

  @override
  String get listening => 'ਸੁਣ ਰਿਹਾ ਹੈ...';

  @override
  String get transcribing => 'ਲਿਖਿਆ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get executing => 'ਤੁਹਾਡੀ ਬੇਨਤੀ ਦੀ ਪ੍ਰਕਿਰਿਆ ਕੀਤੀ ਜਾ ਰਹੀ ਹੈ...';

  @override
  String get otpSuccess => 'OTP ਸਫਲਤਾਪੂਰਵਕ ਪੜਤਾਲ ਕੀਤਾ ਗਿਆ!';

  @override
  String balanceResponse(Object amount) {
    return 'ਤੁਹਾਡਾ ਮੌਜੂਦਾ ਬੈਲੇਂਸ $amount ਰੁਪਏ ਹੈ।';
  }

  @override
  String get failedIntent => 'ਮਾਫ ਕਰਨਾ, ਮੈਂ ਇਹ ਨਹੀਂ ਸਮਝਿਆ।';

  @override
  String get recTxns => 'ਹਾਲ ਹੀ ਦੇ ਲੈਣ-ਦੇਣ';

  @override
  String get curBalance => 'ਉਪਲਬਧ ਬੈਲੇਂਸ';

  @override
  String get msgNoTransactionFound => 'No transactions found.';

  @override
  String get logout => 'Logout';

  @override
  String get logoutConfirm => 'Are you sure you want to logout?';

  @override
  String get logoutSuccess => 'Logged out successfully!';
}
