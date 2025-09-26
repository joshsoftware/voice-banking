class Transaction {
  final int id;
  final String merchant;
  final double amount;
  final String date;
  final String type; // 'credit' or 'debit'
  final String category; // Add category field

  Transaction({
    required this.id,
    required this.merchant,
    required this.amount,
    required this.date,
    required this.type,
    required this.category,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    print("Transaction.fromJson - Parsing transaction: $json");
    try {
      final transaction = Transaction(
        id: json['id'] as int,
        merchant: json['recipient'] as String, // API uses 'recipient' field
        amount: (json['amount'] as num).toDouble(),
        date: json['transaction_date']
            as String, // API uses 'transaction_date' field
        type: json['transaction_type']
            as String, // API uses 'transaction_type' field
        category: json['category'] as String, // API provides category directly
      );
      print(
          "Transaction.fromJson - Successfully parsed: ${transaction.merchant} - ${transaction.amount}");
      return transaction;
    } catch (e) {
      print("Transaction.fromJson - Error parsing transaction: $e");
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'merchant': merchant,
      'amount': amount,
      'date': date,
      'type': type,
      'category': category,
    };
  }

  String get formattedAmount {
    final isPositive = amount >= 0;
    final prefix = isPositive ? '+' : '';
    return '$prefix₹${amount.abs().toStringAsFixed(amount.abs() % 1 == 0 ? 0 : 2)}';
  }
}
