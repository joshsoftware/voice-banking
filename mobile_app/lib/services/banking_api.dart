import 'package:dio/dio.dart';
import '../models/transaction.dart';
import 'shared_preferences_service.dart';

class BankingAPI {
  //final Dio dio = Dio(BaseOptions(baseUrl: "http://192.168.1.6:8000/bank/me"));
  final Dio dio =
      Dio(BaseOptions(baseUrl: "https://loglytics.joshsoftware.com/bank/me"));

  Future<double> getBalance() async {
    final phone = SharedPreferencesService.getMobileNumber();
    if (phone == null) {
      throw Exception("Phone number not found in shared preferences");
    }

    final res = await dio.get("/balance", queryParameters: {
      "phone": phone,
    });
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
      // Use simplified endpoint for all cases when phone is provided
      if (phone != null) {
        final queryParams = <String, dynamic>{
          "phone": phone,
          "limit": limit ?? 50,
        };

        // Only add date parameters if they are not null
        if (startDate != null) {
          queryParams["start_date"] = startDate;
        }
        if (endDate != null) {
          queryParams["end_date"] = endDate;
        }

        print(
            "Making API call to /transactions with simplified params: $queryParams");
        final res =
            await dio.get("/transactions", queryParameters: queryParams);
        print("API Response status: ${res.statusCode}");
        print("API Response data: ${res.data}");

        final List<dynamic> transactionsJson = res.data["transactions"];
        print("Found ${transactionsJson.length} transactions in response");

        return transactionsJson
            .map((json) => Transaction.fromJson(json))
            .toList();
      } else {
        // Fallback for cases where phone is not provided (shouldn't happen in normal flow)
        final queryParams = <String, dynamic>{
          "customer_id": "985",
          "phone": "string",
          "recipient": recipient ?? "string",
          "category": category ?? "string",
          "limit": limit ?? 9378,
        };

        // Only add date parameters if they are not null
        if (startDate != null) {
          queryParams["start_date"] = startDate;
        }
        if (endDate != null) {
          queryParams["end_date"] = endDate;
        }

        print(
            "Making API call to /transactions with full params: $queryParams");
        final res =
            await dio.get("/transactions", queryParameters: queryParams);
        print("API Response status: ${res.statusCode}");
        print("API Response data: ${res.data}");

        final List<dynamic> transactionsJson = res.data["transactions"];
        print("Found ${transactionsJson.length} transactions in response");

        return transactionsJson
            .map((json) => Transaction.fromJson(json))
            .toList();
      }
    } catch (e) {
      print("Error in getTransactions: $e");
      throw Exception("Failed to fetch transactions: ${e.toString()}");
    }
  }
}
