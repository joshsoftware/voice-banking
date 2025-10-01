import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _mobileNumberKey = 'mobile_number';
  static const String _customerIdKey = 'customer_id';
  static const String _customerNameKey = 'customer_name';
  static const String _balanceKey = 'balance';
  static const String _isLoggedInKey = 'is_logged_in';
  static const String _recentTransactionsKey = 'recent_transactions';
  static const String _sessionIdKey = 'session_id';

  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveMobileNumber(String mobileNumber) async {
    await _prefs?.setString(_mobileNumberKey, mobileNumber);
  }

  static String? getMobileNumber() {
    return _prefs?.getString(_mobileNumberKey);
  }

  static Future<void> saveCustomerId(String customerId) async {
    await _prefs?.setString(_customerIdKey, customerId);
  }

  static String? getCustomerId() {
    return _prefs?.getString(_customerIdKey);
  }

  static Future<void> saveCustomerName(String customerName) async {
    await _prefs?.setString(_customerNameKey, customerName);
  }

  static String? getCustomerName() {
    return _prefs?.getString(_customerNameKey);
  }

  static Future<void> saveBalance(String balance) async {
    await _prefs?.setString(_balanceKey, balance);
  }

  static String? getBalance() {
    return _prefs?.getString(_balanceKey);
  }

  static Future<void> setLoggedIn(bool isLoggedIn) async {
    await _prefs?.setBool(_isLoggedInKey, isLoggedIn);
  }

  static bool isLoggedIn() {
    return _prefs?.getBool(_isLoggedInKey) ?? false;
  }

  static Future<void> saveRecentTransactions(
      List<Map<String, dynamic>> transactions) async {
    final jsonString = jsonEncode(transactions);
    await _prefs?.setString(_recentTransactionsKey, jsonString);
  }

  static List<Map<String, dynamic>> getRecentTransactions() {
    final jsonString = _prefs?.getString(_recentTransactionsKey);
    if (jsonString != null) {
      try {
        final List<dynamic> jsonList = jsonDecode(jsonString);
        return jsonList.cast<Map<String, dynamic>>();
      } catch (e) {
        print("Error parsing recent transactions: $e");
        return [];
      }
    }
    return [];
  }

  static Future<void> saveSessionId(String sessionId) async {
    await _prefs?.setString(_sessionIdKey, sessionId);
  }

  static String? getSessionId() {
    return _prefs?.getString(_sessionIdKey);
  }

  static Future<void> clearAll() async {
    await _prefs?.clear();
  }
}
