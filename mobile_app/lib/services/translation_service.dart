import 'package:flutter/material.dart';

class TranslationService {
  static final Map<String, Map<String, String>> _responseTranslations = {
    // Balance responses
    'balance_success': {
      'en': 'Your current balance is {amount} rupees.',
      'hi': 'आपका वर्तमान बैलेंस {amount} रुपये है।',
      'ta': 'உங்கள் தற்போதைய இருப்பு {amount} ரூபாய்.',
      'te': 'మీ ప్రస్తుత బ్యాలెన్స్ {amount} రూపాయలు.',
      'bn': 'আপনার বর্তমান ব্যালেন্স {amount} টাকা।',
      'gu': 'તમારું વર્તમાન બેલેન્સ {amount} રૂપિયા છે।',
      'ml': 'നിങ്ങളുടെ നിലവിലുള്ള ബാലൻസ് {amount} രൂപയാണ്.',
      'mr': 'तुमचे सध्याचे बॅलन्स {amount} रुपये आहे.',
      'kn': 'ನಿಮ್ಮ ಪ್ರಸ್ತುತ ಬ್ಯಾಲೆನ್ಸ್ {amount} ರೂಪಾಯಿಗಳು.',
      'pa': 'ਤੁਹਾਡਾ ਮੌਜੂਦਾ ਬੈਲੇਂਸ {amount} ਰੁਪਏ ਹੈ।',
    },

    // Transaction responses
    'transactions_found': {
      'en': 'Here are your {count} most recent transactions.',
      'hi': 'यहाँ आपके {count} सबसे हाल के लेनदेन हैं।',
      'ta': 'இங்கே உங்கள் {count} சமீபத்திய பரிவர்த்தனைகள் உள்ளன.',
      'te': 'ఇక్కడ మీ {count} ఇటీవలి లావాదేవీలు ఉన్నాయి.',
      'bn': 'এখানে আপনার {count}টি সাম্প্রতিক লেনদেন রয়েছে।',
      'gu': 'અહીં તમારા {count} સૌથી તાજેતરના વ્યવહારો છે.',
      'ml': 'ഇവിടെ നിങ്ങളുടെ {count} ഏറ്റവും പുതിയ ഇടപാടുകൾ ഉണ്ട്.',
      'mr': 'येथे तुमचे {count} सर्वात अलीकडील व्यवहार आहेत.',
      'kn': 'ಇಲ್ಲಿ ನಿಮ್ಮ {count} ಅತ್ಯಂತ ಇತ್ತೀಚಿನ ವಹಿವಾಟುಗಳು ಇವೆ.',
      'pa': 'ਇੱਥੇ ਤੁਹਾਡੇ {count} ਸਭ ਤੋਂ ਹਾਲੀਆ ਲੈਣ-ਦੇਣ ਹਨ।',
    },

    'no_transactions': {
      'en': 'No transactions found.',
      'hi': 'कोई लेनदेन नहीं मिला।',
      'ta': 'பரிவர்த்தனைகள் எதுவும் கிடைக்கவில்லை.',
      'te': 'లావాదేవీలు కనుగొనబడలేదు.',
      'bn': 'কোনো লেনদেন পাওয়া যায়নি।',
      'gu': 'કોઈ વ્યવહાર મળ્યો નથી.',
      'ml': 'ഇടപാടുകൾ കണ്ടെത്തിയില്ല.',
      'mr': 'कोणतेही व्यवहार सापडले नाहीत.',
      'kn': 'ವಹಿವಾಟುಗಳು ಕಂಡುಬಂದಿಲ್ಲ.',
      'pa': 'ਕੋਈ ਲੈਣ-ਦੇਣ ਨਹੀਂ ਮਿਲਿਆ।',
    },

    // Transfer responses
    'transfer_success': {
      'en':
          'Transfer of {amount} rupees to {recipient} has been initiated successfully.',
      'hi':
          '{recipient} को {amount} रुपये का ट्रांसफर सफलतापूर्वक शुरू किया गया है।',
      'ta':
          '{recipient}க்கு {amount} ரூபாய் பரிமாற்றம் வெற்றிகரமாக தொடங்கப்பட்டது.',
      'te': '{recipient}కు {amount} రూపాయల బదిలీ విజయవంతంగా ప్రారంభించబడింది.',
      'bn': '{recipient}কে {amount} টাকা স্থানান্তর সফলভাবে শুরু হয়েছে।',
      'gu':
          '{recipient}ને {amount} રૂપિયાનું ટ્રાન્સફર સફળતાપૂર્વક શરૂ કરવામાં આવ્યું છે.',
      'ml': '{recipient}യ്ക്ക് {amount} രൂപയുടെ കൈമാറ്റം വിജയകരമായി ആരംഭിച്ചു.',
      'mr':
          '{recipient}ला {amount} रुपयेचे हस्तांतरण यशस्वीरित्या सुरू केले गेले आहे.',
      'kn':
          '{recipient}ಗೆ {amount} ರೂಪಾಯಿಗಳ ವರ್ಗಾವಣೆ ಯಶಸ್ವಿಯಾಗಿ ಪ್ರಾರಂಭಿಸಲಾಗಿದೆ.',
      'pa':
          '{recipient} ਨੂੰ {amount} ਰੁਪਏ ਦਾ ਟ੍ਰਾਂਸਫਰ ਸਫਲਤਾਪੂਰਵਕ ਸ਼ੁਰੂ ਕੀਤਾ ਗਿਆ ਹੈ।',
    },

    'transfer_failed': {
      'en': 'Transfer failed. Please try again.',
      'hi': 'ट्रांसफर असफल। कृपया पुनः प्रयास करें।',
      'ta': 'பரிமாற்றம் தோல்வியடைந்தது. மீண்டும் முயற்சிக்கவும்.',
      'te': 'బదిలీ విఫలమైంది. దయచేసి మళ్లీ ప్రయత్నించండి.',
      'bn': 'স্থানান্তর ব্যর্থ হয়েছে। অনুগ্রহ করে আবার চেষ্টা করুন।',
      'gu': 'ટ્રાન્સફર નિષ્ફળ. કૃપા કરીને ફરીથી પ્રયાસ કરો.',
      'ml': 'കൈമാറ്റം പരാജയപ്പെട്ടു. ദയവായി വീണ്ടും ശ്രമിക്കുക.',
      'mr': 'हस्तांतरण अयशस्वी. कृपया पुन्हा प्रयत्न करा.',
      'kn': 'ವರ್ಗಾವಣೆ ವಿಫಲವಾಯಿತು. ದಯವಿಟ್ಟು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.',
      'pa': 'ਟ੍ਰਾਂਸਫਰ ਅਸਫਲ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।',
    },

    // Error responses
    'error_generic': {
      'en': 'Sorry, I encountered an error. Please try again.',
      'hi':
          'क्षमा करें, मुझे एक त्रुटि का सामना करना पड़ा। कृपया पुनः प्रयास करें।',
      'ta':
          'மன்னிக்கவும், நான் ஒரு பிழையை எதிர்கொண்டேன். மீண்டும் முயற்சிக்கவும்.',
      'te':
          'క్షమించండి, నేను ఒక లోపాన్ని ఎదుర్కొన్నాను. దయచేసి మళ్లీ ప్రయత్నించండి.',
      'bn':
          'দুঃখিত, আমি একটি ত্রুটি সম্মুখীন হয়েছি। অনুগ্রহ করে আবার চেষ্টা করুন।',
      'gu':
          'માફ કરશો, મને એક ભૂલનો સામનો કરવો પડ્યો. કૃપા કરીને ફરીથી પ્રયાસ કરો.',
      'ml':
          'ക്ഷമിക്കണം, എനിക്ക് ഒരു പിശക് നേരിടേണ്ടി വന്നു. ദയവായി വീണ്ടും ശ്രമിക്കുക.',
      'mr': 'माफ करा, मला एक त्रुटी आली. कृपया पुन्हा प्रयत्न करा.',
      'kn': 'ಕ್ಷಮಿಸಿ, ನಾನು ದೋಷವನ್ನು ಎದುರಿಸಿದ್ದೇನೆ. ದಯವಿಟ್ಟು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.',
      'pa':
          'ਮਾਫ਼ ਕਰੋ, ਮੈਨੂੰ ਇੱਕ ਗਲਤੀ ਦਾ ਸਾਹਮਣਾ ਕਰਨਾ ਪਿਆ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।',
    },

    'error_insufficient_funds': {
      'en': 'Insufficient funds. Please check your balance.',
      'hi': 'अपर्याप्त धन। कृपया अपना बैलेंस जांचें।',
      'ta': 'போதுமான நிதி இல்லை. உங்கள் இருப்பை சரிபார்க்கவும்.',
      'te': 'తగినంత డబ్బు లేదు. దయచేసి మీ బ్యాలెన్స్ తనిఖీ చేయండి.',
      'bn': 'অপর্যাপ্ত তহবিল। অনুগ্রহ করে আপনার ব্যালেন্স চেক করুন।',
      'gu': 'અપૂરતા ભંડોળ. કૃપા કરીને તમારું બેલેન્સ તપાસો.',
      'ml': 'പര്യാപ്തമായ ധനം ഇല്ല. ദയവായി നിങ്ങളുടെ ബാലൻസ് പരിശോധിക്കുക.',
      'mr': 'अपुरे निधी. कृपया तुमचे बॅलन्स तपासा.',
      'kn': 'ಸಾಕಷ್ಟು ನಿಧಿ ಇಲ್ಲ. ದಯವಿಟ್ಟು ನಿಮ್ಮ ಬ್ಯಾಲೆನ್ಸ್ ಪರಿಶೀಲಿಸಿ.',
      'pa': 'ਅਪਰਿਪੂਰਨ ਫੰਡ। ਕਿਰਪਾ ਕਰਕੇ ਆਪਣਾ ਬੈਲੇਂਸ ਚੈੱਕ ਕਰੋ।',
    },
  };

