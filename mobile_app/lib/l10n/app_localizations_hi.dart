// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'लिंगो वॉइस बैंकिंग';

  @override
  String get loginPrompt => 'अपना मोबाइल नंबर दर्ज करें';

  @override
  String get otpPrompt => 'ओटीपी दर्ज करें';

  @override
  String get micHint => 'बोलने के लिए माइक दबाएँ';

  @override
  String get listening => 'सुन रहा हूँ...';

  @override
  String get transcribing => 'लिख रहा हूँ...';

  @override
  String get executing => 'आपका अनुरोध संसाधित हो रहा है...';

  @override
  String get otpSuccess => 'OTP सफलतापूर्वक सत्यापित!';

  @override
  String balanceResponse(Object amount) {
    return 'आपका मौजूदा बैलेंस $amount रुपये है।';
  }

  @override
  String get failedIntent => 'क्षमा करें, मुझे यह समझ में नहीं आया।';

  @override
  String get recTxns => 'हाल के लेन-देन';

  @override
  String get curBalance => 'वर्तमान शेष राशि';
}
