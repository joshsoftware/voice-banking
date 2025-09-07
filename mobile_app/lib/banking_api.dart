import 'package:dio/dio.dart';

class BankingAPI {
  //final Dio dio = Dio(BaseOptions(baseUrl: "http://192.168.1.93:8000/bank/me"));
  final Dio dio = Dio(BaseOptions(baseUrl: "https://loglytics.joshsoftware.com/bank/me"));

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

  Future<List<Map<String, dynamic>>> searchTransactions({String? merchant}) async {
    final res = await dio.get("/transactions", queryParameters: {"merchant": merchant});
    return List<Map<String, dynamic>>.from(res.data["transactions"]);
  }
}
