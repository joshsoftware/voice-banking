enum BankingAction {
  moneyTransfer,
  accountBalanceCheck,
  loanEmiCheck,
  unsupported
}

const Map<String, BankingAction> supportedBankingActions = {
  "money_transfer": BankingAction.moneyTransfer,
  "account_balance_check": BankingAction.accountBalanceCheck,
  "loan_emi_check": BankingAction.loanEmiCheck
};

BankingAction getBankingActionFromString(final String action) {
  return supportedBankingActions[action.toLowerCase()] ??
      BankingAction.unsupported;
}

class BankingActionable {
  final BankingAction action;
  final int? amount;
  final String? recipient;

  BankingActionable({
    required this.action,
    required this.amount,
    required this.recipient,
  });

  factory BankingActionable.fromMap(final Map<String, dynamic> data) {
    return BankingActionable(
      action: getBankingActionFromString(data["action"]),
      amount: data["data"]?["amount"],
      recipient: data["data"]?["recipient"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "action": action.toString(),
      "amount": amount,
      "recipient": recipient
    };
  }
}
