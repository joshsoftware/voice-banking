import 'dart:io';
import 'package:dio/dio.dart';

void main() async {
  final dio =
      Dio(BaseOptions(baseUrl: "https://loglytics.joshsoftware.com/bank/me"));

  try {
    print("Testing API call...");
    final res = await dio.get("/transactions", queryParameters: {"limit": 10});
    print("API Response status: ${res.statusCode}");
    print("API Response data: ${res.data}");

    final List<dynamic> transactionsJson = res.data["transactions"];
    print("Found ${transactionsJson.length} transactions in response");

    for (var transaction in transactionsJson) {
      print(
          "Transaction: ${transaction['merchant']} - ${transaction['amount']} - ${transaction['date']}");
    }
  } catch (e) {
    print("Error: $e");
  }
}
