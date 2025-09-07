// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get appTitle => 'ലിംഗോ വോയ്സ് ബാങ്കിംഗ്';

  @override
  String get loginPrompt => 'നിങ്ങളുടെ മൊബൈൽ നമ്പർ നൽകുക';

  @override
  String get otpPrompt => 'OTP നൽകുക';

  @override
  String get micHint => 'സംസാരിക്കാൻ മൈക്കിൽ ടാപ്പ് ചെയ്യുക';

  @override
  String get listening => 'കേൾക്കുന്നു...';

  @override
  String get transcribing => 'എഴുത്താക്കുന്നു...';

  @override
  String get executing => 'നിങ്ങളുടെ അഭ്യർത്ഥന പ്രോസസ്സ് ചെയ്യുന്നു...';

  @override
  String get otpSuccess => 'OTP വിജയകരമായി സ്ഥിരീകരിച്ചു!';

  @override
  String balanceResponse(Object amount) {
    return 'നിങ്ങളുടെ നിലവിലെ ബാലൻസ് $amount രൂപയാണ്.';
  }

  @override
  String get failedIntent => 'ക്ഷമിക്കണം, എനിക്ക് അത് മനസ്സിലായില്ല.';

  @override
  String get recTxns => 'ഏറ്റവും പുതിയ ഇടപാടുകൾ';

  @override
  String get curBalance => 'ലഭ്യമായ ബാലൻസ്';
}
