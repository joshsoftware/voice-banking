import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/models.dart' as models;
import '../services/voice_repository.dart';
import '../services/banking_api.dart';
import '../services/tts_service.dart';
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
      //e.data["intent_data"] = {"intent":"spend_insights","entities":{"timeframe":"last_week","merchant":"amazon"},"language":"en-IN"};
      //e.data["intent_data"] = {"intent":"spend_insights","entities":{'amount': 'None', 'currency': 'None', 'recipient': 'None', 'timeframe': 'this_month', 'date': 'None', 'category': 'None', 'merchant': 'amazon', 'count': 'None'}};
      //e.data["intent_data"] = {"intent":"transfer_money","entities":{"recipient":"Ananya","amount":1000,"currency":"INR"},"language":"en"};
      final intent = models.Intent(
          name: e.data["intent_data"]["intent"],
          entities: e.data["intent_data"]["entities"],
          action: e.data["intent_data"]["action"]);
      final voiceIntent = VoiceIntent.fromIntent(intent);
      if (intent.action != "respond") {
        await tts.speak(intent.action, langCode: e.locale);
        emit(Executing(intent.action, voiceIntent));
        add(Reset());
        return;
      }

      //emit(Understood(voiceIntent as Intent));

      final lang =
          e.locale; // Use the current app locale instead of API response
      emit(Understood(intent));

      // Check if we have orchestrator data with transactions
      final orchestratorData = e.data["orchestrator_data"];
      final message = e.data["message"] ?? "";

      print("Voice Bloc Debug - orchestratorData: $orchestratorData");
      print("Voice Bloc Debug - message: $message");

      // Debug each condition
      print(
          "Voice Bloc Debug - orchestratorData != null: ${orchestratorData != null}");
      if (orchestratorData != null) {
        print(
            "Voice Bloc Debug - orchestratorData['success']: ${orchestratorData['success']}");
        print(
            "Voice Bloc Debug - orchestratorData['success'] == true: ${orchestratorData['success'] == true}");
        print(
            "Voice Bloc Debug - orchestratorData['data']: ${orchestratorData['data']}");
        if (orchestratorData['data'] != null) {
          print(
              "Voice Bloc Debug - orchestratorData['data']['transactions']: ${orchestratorData['data']['transactions']}");
          print(
              "Voice Bloc Debug - orchestratorData['data']['transactions'] != null: ${orchestratorData['data']['transactions'] != null}");
          if (orchestratorData['data']['transactions'] != null) {
            final transactionsList =
                orchestratorData['data']['transactions'] as List;
            print(
                "Voice Bloc Debug - transactionsList.length: ${transactionsList.length}");
            print(
                "Voice Bloc Debug - transactionsList.isNotEmpty: ${transactionsList.isNotEmpty}");
          }
        }
      }

      if (orchestratorData != null &&
          (orchestratorData["success"] == true ||
              orchestratorData["success"] == "true") &&
          orchestratorData["data"]["transactions"] != null &&
          (orchestratorData["data"]["transactions"] as List).isNotEmpty) {
        final transactions = List<Map<String, dynamic>>.from(
            orchestratorData["data"]["transactions"]);
        final sessionId = e.data["session_id"] ?? "";

        print("Voice Bloc Debug - Found ${transactions.length} transactions");
        print("Voice Bloc Debug - Session ID: $sessionId");

        // Create a default message if none provided
        final displayMessage = message.isNotEmpty
            ? message
            : "Here are your ${transactions.length} most recent transactions.";

        print("Voice Bloc Debug - Display message: $displayMessage");

        // Read out the message from the API response
        try {
          print("Voice Bloc Debug - Attempting to speak message");
          await tts.speak(displayMessage, langCode: lang);
          print("Voice Bloc Debug - TTS speak completed");
        } catch (e) {
          print("TTS Error: $e");
        }

        // Show transactions dialog
        print("Voice Bloc Debug - Emitting ShowTransactionsDialog state");
        emit(ShowTransactionsDialog(displayMessage, transactions, sessionId));
        add(Reset());
        return;
      }

      // Fallback: If we have orchestrator data but condition failed, still try to show dialog
      if (orchestratorData != null &&
          orchestratorData["data"] != null &&
          orchestratorData["data"]["transactions"] != null) {
        print(
            "Voice Bloc Debug - Fallback: Trying to show dialog with orchestrator data");
        final transactions = List<Map<String, dynamic>>.from(
            orchestratorData["data"]["transactions"]);
        if (transactions.isNotEmpty) {
          final sessionId = e.data["session_id"] ?? "";
          final displayMessage = message.isNotEmpty
              ? message
              : "Here are your ${transactions.length} most recent transactions.";

          print(
              "Voice Bloc Debug - Fallback: Found ${transactions.length} transactions");

          // Read out the message from the API response
          try {
            print("Voice Bloc Debug - Fallback: Attempting to speak message");
            await tts.speak(displayMessage, langCode: lang);
            print("Voice Bloc Debug - Fallback: TTS speak completed");
          } catch (e) {
            print("TTS Error: $e");
          }

          // Show transactions dialog
          print(
              "Voice Bloc Debug - Fallback: Emitting ShowTransactionsDialog state");
          emit(ShowTransactionsDialog(displayMessage, transactions, sessionId));
          add(Reset());
          return;
        }
      }

      String response;
      switch (intent.name) {
        case "check_balance":
          final bal = await bank.getBalance();
          //response = bal.toStringAsFixed(2);
          response = "Your balance is rupees ${bal.toStringAsFixed(2)}";
          break;
        case "transfer_money":
          final amt = (intent.entities["amount"] ?? 0).toDouble();
          final payee = intent.entities["recipient"];
          response = await bank.pay(payee, amt);
          break;
        case "txn_insights":
          final merchant =
              intent.entities["merchant"] ?? intent.entities["category"];
          // Use transaction data from voice API response if available
          if (orchestratorData != null && orchestratorData["success"] == true) {
            final txns = orchestratorData["data"]["transactions"] ?? [];
            response = txns.isEmpty
                ? "No transactions found."
                : "Found ${txns.length} transactions for ${merchant}.";
          } else {
            // Fallback to API call if orchestrator data is not available
            final txns = await bank.searchTransactions(merchant: merchant);
            response = txns.isEmpty
                ? "No transactions found."
                : "Found ${txns.length} transactions for ${merchant}.";
          }
          break;
        case "recent_txn":
          // Use transaction data from voice API response instead of making separate API call
          if (orchestratorData != null && orchestratorData["success"] == true) {
            final txns = orchestratorData["data"]["transactions"] ?? [];
            response = "Last ${txns.length} transactions. " +
                txns
                    .map((t) => "${t["recipient"]} rupees ${t["amount"].abs()}")
                    .join(", ");
          } else {
            // Fallback to API call if orchestrator data is not available
            final txns = await bank.searchTransactions();
            response = "Last ${txns.length} transactions. " +
                txns
                    .map((t) => "${t["merchant"]} rupees ${t["amount"].abs()}")
                    .join(", ");
          }
          break;
        default:
          response = "Sorry, I didn't understand that.";
      }
      await tts.speak(response, langCode: lang);
      emit(Executing(response, voiceIntent));
      add(Reset());
    });
  }
}
