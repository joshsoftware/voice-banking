import 'package:flutter_bloc/flutter_bloc.dart';
import 'models.dart';
import 'voice_repository.dart';
import 'banking_api.dart';
import 'tts_service.dart';
import 'voice_intent.dart';


sealed class VoiceState {}
class Idle extends VoiceState {}
class Listening extends VoiceState {}
class Transcribing extends VoiceState {}
class Understood extends VoiceState { final Intent intent; Understood(this.intent); }
class Executing extends VoiceState { final String message; final VoiceIntent intent; Executing(this.message,this.intent); }

sealed class VoiceEvent {}
class StartListening extends VoiceEvent {}
class StopListening extends VoiceEvent { final String locale; StopListening({required this.locale}); }
class GotTranscript extends VoiceEvent { final Map<String, dynamic> data; GotTranscript(this.data); }
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
      add(GotTranscript(data));
    });

    on<Reset>((e, emit) {
      emit(Idle());
    });

    on<GotTranscript>((e, emit) async {
      //e.data["intent_data"] = {"intent":"spend_insights","entities":{'amount': 'None', 'currency': 'None', 'recipient': 'None', 'timeframe': 'this_month', 'date': 'None', 'category': 'None', 'merchant': 'amazon', 'count': 'None'}};
      //e.data["intent_data"] = {"intent":"transfer_money","entities":{"recipient":"Ananya","amount":1000,"currency":"INR"},"language":"en"};
    final intent = Intent(
        name: e.data["intent_data"]["intent"],
        entities: e.data["intent_data"]["entities"],
    );
    print(intent.name);
    print( intent.entities);
    final voiceIntent = VoiceIntent.fromIntent(intent);
    //emit(Understood(voiceIntent as Intent));

    final lang = e.data["lang"] ?? 'en';
    emit(Understood(intent));
      String response;
      switch (intent.name) {
        case "get_balance":
          final bal = await bank.getBalance();
          //response = bal.toStringAsFixed(2);
          response = "Your balance is rupees ${bal.toStringAsFixed(2)}";
          break;
        case "transfer_money":
          final amt = (intent.entities["amount"] ?? 0).toDouble();
          final payee = intent.entities["recipient"];
          response = await bank.pay(payee, amt);
          break;
        case "spend_insights":
          final merchant = intent.entities["merchant"] ?? intent.entities["category"];
          final txns = await bank.searchTransactions(merchant: merchant);
          response = txns.isEmpty
              ? "No transactions found."
              : "Found ${txns.length} transactions for ${merchant}.";
          break;
        case "recent_txn":
          final txns = await bank.searchTransactions();
          response = "Last ${txns.length} transactions. " +
              txns.map((t) => "${t["merchant"]} rupees ${t["amount"].abs()}").join(", ");
          break;
        default:
          response = "Sorry, I didn't catch that.";
      }
      print(lang);
      await tts.speak(response, langCode: lang);   // 🔊 speak out response
      emit(Executing(response,voiceIntent));
      add(Reset());
    });
  }
}
