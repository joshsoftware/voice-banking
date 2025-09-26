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
    try {
      // Handle null transaction_type - determine type based on amount
      String transactionType;
      final transactionTypeRaw = json['transaction_type'];
      if (transactionTypeRaw != null) {
        transactionType = transactionTypeRaw as String;
      } else {
        // If transaction_type is null, determine from amount
        final amount = (json['amount'] as num).toDouble();
        transactionType = amount >= 0 ? 'credit' : 'debit';
      }

      final transaction = Transaction(
        id: json['id'] as int,
        merchant: json['recipient'] as String, // API uses 'recipient' field
        amount: (json['amount'] as num).toDouble(),
        date: json['transaction_date']
            as String, // API uses 'transaction_date' field
        type: transactionType,
        category: json['category'] as String, // API provides category directly
      );
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