  /// Translates a response message based on the current locale
  static String translateResponse(
      String messageKey, String locale, Map<String, String>? parameters) {
    final translations = _responseTranslations[messageKey];
    if (translations == null) {
      return messageKey; // Return key if no translation found
    }

    String translatedMessage =
        translations[locale] ?? translations['en'] ?? messageKey;

    // Replace parameters if provided
    if (parameters != null) {
      parameters.forEach((key, value) {
        translatedMessage = translatedMessage.replaceAll('{$key}', value);
      });
    }

    return translatedMessage;
  }

  /// Detects the message type and translates accordingly
  static String translateApiResponse(
      String originalMessage, String locale, Map<String, dynamic>? context) {
    // Convert to lowercase for easier matching
    final message = originalMessage.toLowerCase();

    // Extract amount and recipient from context if available
    final parameters = <String, String>{};
    if (context != null) {
      if (context['amount'] != null) {
        parameters['amount'] = context['amount'].toString();
      }
      if (context['recipient'] != null) {
        parameters['recipient'] = context['recipient'].toString();
      }
      if (context['count'] != null) {
        parameters['count'] = context['count'].toString();
      }
    }

    // Pattern matching for different response types
    // Only translate if the message is a simple key or very basic response
    // Don't override complex API messages that are already properly formatted

    if (message.contains('balance') &&
        message.contains('rupees') &&
        !message.contains('i can help you with')) {
      return translateResponse('balance_success', locale, parameters);
    } else if (message.contains('here are your') &&
        message.contains('transactions') &&
        message.contains('recent')) {
      // Only translate the specific "Here are your X recent transactions" pattern
      return translateResponse('transactions_found', locale, parameters);
    } else if (message.contains('no transactions') ||
        message.contains('not found')) {
      return translateResponse('no_transactions', locale, parameters);
    } else if (message.contains('transfer') &&
        message.contains('initiated') &&
        !message.contains('i can help you with')) {
      return translateResponse('transfer_success', locale, parameters);
    } else if (message.contains('transfer') &&
        (message.contains('failed') || message.contains('error')) &&
        !message.contains('i can help you with')) {
      return translateResponse('transfer_failed', locale, parameters);
    } else if (message.contains('insufficient funds')) {
      return translateResponse('error_insufficient_funds', locale, parameters);
    } else if ((message.contains('error') || message.contains('sorry')) &&
        !message.contains('i can help you with') &&
        !message.contains('didn\'t understand')) {
      // Don't override complex error messages that are already well-formatted
      return translateResponse('error_generic', locale, parameters);
    }

    // If no pattern matches, return original message
    return originalMessage;
  }

  /// Get the current locale from context
  static String getCurrentLocale(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return locale.languageCode;
  }
}
