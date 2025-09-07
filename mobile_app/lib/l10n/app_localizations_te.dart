// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appTitle => 'లింగో వాయిస్ బ్యాంకింగ్';

  @override
  String get loginPrompt => 'మీ మొబైల్ నంబర్ నమోదు చేయండి';

  @override
  String get otpPrompt => 'OTP నమోదు చేయండి';

  @override
  String get micHint => 'మాట్లాడటానికి మైక్‌పై నొక్కండి';

  @override
  String get listening => 'వింటున్నాం...';

  @override
  String get transcribing => 'ట్రాన్స్క్రిప్షన్ జరుగుతోంది...';

  @override
  String get executing => 'మీ అభ్యర్థన ప్రాసెస్ అవుతోంది...';

  @override
  String get otpSuccess => 'OTP విజయవంతంగా ధృవీకరించబడింది!';

  @override
  String balanceResponse(Object amount) {
    return 'మీ ప్రస్తుత బ్యాలెన్స్ $amount రూపాయలు.';
  }

  @override
  String get failedIntent => 'క్షమించండి, నేను అర్థం చేసుకోలేకపోయాను.';

  @override
  String get recTxns => 'ఇటీవలి లావాదేవీలు';

  @override
  String get curBalance => 'అందుబాటులో ఉన్న బ్యాలెన్స్';
}
