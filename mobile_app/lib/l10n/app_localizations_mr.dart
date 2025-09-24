// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'लिंगो व्हॉईस बँकिंग';

  @override
  String get loginPrompt => 'तुमचा मोबाइल क्रमांक टाका';

  @override
  String get otpPrompt => 'OTP टाका';

  @override
  String get micHint => 'बोलण्यासाठी माईक्रोफोनवर टॅप करा';

  @override
  String get listening => 'ऐकत आहे...';

  @override
  String get transcribing => 'लिहित आहे...';

  @override
  String get executing => 'तुमची विनंती प्रक्रिया केली जात आहे...';

  @override
  String get otpSuccess => 'OTP यशस्वीरित्या तपासले!';

  @override
  String balanceResponse(Object amount) {
    return 'तुमचे चालू शिल्लक $amount रुपये आहे.';
  }

  @override
  String get failedIntent => 'माफ करा, मला ते समजले नाही.';

  @override
  String get recTxns => 'अलीकडचे व्यवहार';

  @override
  String get curBalance => 'उपलब्ध शिल्लक';

  @override
  String get msgNoTransactionFound => 'No transactions found.';

  @override
  String get logout => 'Logout';

  @override
  String get logoutConfirm => 'Are you sure you want to logout?';

  @override
  String get logoutSuccess => 'Logged out successfully!';
}
