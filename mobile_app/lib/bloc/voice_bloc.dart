import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/models.dart' as models;
import '../services/voice_repository.dart';
import '../services/banking_api.dart';
import '../services/tts_service.dart';
import '../services/shared_preferences_service.dart';
import '../services/translation_service.dart';
import '../models/voice_intent.dart';

sealed class VoiceState {}

class Idle extends VoiceState {}

class Listening extends VoiceState {}

class Transcribing extends VoiceState {}

class Understood extends VoiceState {
  final models.Intent intent;
  Understood(this.intent);
}

class Executing extends VoiceState {
  final String message;
  final VoiceIntent intent;
  Executing(this.message, this.intent);
}

class ShowTransactionsDialog extends VoiceState {
  final String message;
  final List<Map<String, dynamic>> transactions;
  final String sessionId;
  ShowTransactionsDialog(this.message, this.transactions, this.sessionId);
}

class ShowOtpDialog extends VoiceState {
  final String message;
  final String sessionId;
  final String recipient;
  final double amount;
  ShowOtpDialog(this.message, this.sessionId, this.recipient, this.amount);
}

class ShowDuplicateDialog extends VoiceState {
  final String message;
  final String sessionId;
  final List<Map<String, dynamic>> beneficiaries;
  ShowDuplicateDialog(this.message, this.sessionId, this.beneficiaries);
}

class ShowBeneficiariesDialog extends VoiceState {
  final String message;
  final List<Map<String, dynamic>> beneficiaries;
  final String sessionId;
  ShowBeneficiariesDialog(this.message, this.beneficiaries, this.sessionId);
}

sealed class VoiceEvent {}

class StartListening extends VoiceEvent {}

class StopListening extends VoiceEvent {
  final String locale;
  StopListening({required this.locale});
}

class GotTranscript extends VoiceEvent {
  final Map<String, dynamic> data;
  final String locale;
  GotTranscript(this.data, this.locale);
}

class Reset extends VoiceEvent {}

class VerifyOtp extends VoiceEvent {
  final String otp;
  final String sessionId;
  final String locale;
  VerifyOtp({required this.otp, required this.sessionId, required this.locale});
}

class VoiceBloc extends Bloc<VoiceEvent, VoiceState> {
  final VoiceRepository repo;
  final BankingAPI bank = BankingAPI();
  final TTSService tts = TTSService();
  String _currentLocale = 'en'; // Track current locale
  bool _isDuplicateSelection =
      false; // Track if we're in duplicate selection mode
  String? _duplicateSessionId; // Store session ID for duplicate selection

