import 'package:dio/dio.dart';
import '../models/transaction.dart';

class BankingAPI {
  //final Dio dio = Dio(BaseOptions(baseUrl: "http://192.168.1.6:8000/bank/me"));
  final Dio dio =
      Dio(BaseOptions(baseUrl: "https://loglytics.joshsoftware.com/bank/me"));

  Future<double> getBalance() async {
    final res = await dio.get("/balance");
    return (res.data["balance"] as num).toDouble();
  }

  Future<String> pay(String to, double amount) async {
    final res = await dio.post("/pay", queryParameters: {
      "to": to,
      "amount": amount,
    });
    if (res.data["status"] == "success") {
      return "Paid ₹$amount to $to. Remaining balance ₹${res.data["balance"]}";
    } else {
      return "Payment failed: ${res.data["reason"]}";
    }
  }

  Future<List<Map<String, dynamic>>> searchTransactions(
      {String? merchant}) async {
    final res =
        await dio.get("/transactions", queryParameters: {"merchant": merchant});
    return List<Map<String, dynamic>>.from(res.data["transactions"]);
  }

  Future<Map<String, dynamic>> login(String phoneNumber) async {
    try {
      final res = await dio.get("/balance", queryParameters: {
        "customer_id": "985", // Using the customer_id from the API example
        "phone": phoneNumber,
      });
      return {"success": true, "data": res.data, "message": "Login successful"};
    } catch (e) {
      return {
        "success": false,
        "error": e.toString(),
        "message": "Login failed"
      };
    }
  }

  Future<List<Transaction>> getTransactions({
    String? phone,
    String? recipient,
    String? category,
    int? limit,
    String? startDate,
    String? endDate,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        "customer_id": "985",
        "phone": phone ?? "string",
        "recipient": recipient ?? "string",
        "category": category ?? "string",
        "limit": limit ?? 9378,
        "start_date": startDate ?? "string",
        "end_date": endDate ?? "string",
      };

      print("Making API call to /transactions with params: $queryParams");
      final res = await dio.get("/transactions", queryParameters: queryParams);
      print("API Response status: ${res.statusCode}");
      print("API Response data: ${res.data}");

      final List<dynamic> transactionsJson = res.data["transactions"];
      print("Found ${transactionsJson.length} transactions in response");

      return transactionsJson
          .map((json) => Transaction.fromJson(json))
          .toList();
    } catch (e) {
      print("Error in getTransactions: $e");
      throw Exception("Failed to fetch transactions: ${e.toString()}");
    }
  }
}
