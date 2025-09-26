import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  final FlutterTts _tts = FlutterTts();

  final Map<String, String> _langMap = {
    "en": "en-IN",
    "hi": "hi-IN", // Hindi
    "ta": "ta-IN", // Tamil
    "te": "te-IN", // Telugu
    "bn": "bn-IN", // Bengali
    "gu": "gu-IN", // Gujarati
    "ml": "ml-IN", // Malayalam
    "mr": "mr-IN", // Marathi
    "kn": "kn-IN", // Kannada
    "pa": "pa-IN", // Punjabi
  };

  TTSService() {
    _initializeTTS();
  }

  Future<void> _initializeTTS() async {
    try {
      // Wait for TTS to be ready
      await _tts.awaitSpeakCompletion(true);
      await _tts.setSpeechRate(0.5);
      await _tts.setVolume(1.0);
      await _tts.setPitch(1.0);
      await _tts.setLanguage("en-IN");
      print("TTS Initialized successfully");
    } catch (e) {
      print("TTS Initialization Error: $e");
    }
  }

  Future<void> speak(String text, {String langCode = "en"}) async {
    try {
      await _tts.stop();

      // Pick mapped language if available, else fallback
      String? targetLang = _langMap[langCode];

      if (targetLang != null) {
        try {
          await _tts.setLanguage(targetLang);
          await _tts.speak(text);
          return;
        } catch (e) {
          print("TTS Language Error: $e");
          // TTS failed for target language, falling back to English
        }
      }

      // Default fallback: English
      await _tts.setLanguage("en-IN");
      await _tts.speak(text);
    } catch (e) {
      print("TTS Speak Error: $e");
      // If TTS completely fails, we'll just show the dialog without audio
    }
  }
}
