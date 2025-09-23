import "models.dart";
String checkBalance = "check_balance";
String recentTransactions = "recent_txn";
String transferMoney = "transfer_money";
String transactionInsights = "txn_insights";
String unknown = "";
enum VoiceIntentType { checkBalance, recentTransactions, transferMoney, transactionInsights, unknown }


class VoiceIntent {
  final VoiceIntentType type;
  final Map<String, dynamic>? entities;


  VoiceIntent(this.type, {this.entities});

    static VoiceIntent fromIntent(Intent intent) {
        
        switch (intent.name) {
        case VoiceIntentType.checkBalance:
            return VoiceIntent(VoiceIntentType.checkBalance, entities: intent.entities);
        case VoiceIntentType.recentTransactions:
            return VoiceIntent(VoiceIntentType.recentTransactions, entities: intent.entities);
        case VoiceIntentType.transferMoney:
            return VoiceIntent(VoiceIntentType.transferMoney, entities: intent.entities);
        default:
            return VoiceIntent(VoiceIntentType.unknown, entities: intent.entities);
        }
    }
}
