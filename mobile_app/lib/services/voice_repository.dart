import 'dart:io';
import 'package:dio/dio.dart';
import 'package:record/record.dart';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';
import 'shared_preferences_service.dart';

class VoiceRepository {
  final _rec = AudioRecorder();

  //final Dio dio = Dio(BaseOptions(baseUrl: "http://192.168.1.6:8000"));
  late final Dio dio;

  VoiceRepository() {
    // Initialize Dio with proper configuration
    dio = Dio(BaseOptions(
      baseUrl: "https://loglytics.joshsoftware.com",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'multipart/form-data',
      },
      // Add connection pooling settings
      persistentConnection: true,
      maxRedirects: 3,
    ));

    // Add interceptors for better connection management
    dio.interceptors.add(LogInterceptor(
      requestBody: false,
      responseBody: false,
      logPrint: (obj) => print('Dio: $obj'),
    ));
  }

  void dispose() {
    dio.close();
  }

  // Method to reset the HTTP client connection
  void resetConnection() {
    try {
      dio.close();
    } catch (e) {
      print("Error closing Dio client: $e");
    }
  }

  // Method to create a fresh HTTP client
  Dio _createFreshDio() {
    return Dio(BaseOptions(
      baseUrl: "https://loglytics.joshsoftware.com",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'multipart/form-data',
      },
      persistentConnection: true,
      maxRedirects: 3,
    ));
  }

  Future<String> getFilePath() async {
    final dir = await getApplicationDocumentsDirectory();
    return '${dir.path}/recording.wav';
  }

  Future<void> start() async {
    try {
      // Check permission first
      bool hasPermission = await _rec.hasPermission();

      if (!hasPermission) {
        throw Exception(
            "Microphone permission is required. Please enable it in Settings > Privacy & Security > Microphone.");
      }

      // Try to start recording with basic configuration
      final path = await getFilePath();

      // Use basic configuration that should work on iOS
      await _rec.start(
          const RecordConfig(
            encoder: AudioEncoder.wav,
            sampleRate: 16000,
          ),
          path: path);
    } catch (e) {
      print("Voice Repository - Error starting recording: $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> stopAndTranscribe({locale = 'en'}) async {
    try {
      final path = await _rec.stop();

      if (path == null) {
        throw Exception("No recording file found");
      }

      final file = File(path);

      // Get phone number from shared preferences
      final phone = SharedPreferencesService.getMobileNumber();
      if (phone == null) {
        throw Exception("Phone number not found in shared preferences");
      }

      final form = FormData.fromMap({
        'audio':
            await MultipartFile.fromFile(file.path, filename: 'recording.wav'),
        'session_id': const Uuid().v4(),
        'locale': locale,
        'phone': phone,
      });

      // Use a fresh HTTP client for each request to avoid connection issues
      final freshDio = _createFreshDio();
      final res = await freshDio.post('/voice/transcribe-intent', data: form);
      freshDio.close(); // Close the fresh client after use

      res.data['lang'] = locale ?? 'en';
      return res.data;
    } on DioException catch (e) {
      print("Voice Repository Error - DioException: ${e.type} - ${e.message}");
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw Exception(
            "Network timeout. Please check your connection and try again.");
      } else if (e.type == DioExceptionType.connectionError) {
        throw Exception(
            "Connection error. Please check your internet connection.");
      } else {
        throw Exception("Network error: ${e.message}");
      }
    } catch (e) {
      print("Voice Repository Error - API call failed: $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> verifyOtpWithTranscribe(
      {required String otp,
      required String sessionId,
      required String locale}) async {
    try {
      // Get phone number from shared preferences
      final phone = SharedPreferencesService.getMobileNumber();
      if (phone == null) {
        throw Exception("Phone number not found in shared preferences");
      }

      // Call the API with only the required fields: session_id, phone, otp
      final formData = <String, dynamic>{
        'session_id': sessionId.toString(),
        'phone': phone,
        'otp': int.tryParse(otp) ?? otp,
        'locale': locale,
      };

      final form = FormData.fromMap(formData);

      // Use a fresh HTTP client for each request to avoid connection issues
      final freshDio = _createFreshDio();
      final res = await freshDio.post('/voice/transcribe-intent', data: form);
      freshDio.close(); // Close the fresh client after use
      res.data['lang'] = locale;

      return res.data;
    } catch (e) {
      print("Voice Repository Error - OTP verification API call failed: $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> stopAndTranscribeWithSessionId(
      {required String sessionId, required String locale}) async {
    try {
      final path = await _rec.stop();

      if (path == null) {
        throw Exception("No recording file found");
      }

      final file = File(path);

      // Get phone number from shared preferences
      final phone = SharedPreferencesService.getMobileNumber();
      if (phone == null) {
        throw Exception("Phone number not found in shared preferences");
      }

      final form = FormData.fromMap({
        'audio':
            await MultipartFile.fromFile(file.path, filename: 'recording.wav'),
        'session_id': sessionId.toString(),
        'locale': locale,
        'phone': phone,
      });

      // Use a fresh HTTP client for each request to avoid connection issues
      final freshDio = _createFreshDio();
      final res = await freshDio.post('/voice/transcribe-intent', data: form);
      freshDio.close(); // Close the fresh client after use

      res.data['lang'] = locale;
      return res.data;
    } on DioException catch (e) {
      print("Voice Repository Error - DioException: ${e.type} - ${e.message}");
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw Exception(
            "Network timeout. Please check your connection and try again.");
      } else if (e.type == DioExceptionType.connectionError) {
        throw Exception(
            "Connection error. Please check your internet connection.");
      } else {
        throw Exception("Network error: ${e.message}");
      }
    } catch (e) {
      print("Voice Repository Error - Duplicate selection API call failed: $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> selectDuplicateBeneficiary(
      {required String sessionId,
      required String locale,
      String? beneficiaryId,
      String? beneficiaryName,
      double? originalAmount}) async {
    try {
      // Get phone number from shared preferences
      final phone = SharedPreferencesService.getMobileNumber();
      if (phone == null) {
        throw Exception("Phone number not found in shared preferences");
      }

      // No audio file needed - API now only requires beneficiary_name, session_id, and phone

      // Call the API with only the required fields: beneficiary_name, session_id, phone
      final formData = <String, dynamic>{
        'session_id': sessionId.toString(),
        'phone': phone,
        if (beneficiaryName != null) 'beneficiary_name': beneficiaryName,
      };

      final form = FormData.fromMap(formData);

      // Use a fresh HTTP client for each request to avoid connection issues
      final freshDio = _createFreshDio();
      final res = await freshDio.post('/voice/transcribe-intent', data: form);
      freshDio.close(); // Close the fresh client after use
      res.data['lang'] = locale;

      return res.data;
    } on DioException catch (e) {
      print("Voice Repository Error - DioException: ${e.type} - ${e.message}");
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw Exception(
            "Network timeout. Please check your connection and try again.");
      } else if (e.type == DioExceptionType.connectionError) {
        throw Exception(
            "Connection error. Please check your internet connection.");
      } else {
        throw Exception("Network error: ${e.message}");
      }
    } catch (e) {
      print("Voice Repository Error - Duplicate selection API call failed: $e");
      rethrow;
    }
  }
}
