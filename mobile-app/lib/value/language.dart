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
}
