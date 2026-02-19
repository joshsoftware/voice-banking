// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Lingo Voice Banking';

  @override
  String get loginPrompt => 'Enter your mobile number';

  @override
  String get otpPrompt => 'Enter OTP';

  @override
  String get micHint => 'Tap the mic to speak';

  @override
  String get tapToSpeak => 'Tap to speak';

  @override
  String get listening => 'Listening...';

  @override
  String get transcribing => 'Transcribing...';

  @override
  String get executing => 'Processing your request...';

  @override
  String get otpSuccess => 'OTP verified successfully!';

  @override
  String balanceResponse(Object amount) {
    return 'Your current balance is $amount rupees.';
  }

  @override
  String get failedIntent => 'Sorry, I didn\'t catch that.';

  @override
  String get recTxns => 'Recent transactions';

  @override
  String get curBalance => 'Available balance';

  @override
  String get msgNoTransactionFound => 'No transactions found.';

  @override
  String get logout => 'Logout';

  @override
  String get logoutConfirm => 'Are you sure you want to logout?';

  @override
  String get logoutSuccess => 'Logged out successfully!';

  @override
  String get welcomeBack => 'Welcome! ';

  @override
  String get voiceBankingDashboard => 'Your voice banking dashboard';

  @override
  String get availableBalance => 'Available Balance';

  @override
  String get viewAll => 'View All';

  @override
  String get voice => 'Voice';

  @override
  String get stop => 'Stop';

  @override
  String get cancel => 'Cancel';

  @override
  String get stopVoiceBankingConfirm => 'Stop voice banking? All current voice activity will be cancelled.';

  @override
  String get welcomeTo => 'Welcome to';

  @override
  String get experienceBanking => 'Experience banking with the power of voice';

  @override
  String get enterMobileNumber => 'Enter Mobile Number';

  @override
  String get weWillSendOtp => 'We\'ll send you an OTP to verify your number';

  @override
  String get mobileNumber => 'Mobile Number';

  @override
  String get enterYourMobileNumber => 'Enter your 10-digit mobile number';

  @override
  String get sendOtp => 'Send OTP';

  @override
  String get pleaseEnterValidMobile => 'Please enter a valid 10-digit mobile number';

  @override
  String get verifyYourPhone => 'Verify Your Phone';

  @override
  String get weHaveSentCode => 'We\'ve sent a 6-digit code to';

  @override
  String get enterVerificationCode => 'Enter Verification Code';

  @override
  String get enterSixDigitCode => 'Enter the 6-digit code sent to your phone';

  @override
  String get verifyOtp => 'Verify OTP';

  @override
  String get didntReceiveCode => 'Didn\'t receive the code? ';

  @override
  String resendIn(Object seconds) {
    return 'Resend in ${seconds}s';
  }

  @override
  String get resendOtp => 'Resend OTP';

  @override
  String get otpValidFor => 'Your OTP is valid for 5 minutes and can only be used once.';

  @override
  String get secureVerification => 'Secure verification powered by AI';

  @override
  String get otpVerifiedSuccessfully => '✅ OTP verified successfully!';

  @override
  String get invalidOtp => '❌ Invalid OTP, please try again';

  @override
  String newOtpSent(Object mobileNumber) {
    return ' New OTP sent to $mobileNumber';
  }

  @override
  String get pleaseEnterOtp => 'Please enter the OTP';

  @override
  String get otpMustBeSixDigits => 'OTP must be 6 digits';

  @override
  String get whyChooseVoiceBanking => 'Why Choose Voice Banking?';

  @override
  String get voiceCommands => 'Voice Commands';

  @override
  String get controlWithVoice => 'Control with your voice';

  @override
  String get secure => 'Secure';

  @override
  String get bankGradeSecurity => 'Bank-grade security';

  @override
  String get multiLanguage => 'Multi-language';

  @override
  String get supportForLanguages => 'Support for 10+ languages';

  @override
  String get fast => 'Fast';

  @override
  String get quickTransactions => 'Quick transactions';

  @override
  String get poweredByAI => 'Powered by AI Technology';

  @override
  String get paymentInitiated => 'Payment initiated 🚀';

  @override
  String get viewAllTransactions => 'View all transactions';

  @override
  String get aiIsSpeaking => 'AI is speaking…';

  @override
  String get validationRequired => 'This field is required';

  @override
  String get validationEmail => 'Please enter a valid email';

  @override
  String get validationPhone => 'Please enter a valid phone number';

  @override
  String get validationOtp => 'Please enter a valid OTP';

  @override
  String get allTransactions => 'All Transactions';

  @override
  String get transactions => 'transactions';

  @override
  String get loading => 'Loading...';

  @override
  String get errorLoadingTransactions => 'Error loading transactions';

  @override
  String get retry => 'Retry';

  @override
  String get noTransactionsFound => 'No transactions found';

  @override
  String get noTransactionsDescription => 'You don\'t have any transactions yet';

  @override
  String get faq => 'FAQ';

  @override
  String get frequentlyAskedQuestions => 'Frequently Asked Questions';

  @override
  String get learnHowToUseVoiceBanking => 'Learn how to use voice banking effectively';

  @override
  String get whatToSpeak => 'What to speak';

  @override
  String get whatToSpeakDescription => 'For example, You can ask what is my current balance';

  @override
  String get howToCheckTransactions => 'How to check transactions';

  @override
  String get howToCheckTransactionsDescription => 'You can ask what is my last x transactions';

  @override
  String get voiceCommandsDescription => 'Speak clearly and naturally. The system understands conversational language.';

  @override
  String get supportedLanguages => 'Supported Languages';

  @override
  String get supportedLanguagesDescription => 'Currently supports English, Hindi, Bengali, Gujarati, Kannada, Malayalam, Marathi, Punjabi, Tamil, and Telugu.';

  @override
  String get privacySecurity => 'Privacy & Security';

  @override
  String get privacySecurityDescription => 'Your voice data is processed securely and is not stored permanently.';

  @override
  String get proTips => 'Pro Tips';

  @override
  String get tipQuietEnvironment => 'Speak in a quiet environment for better recognition';

  @override
  String get tipNaturalLanguage => 'Use natural language like \"Show me my balance\"';

  @override
  String get tipWaitForIndicator => 'Wait for the listening indicator before speaking';

  @override
  String get needMoreHelp => 'Need More Help?';

  @override
  String get contactSupportDescription => 'Contact our support team for additional assistance';

  @override
  String balanceSuccess(Object amount) {
    return 'Your current balance is $amount rupees.';
  }

  @override
  String transactionsFound(Object count) {
    return 'Here are your $count most recent transactions.';
  }

  @override
  String get noTransactions => 'No transactions found.';

  @override
  String transferSuccess(Object amount, Object recipient) {
    return 'Transfer of $amount rupees to $recipient has been initiated successfully.';
  }

  @override
  String get transferFailed => 'Transfer failed. Please try again.';

  @override
  String get errorGeneric => 'Sorry, I encountered an error. Please try again.';

  @override
  String get errorInsufficientFunds => 'Insufficient funds. Please check your balance.';

  @override
  String get pleaseSaySomething => 'Please say something';

  @override
  String get voiceRegistration => 'Voice Registration';

  @override
  String get pleaseWaitForUpload => 'Please wait for upload to complete';

  @override
  String get voiceRegistrationCompleted => 'Voice registration completed successfully!';

  @override
  String get unknownState => 'Unknown state';

  @override
  String get uploadingVoiceRecordings => 'Uploading voice recordings...';

  @override
  String imageNumber(Object number) {
    return 'Image $number';
  }

  @override
  String get somethingWentWrong => 'Something went wrong';

  @override
  String get imageNotAvailable => 'Image not available';

  @override
  String stepOfTotal(Object current, Object total) {
    return 'Step $current of $total';
  }

  @override
  String get describeImageInstruction => 'Please describe what you see in this image. Speak clearly and describe the main elements.';

  @override
  String get stopRecording => 'Stop Recording';

  @override
  String get reRecord => 'Re-record';

  @override
  String get startRecording => 'Start Recording';

  @override
  String get recording => 'Recording...';

  @override
  String get stopDescription => 'Stop Description';

  @override
  String get playDescription => 'Play Description';

  @override
  String get nextStep => 'Next Step';

  @override
  String get register => 'Register';

  @override
  String get pleaseWaitForDescription => 'Please wait for the description to finish playing.';

  @override
  String get microphonePermissionRequired => 'Microphone permission is required. Please enable it in Settings.';

  @override
  String failedToStartRecording(Object error) {
    return 'Failed to start recording: $error';
  }

  @override
  String get recordingFailed => 'Recording failed. Please try again.';

  @override
  String get recordingFileNotFound => 'Recording file not found. Please try again.';

  @override
  String get recordingEmpty => 'Recording is empty. Please try again.';

  @override
  String failedToStopRecording(Object error) {
    return 'Failed to stop recording: $error';
  }

  @override
  String get pleaseStopRecordingBeforePlay => 'Please stop recording before playing the description.';

  @override
  String failedToPlayDescription(Object error) {
    return 'Failed to play description: $error';
  }

  @override
  String failedToStopDescription(Object error) {
    return 'Failed to stop description: $error';
  }

  @override
  String get pleaseRecordBeforeProceeding => 'Please record your voice before proceeding.';

  @override
  String get pleaseWaitForRecordingOrDescription => 'Please wait for recording or description to complete.';

  @override
  String get pleaseCompleteAllRecordings => 'Please complete all 3 recordings before submitting.';

  @override
  String get userIdNotFound => 'User ID not found. Please log in again.';

  @override
  String get recordingFilesMissing => 'One or more recording files are missing.';

  @override
  String get imageDescriptionBoardMeeting => 'A professional man gives a data presentation to colleagues in a modern, sunlit office boardroom overlooking a scenic city skyline.';

  @override
  String get imageDescriptionBoyWithDog => 'A boy wearing glasses walks a husky dog on a sunny park pathway, smiling while holding the leash.';

  @override
  String get imageDescriptionChildrenPainting => 'Five children sit on a carpet near a large window, happily painting colorful pictures together inside a bright living room.';

  @override
  String get imageDescriptionChildrenWithDog => 'Four children play joyfully with two dogs in a lush green garden, tossing a frisbee under the bright afternoon sun.';

  @override
  String get imageDescriptionConstructionSite => 'Four construction professionals in safety vests and hard hats stand on a dusty site, carefully reviewing a large architectural building blueprint.';

  @override
  String get imageDescriptionFamilyDinner => 'A happy family of four enjoys a traditional Indian dinner at a restaurant, sharing food and laughter in a warm atmosphere.';

  @override
  String get imageDescriptionHoliCelebration => 'A joyful group of family and friends celebrate Holi, laughing together amidst a vibrant explosion of colorful powders in the air.';

  @override
  String get imageDescriptionLadyPainting => 'A young woman focuses on painting a beautiful yellow landscape on a canvas in her sun-drenched, cozy home art studio.';

  @override
  String get imageDescriptionMomAndSon => 'A mother helps her young son cook at the stove, standing on a wooden stool in a bright, modern white kitchen.';

  @override
  String get imageDescriptionPeopleDiwaliCelebration => 'People in traditional attire celebrate Diwali on a decorated street with vibrant lanterns, glowing diyas, and a spectacular firework display overhead.';

  @override
  String get imageDescriptionTajMahal => 'A group of young friends in denim jackets stands on a rooftop, holding coffee and smiling with the Taj Mahal behind.';

  @override
  String get imageDescriptionVillageScene => 'An elderly farmer sits atop a wooden bullock cart pulled by two white oxen, carrying a large harvest during a golden sunset.';

  @override
  String get imageDescriptionWomenDiwaliCelebration => 'A woman in pink traditional clothing carefully creates a beautiful, colorful rangoli on the ground surrounded by glowing oil lamps.';

  @override
  String get resetVoice => 'Reset Voice';

  @override
  String get resetVoiceConfirm => 'This will delete your voice profile. You will need to complete voice registration again. Continue?';

  @override
  String get resetVoiceSuccess => 'Voice reset successfully. Please complete registration again.';

  @override
  String get resetVoiceError => 'Failed to reset voice. Please try again.';
}
