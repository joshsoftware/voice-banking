import 'package:tts/value/message.dart';

enum VoiceBankingLanguage { bengali, tamil, hindi, marathi }

extension VoiceBankingLanguageExt on VoiceBankingLanguage {
  String get label {
    switch (this) {
      case VoiceBankingLanguage.bengali:
        return 'Bengali';
      case VoiceBankingLanguage.tamil:
        return 'Tamil';
      case VoiceBankingLanguage.hindi:
        return 'Hindi';
      case VoiceBankingLanguage.marathi:
        return 'Marathi';
    }
  }

  String get id {
    switch (this) {
      case VoiceBankingLanguage.bengali:
        return 'bn';
      case VoiceBankingLanguage.tamil:
        return 'ta';
      case VoiceBankingLanguage.hindi:
        return 'hi';
      case VoiceBankingLanguage.marathi:
        return 'mr';
    }
  }

  List<String> get sampleCommands {
    switch (this) {
      case VoiceBankingLanguage.bengali:
        return AppMessages.voiceCommandSamplesBengali;
      case VoiceBankingLanguage.tamil:
        return AppMessages.voiceCommandSamplesTamil;
      case VoiceBankingLanguage.hindi:
        return AppMessages.voiceCommandSamplesHindi;
      case VoiceBankingLanguage.marathi:
        return AppMessages.voiceCommandSamplesMarathi;
    }
  }
}
