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
    _tts.setSpeechRate(0.5);
    _tts.setVolume(1.0);
    _tts.setPitch(1.0);
  }

  Future<void> speak(String text, {String langCode = "en"}) async {
    await _tts.stop();

    // Pick mapped language if available, else fallback
    String? targetLang = _langMap[langCode];
    if (targetLang != null) {
      try {
        await _tts.setLanguage(targetLang);
        await _tts.speak(text);
        return;
      } catch (e) {
        // TTS failed for target language, falling back to English
      }
    }

    // Default fallback: English
    await _tts.setLanguage("en-IN");
    await _tts.speak("Sorry, responding in English. $text");
  }
}
