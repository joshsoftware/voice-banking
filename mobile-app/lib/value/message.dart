class AppMessages {
  static const String appTitle = "Audio Banking";

  static const String appStateLabelIdle = "Say Something like";
  static const String appStateLabelRecorded = "Submit?";
  static const String appStateLabelProcessing = "Hold on";

  static const String actionExtractionFailed = "Couldn't get you, try again.";
  static const String permissionMicNotGranted =
      "Microphone permission not granted";

  static const String moneyTransferTitle = "Transfer";
  static const String moneyTransferSubtitleSuffix = "to";
  static const String moneyTransferCTALabel = "Confirm";

  static const String accountBalanceCheckTitle = "Account Balance";
  static const String accountBalanceCheckSuffix = "as of";
  static const String accountBalanceCheckCTALabel = "OK";

  static const String loanEmiCheckTitle = "Next EMI is";
  static const String loanEmiCheckSuffix = "due on";
  static const String loanEmiCheckCTALabel = "OK";

  static const List<String> voiceCommandSamplesMarathi = [
    "माझ्या खात्यातील शिल्लक किती आहे",
    "माझा पुढचा EMI कधी आहे",
    "किरणला 500 रुपये ट्रान्सफर करा"
  ];
  static const List<String> voiceCommandSamplesHindi = [
    "मेरे खाते की शेष राशि क्या है",
    "मेरी अगली EMI कब है",
    "किरण को 500 रुपए ट्रांसफर कर दो"
  ];
  static const List<String> voiceCommandSamplesBengali = [
    "আমার অ্যাকাউন্ট ব্যালেন্স কি",
    "আমার পরবর্তী ইএমআই কখন",
    "কিরণকে 500 টাকা স্থানান্তর করুন"
  ];
  static const List<String> voiceCommandSamplesTamil = [
    "எனது கணக்கு இருப்பு என்ன?",
    "எனது அடுத்த EMI எப்போது",
    "கிரணுக்கு 500 ரூபாயை மாற்றவும்"
  ];
}
