import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _mobileNumberKey = 'mobile_number';
  static const String _customerIdKey = 'customer_id';
  static const String _isLoggedInKey = 'is_logged_in';

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

  static Future<void> setLoggedIn(bool isLoggedIn) async {
    await _prefs?.setBool(_isLoggedInKey, isLoggedIn);
  }

  static bool isLoggedIn() {
    return _prefs?.getBool(_isLoggedInKey) ?? false;
  }

  static Future<void> clearAll() async {
    await _prefs?.clear();
  }
}
