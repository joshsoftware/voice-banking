// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get appTitle => 'ಲಿಂಗೋ ವಾಯಿಸ್ ಬ್ಯಾಂಕಿಂಗ್';

  @override
  String get loginPrompt => 'ನಿಮ್ಮ ಮೊಬೈಲ್ ಸಂಖ್ಯೆ ನಮೂದಿಸಿ';

  @override
  String get otpPrompt => 'OTP ನಮೂದಿಸಿ';

  @override
  String get micHint => 'ಮಾತನಾಡಲು ಮೈಕ್ ಅನ್ನು ಟ್ಯಾಪ್ ಮಾಡಿ';

  @override
  String get listening => 'ಕೇಳುತ್ತಿದೆ...';

  @override
  String get transcribing => 'ಪಠ್ಯಕ್ಕೆ ಪರಿವರ್ತನೆ ಆಗುತ್ತಿದೆ...';

  @override
  String get executing => 'ನಿಮ್ಮ ವಿನಂತಿಯನ್ನು ಪ್ರಕ್ರಿಯೆಗೊಳಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get otpSuccess => 'OTP ಯಶಸ್ವಿಯಾಗಿ ಪರಿಶೀಲಿಸಲಾಗಿದೆ!';

  @override
  String balanceResponse(Object amount) {
    return 'ನಿಮ್ಮ ಪ್ರಸ್ತುತ ಬ್ಯಾಲೆನ್ಸ್ $amount ರೂಪಾಯಿಗಳು.';
  }

  @override
  String get failedIntent => 'ಕ್ಷಮಿಸಿ, ನಾನು ಅದನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಲಿಲ್ಲ.';

  @override
  String get recTxns => 'ಸದ್ಯದ ವಹಿವಾಟುಗಳು';

  @override
  String get curBalance => 'ಲಭ್ಯವಿರುವ ಬ್ಯಾಲೆನ್ಸ್';
}