  VoiceBloc(this.repo) : super(Idle()) {
    on<StartListening>((e, emit) async {
      try {
        await repo.start();
        emit(Listening());
      } catch (e) {
        print("Voice Bloc Error - Permission denied: $e");
        // Show a snackbar or dialog to inform user about permission
        emit(Idle());
      }
    });

    on<StopListening>((e, emit) async {
      emit(Transcribing());
      _currentLocale = e.locale; // Store current locale

      // Check if we're in duplicate selection mode
      print(
          "Voice Bloc Debug - Duplicate selection mode: $_isDuplicateSelection");
      print("Voice Bloc Debug - Duplicate session ID: $_duplicateSessionId");

      if (_isDuplicateSelection && _duplicateSessionId != null) {
        try {
          print("Voice Bloc Debug - Processing duplicate selection with audio");
          // For duplicate selection, we need to send the audio file with session ID
          final data = await repo.stopAndTranscribeWithSessionId(
              sessionId: _duplicateSessionId!, locale: e.locale);
          // Reset duplicate selection mode
          _isDuplicateSelection = false;
          _duplicateSessionId = null;
          add(GotTranscript(data, e.locale));
        } catch (error) {
          print("Duplicate Selection Error: $error");
          emit(Executing("Beneficiary selection failed. Please try again.",
              VoiceIntent(VoiceIntentType.unknown)));
          add(Reset());
        }
      } else {
        print("Voice Bloc Debug - Processing normal voice input");
        final data = await repo.stopAndTranscribe(locale: e.locale);
        add(GotTranscript(data, e.locale));
      }
    });

    on<Reset>((e, emit) {
      emit(Idle());
    });

    on<VerifyOtp>((e, emit) async {
      emit(Transcribing());

      try {
        // Call the transcribe API with OTP in header
        final data = await repo.verifyOtpWithTranscribe(
            otp: e.otp, sessionId: e.sessionId, locale: e.locale);

        // Process the response similar to GotTranscript
        add(GotTranscript(data, e.locale));
      } catch (error) {
        print("OTP Verification Error: $error");
        emit(Executing("OTP verification failed. Please try again.",
            VoiceIntent(VoiceIntentType.unknown)));
        add(Reset());
      }
    });

    on<GotTranscript>((e, emit) async {
      print("=== NEW VOICE BLOC CODE IS RUNNING - LANGUAGE FIX VERSION ===");
      print("Voice Bloc Debug - GotTranscript handler started");
      // Get orchestrator data and intent data
      final orchestratorData = e.data["orchestrator_data"];
      final intentData = e.data["intent_data"];
      final sessionId = e.data["session_id"] ?? "";

      print("Voice Bloc Debug - Full intentData: $intentData");
      print("Voice Bloc Debug - intentData type: ${intentData.runtimeType}");

      // Use the language detected by the API from intent_data.language
      final ttsLanguage = intentData?["language"] ?? "en";
      print(
          "Voice Bloc Debug - API detected language: ${intentData?["language"]}");
      print("Voice Bloc Debug - TTS language to use: $ttsLanguage");
      print("Voice Bloc Debug - Passed locale: ${e.locale}");

      // Parse intent
      String intentName = intentData?["intent"] ?? "unknown";

      print("Voice Bloc Debug - Parsed intentName: $intentName");
      print("Voice Bloc Debug - About to start intent handling section");
      print("Voice Bloc Debug - Full intentData: $intentData");
      print("Voice Bloc Debug - Full orchestratorData: $orchestratorData");
      print(
          "Voice Bloc Debug - orchestratorData is null: ${orchestratorData == null}");
      print("Voice Bloc Debug - About to check for recent_txn intent");
      print("Voice Bloc Debug - About to check for list_beneficiaries intent");
      print("Voice Bloc Debug - About to start intent handling section");

      // Check if beneficiaries data exists
      if (orchestratorData != null && orchestratorData["data"] != null) {
        print(
            "Voice Bloc Debug - orchestratorData.data exists: ${orchestratorData["data"]}");
        if (orchestratorData["data"]["beneficiaries"] != null) {
          print(
              "Voice Bloc Debug - beneficiaries data found: ${orchestratorData["data"]["beneficiaries"]}");
        } else {
          print(
              "Voice Bloc Debug - No beneficiaries data in orchestrator_data.data");
        }
      }

      // Check if there's an early message processing happening
      if (orchestratorData != null && orchestratorData["message"] != null) {
        print(
            "Voice Bloc Debug - Found message in orchestrator_data: ${orchestratorData["message"]}");
      }

      // Check if there's any early processing that might be calling TTS
      print("Voice Bloc Debug - About to check for early TTS processing");

      // Handle different intents
      print(
          "Voice Bloc Debug - About to check intent handlers for: $intentName");
      if (intentName == "recent_txn" && orchestratorData != null) {
        // Handle recent transactions - show popup dialog

        // Get transactions from orchestrator data
        List<Map<String, dynamic>> transactions = [];
        if (orchestratorData["data"] != null &&
            orchestratorData["data"]["transactions"] != null) {
          transactions = List<Map<String, dynamic>>.from(
              orchestratorData["data"]["transactions"]);
        }

        // Get message for transactions (use English from backend)
        String originalMessage = orchestratorData["message"] ??
            orchestratorData["data"]?["message"] ??
            "Here are your recent transactions";

        // Translate the message to user's language
        final transactionCount = transactions.length;
        final context = {'count': transactionCount.toString()};
        String translatedMessage = TranslationService.translateApiResponse(
            originalMessage, _currentLocale, context);

        // Speak the translated message
        try {
          await tts.speak(translatedMessage, langCode: ttsLanguage);
        } catch (e) {
          print("TTS Error: $e");
        }

        // Show transactions dialog
        emit(
            ShowTransactionsDialog(translatedMessage, transactions, sessionId));
        add(Reset());
        return;
      }

      print(
          "Voice Bloc Debug - After recent_txn check, checking beneficiaries for: $intentName");
      // Handle list beneficiaries intent - check multiple possible intent names
      print(
          "Voice Bloc Debug - Checking list_beneficiaries condition: intentName='$intentName', orchestratorData null=${orchestratorData == null}");
      if ((intentName == "list_beneficiaries" ||
              intentName == "show_beneficiaries" ||
              intentName == "beneficiaries_list" ||
              intentName == "get_beneficiaries") &&
          orchestratorData != null) {
        print("Voice Bloc Debug - Processing list_beneficiaries intent");

        // Get beneficiaries from orchestrator data
        List<Map<String, dynamic>> beneficiaries = [];
        if (orchestratorData["data"] != null &&
            orchestratorData["data"]["beneficiaries"] != null) {
          beneficiaries = List<Map<String, dynamic>>.from(
              orchestratorData["data"]["beneficiaries"]);
          print(
              "Voice Bloc Debug - Found ${beneficiaries.length} beneficiaries");
        } else {
          print(
              "Voice Bloc Debug - No beneficiaries found in orchestrator data");
        }

        // Get message for beneficiaries (use English from backend)
        String originalMessage = orchestratorData["message"] ??
            orchestratorData["data"]?["message"] ??
            "Here are your beneficiaries";

        print("Voice Bloc Debug - Original message: $originalMessage");

        // Translate the message to user's language
        final beneficiaryCount = beneficiaries.length;
        final context = {'count': beneficiaryCount.toString()};
        String translatedMessage = TranslationService.translateApiResponse(
            originalMessage, _currentLocale, context);

        print("Voice Bloc Debug - Translated message: $translatedMessage");

        // Speak the translated message
        try {
          await tts.speak(translatedMessage, langCode: ttsLanguage);
        } catch (e) {
          print("TTS Error: $e");
        }

        // Show beneficiaries dialog
        print("Voice Bloc Debug - Emitting ShowBeneficiariesDialog");
        emit(ShowBeneficiariesDialog(
            translatedMessage, beneficiaries, sessionId));
        add(Reset());
        return;
      }

      // Handle OTP status for transfer money
      if (intentName == "transfer_money" && orchestratorData != null) {
        // Check if the response indicates OTP is required (regardless of success status)
        if (orchestratorData["data"] != null &&
            orchestratorData["data"]["status"] == "otp") {
          final message = orchestratorData["data"]["message"] ??
              "Please confirm the transaction with OTP";

          // Extract recipient and amount from intent_data.entities
          final recipient = intentData?["entities"]?["recipient"]?.toString() ??
              orchestratorData["data"]["recipient"] ??
              "Unknown";
          final amount = (intentData?["entities"]?["amount"]?.toDouble() ??
              orchestratorData["data"]["amount"]?.toDouble() ??
              0.0);

          // Translate the message to user's language
          String translatedMessage = TranslationService.translateApiResponse(
              message,
              _currentLocale,
              {'amount': amount.toString(), 'recipient': recipient});

          // Speak the translated message
          try {
            await tts.speak(translatedMessage, langCode: ttsLanguage);
          } catch (e) {
            print("TTS Error: $e");
          }

          // Show OTP dialog
          emit(ShowOtpDialog(translatedMessage, sessionId, recipient, amount));
          add(Reset());
          return;
        }

        // Check if the response indicates duplicate beneficiaries (regardless of success status)
        if (orchestratorData["data"] != null &&
            orchestratorData["data"]["status"] == "duplicate") {
          final message = orchestratorData["data"]["message"] ??
              "Multiple beneficiaries found. Please select one.";
          final beneficiaries = List<Map<String, dynamic>>.from(
              orchestratorData["data"]["beneficiaries"] ?? []);

          // Set duplicate selection mode and store session ID
          _isDuplicateSelection = true;
          _duplicateSessionId = sessionId;
          await SharedPreferencesService.saveSessionId(sessionId);

          // Translate the message to user's language
          String translatedMessage = TranslationService.translateApiResponse(
              message, _currentLocale, {});

          // Speak the translated message
          try {
            await tts.speak(translatedMessage, langCode: ttsLanguage);
          } catch (e) {
            print("TTS Error: $e");
          }

          // Show duplicate beneficiaries dialog
          emit(
              ShowDuplicateDialog(translatedMessage, sessionId, beneficiaries));
          // Don't reset here - we need to maintain duplicate selection mode
          return;
        }
      }

      // Handle unknown intents - show error message
      if (intentName == "unknown") {
        String? originalMessage;

        print("Voice Bloc Debug - Unknown intent detected");
        print("Voice Bloc Debug - orchestratorData: $orchestratorData");
        print("Voice Bloc Debug - Full response data: ${e.data}");

        // Get the error message from orchestrator data
        if (orchestratorData != null &&
            orchestratorData["message"] != null &&
            orchestratorData["message"].toString().trim().isNotEmpty) {
          originalMessage = orchestratorData["message"].toString().trim();
          print(
              "Voice Bloc Debug - Found message in orchestratorData: $originalMessage");
        } else {
          print(
              "Voice Bloc Debug - No message found in orchestratorData, checking main response");
          // Check if there's a message in the main response data
          if (e.data["message"] != null &&
              e.data["message"].toString().trim().isNotEmpty) {
            originalMessage = e.data["message"].toString().trim();
            print(
                "Voice Bloc Debug - Found message in main response: $originalMessage");
          }
        }

        if (originalMessage != null) {
          // Translate the message to user's language
          String translatedMessage = TranslationService.translateApiResponse(
              originalMessage, _currentLocale, {});

          print("Voice Bloc Debug - Translated message: $translatedMessage");

          // Speak the translated message
          try {
            await tts.speak(translatedMessage, langCode: ttsLanguage);
          } catch (e) {
            print("TTS Error: $e");
          }

          // Show the error message
          emit(Executing(
              translatedMessage, VoiceIntent(VoiceIntentType.unknown)));
          add(Reset());
          return;
        } else {
          print(
              "Voice Bloc Debug - No message found for unknown intent, will fall through to general handling");
        }
      }

      // Handle other intents (transfer money, check balance, etc.) - skip unknown intents
      print(
          "Voice Bloc Debug - Reached general handler for intent: $intentName");
      String? originalMessage;

      if (orchestratorData != null && intentName != "unknown") {
        // Case 1: error message at top-level (failure cases)
        if (orchestratorData["message"] != null &&
            orchestratorData["message"].toString().trim().isNotEmpty) {
          originalMessage = orchestratorData["message"].toString().trim();
        }
        // Case 2: success message inside data (success cases)
        else if (orchestratorData["data"] != null &&
            orchestratorData["data"]["message"] != null &&
            orchestratorData["data"]["message"].toString().trim().isNotEmpty) {
          originalMessage =
              orchestratorData["data"]["message"].toString().trim();
        }

        // Update balance and customer name from orchestrator data if available
        if (orchestratorData["data"] != null) {
          final balance = orchestratorData["data"]["balance"];
          final customerName = orchestratorData["data"]["customer_name"];

          if (balance != null) {
            // Store balance in shared preferences for UI updates
            await SharedPreferencesService.saveBalance(balance.toString());
          }

          if (customerName != null &&
              customerName.toString().trim().isNotEmpty) {
            await SharedPreferencesService.saveCustomerName(
                customerName.toString().trim());
          }

          // Handle recent transactions for any intent that has them

          if (orchestratorData["data"]["recent_transactions"] != null) {
            final recentTransactions = List<Map<String, dynamic>>.from(
                orchestratorData["data"]["recent_transactions"]);

            // Store recent transactions in shared preferences for UI updates
            await SharedPreferencesService.saveRecentTransactions(
                recentTransactions);
          }
        }
      }

      // Fallback: Check for recent transactions in the main response data
      if (e.data["recent_transactions"] != null) {
        final recentTransactions =
            List<Map<String, dynamic>>.from(e.data["recent_transactions"]);
        await SharedPreferencesService.saveRecentTransactions(
            recentTransactions);
      }

      if (originalMessage != null) {
        // Translate the message to user's language
        Map<String, dynamic> context = {};

        // Add context based on intent type
        if (intentName == "check_balance" && orchestratorData["data"] != null) {
          final balance = orchestratorData["data"]["balance"];
          if (balance != null) {
            context['amount'] = balance.toString();
          }
        } else if (intentName == "transfer_money" &&
            orchestratorData["data"] != null) {
          final amount = orchestratorData["data"]["amount"];
          final recipient = orchestratorData["data"]["recipient"];
          if (amount != null) {
            context['amount'] = amount.toString();
          }
          if (recipient != null) {
            context['recipient'] = recipient.toString();
          }
        }

        String translatedMessage = TranslationService.translateApiResponse(
            originalMessage, _currentLocale, context);

        try {
          await tts.speak(translatedMessage, langCode: ttsLanguage);
        } catch (e) {
          print("TTS Error: $e");
        }

        // Determine intent type for execution state
        VoiceIntentType intentType = VoiceIntentType.unknown;
        switch (intentName) {
          case "transfer_money":
            intentType = VoiceIntentType.transferMoney;
            break;
          case "check_balance":
            intentType = VoiceIntentType.checkBalance;
            break;
          case "recent_txn":
            intentType = VoiceIntentType.recentTransactions;
            break;
          default:
            intentType = VoiceIntentType.unknown;
        }

        emit(Executing(translatedMessage, VoiceIntent(intentType)));
        add(Reset());
        return;
      }

      // NO FALLBACKS - JUST RESET
      print("Voice Bloc Debug - No handlers matched, resetting to idle");
      add(Reset());
    });
  }
}
