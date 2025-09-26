import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/models.dart' as models;
import '../services/voice_repository.dart';
import '../services/banking_api.dart';
import '../services/tts_service.dart';
import '../services/shared_preferences_service.dart';
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

class VoiceBloc extends Bloc<VoiceEvent, VoiceState> {
  final VoiceRepository repo;
  final BankingAPI bank = BankingAPI();
  final TTSService tts = TTSService();

  VoiceBloc(this.repo) : super(Idle()) {
    on<StartListening>((e, emit) async {
      await repo.start();
      emit(Listening());
    });

    on<StopListening>((e, emit) async {
      emit(Transcribing());
      final data = await repo.stopAndTranscribe(locale: e.locale);
      add(GotTranscript(data, e.locale));
    });

    on<Reset>((e, emit) {
      emit(Idle());
    });

    on<GotTranscript>((e, emit) async {
      print("=== NEW VOICE BLOC CODE IS RUNNING - LANGUAGE FIX VERSION ===");
      // Get orchestrator data and intent data
      final orchestratorData = e.data["orchestrator_data"];
      final intentData = e.data["intent_data"];
      final message = e.data["message"] ?? "";
      final translation = e.data["translation"] ?? "";
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

      // Handle different intents
      if (intentName == "recent_txn" && orchestratorData != null) {
        // Handle recent transactions - show popup dialog

        // Get transactions from orchestrator data
        List<Map<String, dynamic>> transactions = [];
        if (orchestratorData["data"] != null &&
            orchestratorData["data"]["transactions"] != null) {
          transactions = List<Map<String, dynamic>>.from(
              orchestratorData["data"]["transactions"]);
        }

        // Get message for transactions
        String transactionMessage = orchestratorData["message"] ??
            orchestratorData["data"]?["message"] ??
            "Here are your recent transactions";

        // Speak the message
        try {
          await tts.speak(transactionMessage, langCode: ttsLanguage);
        } catch (e) {
          print("TTS Error: $e");
        }

        // Show transactions dialog
        emit(ShowTransactionsDialog(
            transactionMessage, transactions, sessionId));
        add(Reset());
        return;
      }

      // Handle other intents (transfer money, check balance, etc.)
      String? orchestratorMessage;

      if (orchestratorData != null) {
        // Case 1: error message at top-level (failure cases)
        if (orchestratorData["message"] != null &&
            orchestratorData["message"].toString().trim().isNotEmpty) {
          orchestratorMessage = orchestratorData["message"].toString().trim();
        }
        // Case 2: success message inside data (success cases)
        else if (orchestratorData["data"] != null &&
            orchestratorData["data"]["message"] != null &&
            orchestratorData["data"]["message"].toString().trim().isNotEmpty) {
          orchestratorMessage =
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
        }
      }

      if (orchestratorMessage != null) {
        try {
          await tts.speak(orchestratorMessage, langCode: ttsLanguage);
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

        emit(Executing(orchestratorMessage, VoiceIntent(intentType)));
        add(Reset());
        return;
      }

      // NO FALLBACKS - JUST RESET
      add(Reset());
    });
  }
}
