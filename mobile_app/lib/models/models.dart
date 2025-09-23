class Intent {
  final String name;
  final Map<String, dynamic> entities;
  final String action;
  Intent({required this.name, required this.entities, required this.action});

  String summary() {
    switch (name) {
      case "check_balance":
        return "Check balance";
      case "transfer_money":
        return "Pay ${entities["amount"] ?? ""}";
      case "txn_insights":
        return "Search transactions";
      case "recent_txn":
        return "Show recent transactions";
      default:
        return "Unknown";
    }
  }
}
