// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'லிங்கோ வொய்ஸ் வங்கிப்பணி';

  @override
  String get loginPrompt => 'உங்கள் கைபேசி எண்ணை உள்ளிடவும்';

  @override
  String get otpPrompt => 'OTP ஐ உள்ளிடவும்';

  @override
  String get micHint => 'பேச மைக் அழுத்தவும்';

  @override
  String get listening => 'கேட்கிறேன்...';

  @override
  String get transcribing => 'எழுதுகிறேன்...';

  @override
  String get executing => 'உங்கள் கோரிக்கை செயலாக்கப்படுகிறது...';

  @override
  String get otpSuccess => 'OTP வெற்றிகரமாக சரிபார்க்கப்பட்டது!';

  @override
  String balanceResponse(Object amount) {
    return 'உங்களின் தற்போதைய இருப்பு $amount ரூபாய்.';
  }

  @override
  String get failedIntent => 'மன்னிக்கவும், எனக்கு அது புரியவில்லை.';

  @override
  String get recTxns => 'சமீபத்திய பரிவர்த்தனைகள்';

  @override
  String get curBalance => 'நடப்பு இருப்பு';
}
