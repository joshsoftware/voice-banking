// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Lingo Voice Banking';

  @override
  String get loginPrompt => 'Enter your mobile number';

  @override
  String get otpPrompt => 'Enter OTP';

  @override
  String get micHint => 'Tap the mic to speak';

  @override
  String get listening => 'Listening...';

  @override
  String get transcribing => 'Transcribing...';

  @override
  String get executing => 'Processing your request...';

  @override
  String get otpSuccess => 'OTP verified successfully!';

  @override
  String balanceResponse(Object amount) {
    return 'Your current balance is $amount rupees.';
  }

  @override
  String get failedIntent => 'Sorry, I didn\'t catch that.';

  @override
  String get recTxns => 'Recent transactions';

  @override
  String get curBalance => 'Available balance';

  @override
  String get msgNoTransactionFound => 'No transactions found.';

  @override
  String get logout => 'Logout';

  @override
  String get logoutConfirm => 'Are you sure you want to logout?';

  @override
  String get logoutSuccess => 'Logged out successfully!';
}
