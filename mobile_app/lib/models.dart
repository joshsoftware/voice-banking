class Intent {
  final String name;
  final Map<String, dynamic> entities;
  Intent({required this.name, required this.entities});

  String summary() {
    switch (name) {
      case "get_balance":
        return "Check balance";
      case "pay_person":
        return "Pay ${entities["amount"] ?? ""}";
      case "search_txn":
        return "Search transactions";
      case "recent_txn":
        return "Show recent transactions";
      default:
        return "Unknown";
    }
  }
}
