// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get appTitle => 'લિંગો વૉઇસ બેંકિંગ';

  @override
  String get loginPrompt => 'તમારો મોબાઇલ નંબર દાખલ કરો';

  @override
  String get otpPrompt => 'OTP દાખલ કરો';

  @override
  String get micHint => 'બોલવા માટે માઇક પર ટેપ કરો';

  @override
  String get listening => 'સાંભળી રહ્યા છીએ...';

  @override
  String get transcribing => 'લખાણમાં રૂપાંતર થઈ રહ્યું છે...';

  @override
  String get executing => 'તમારી વિનંતી પ્રક્રિયા કરવામાં આવી રહી છે...';

  @override
  String get otpSuccess => 'OTP સફળતાપૂર્વક ચકાસાયો!';

  @override
  String balanceResponse(Object amount) {
    return 'તમારું વર્તમાન બેલન્સ $amount રૂપિયા છે.';
  }

  @override
  String get failedIntent => 'માફ કરશો, મેં તે સમજી ન શક્યો.';

  @override
  String get recTxns => 'તાજેતરની વ્યવહારો';

  @override
  String get curBalance => 'ઉપલબ્ધ બેલન્સ';
}
