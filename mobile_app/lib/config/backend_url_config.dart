import '../services/shared_preferences_service.dart';

/// Global backend URL used across the app. Initialized from local storage on launch;
/// if null or empty, it is loaded from SharedPreferences and stored here.
class BackendUrlConfig {
  static String? _backendUrl;

  /// Backend base URL in memory. If null or empty, loads from local storage first.
  static String? getBackendUrl() {
    if (_backendUrl != null && _backendUrl!.trim().isNotEmpty) {
      return _backendUrl;
    }
    _backendUrl = SharedPreferencesService.getBackendUrl();
    return _backendUrl;
  }

  /// Set backend URL: saves to local storage and updates the global variable.
  static Future<void> setBackendUrl(String url) async {
    final trimmed = url.trim();
    await SharedPreferencesService.setBackendUrl(trimmed);
    _backendUrl = trimmed;
  }

  /// Call on app launch to load URL from local storage into the global variable.
  static Future<void> init() async {
    _backendUrl = SharedPreferencesService.getBackendUrl();
  }
}
