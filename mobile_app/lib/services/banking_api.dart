import 'package:dio/dio.dart';
import '../models/transaction.dart';
import '../config/backend_url_config.dart';
import 'shared_preferences_service.dart';

class BankingAPI {
  Dio get dio {
    final base = BackendUrlConfig.getBackendUrl();
    if (base == null || base.isEmpty) {
      throw StateError('Backend URL is not set');
    }
    final url = base.endsWith('/') ? '${base}bank/me' : '$base/bank/me';
    return Dio(BaseOptions(baseUrl: url));
  }

  Future<double> getBalance() async {
    final phone = SharedPreferencesService.getMobileNumber();
    final customerId = SharedPreferencesService.getCustomerId();

    if (phone == null) {
      throw Exception("Phone number not found in shared preferences");
    }

    if (customerId == null) {
      throw Exception("Customer ID not found in shared preferences");
    }

    final res = await dio.get("/balance", queryParameters: {
      "customer_id": customerId,
      "phone": phone,
    });

    // Also save customer name from balance response if available
    final customerName = res.data["customer_name"]?.toString();
    if (customerName != null && customerName.isNotEmpty) {
      await SharedPreferencesService.saveCustomerName(customerName);
    }

    return (res.data["balance"] as num).toDouble();
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

        final res =
            await dio.get("/transactions", queryParameters: queryParams);

        final List<dynamic> transactionsJson = res.data["transactions"];

        return transactionsJson
            .map((json) => Transaction.fromJson(json))
            .toList();
      } else {
        // Fallback for cases where phone is not provided (shouldn't happen in normal flow)
        final queryParams = <String, dynamic>{
          // "customer_id": "985",
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

        final res =
            await dio.get("/transactions", queryParameters: queryParams);

        final List<dynamic> transactionsJson = res.data["transactions"];

        return transactionsJson
            .map((json) => Transaction.fromJson(json))
            .toList();
      }
    } catch (e) {
      throw Exception("Failed to fetch transactions: ${e.toString()}");
    }
  }
}
