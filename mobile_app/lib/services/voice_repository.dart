import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:android_id/android_id.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'shared_preferences_service.dart';

Future<String?> getAndroidDeviceId() async {
  const androidIdPlugin = AndroidId();
  final String? androidId = await androidIdPlugin.getId();
  return androidId;
}

/// Thrown when the recorded audio is empty/silent (no speech detected).
class EmptyRecordingException implements Exception {
  EmptyRecordingException();
}

/// Thrown when voice validation fails. [consecutiveFailures] is how many times in a row we got is_voice_valid = false.
class VoiceValidationFailedException implements Exception {
  final int consecutiveFailures;
  VoiceValidationFailedException(this.consecutiveFailures);
}

/// Thrown when user is locked out due to failed voice validation (all retries exhausted).
class VoiceLockoutException implements Exception {
  final DateTime lockoutUntil;
  VoiceLockoutException(this.lockoutUntil);
}

class VoiceRepository {
  final _rec = AudioRecorder();

  /// Whether sustained speech (not just background noise) was detected.
  bool _hasSpoken = false;
  StreamSubscription<Amplitude>? _amplitudeSubscription;
  /// Number of consecutive amplitude samples above threshold (filters brief noise spikes).
  int _consecutiveAboveThreshold = 0;
  /// dB threshold: only amplitude above this is considered speech. Higher = ignore more background noise.
  static const double _speechThreshold = -20;
  /// Require this many consecutive samples above threshold to count as speech (avoids clicks/fan spikes).
  static const int _minConsecutiveForSpeech = 2;
  /// Last time amplitude was above threshold (speech detected).
  DateTime? _lastSpeechTime;
  /// Callback invoked when user is idle (silent) for [idleDuration] after having spoken.
  void Function()? _onIdle;
  Duration _idleDuration = const Duration(seconds: 2);
  bool _idleTriggered = false;

  /// Callback invoked when user says nothing for [initialSilenceDuration] after starting (e.g. 12s).
  void Function()? _onInitialSilence;
  Duration _initialSilenceDuration = const Duration(seconds: 12);
  Timer? _initialSilenceTimer;

  /// Callback invoked when user says nothing for [silenceReminderDuration] after starting (e.g. 5s) — remind to speak.
  void Function()? _onSilenceReminder;
  Duration _silenceReminderDuration = const Duration(seconds: 5);
  Timer? _silenceReminderTimer;

  //final Dio dio = Dio(BaseOptions(baseUrl: "http://192.168.1.6:8000"));
  late final Dio dio;

  VoiceRepository() {
    // Initialize Dio with proper configuration
    dio = Dio(BaseOptions(
      baseUrl: "https://thelingo.co.in/voice-api",
      // baseUrl: "http://192.168.1.237:8000",
      connectTimeout: const Duration(seconds: 300),
      receiveTimeout: const Duration(seconds: 300),
      sendTimeout: const Duration(seconds: 300),
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
      baseUrl: "https://thelingo.co.in/voice-api",
      // baseUrl: "http://192.168.1.237:8000",
      connectTimeout: const Duration(seconds: 300),
      receiveTimeout: const Duration(seconds: 300),
      sendTimeout: const Duration(seconds: 300),
      headers: {
        'Content-Type': 'multipart/form-data',
      },
      persistentConnection: true,
      maxRedirects: 3,
    ));
  }

  /// Base URL for the voiceprint enroll API (POST /enroll/{user_id}).
  /// Change this when the final base URL is known.
  static const String voiceprintEnrollBaseUrl = 'https://zaban.joshsoftware.com/api/v1';

  Dio _createEnrollDio() {
    return Dio(BaseOptions(
      baseUrl: voiceprintEnrollBaseUrl,
      connectTimeout: const Duration(seconds: 300),
      receiveTimeout: const Duration(seconds: 300),
      sendTimeout: const Duration(seconds: 300),
      headers: {
        'Content-Type': 'multipart/form-data',
        'X-API-Key': dotenv.env['VOICEPRINT_API_KEY'] ?? '',
      },
      persistentConnection: true,
      maxRedirects: 3,
    ));
  }

  /// Verifies the user's voice against their enrolled voiceprint.
  ///
  /// Backend response: { is_voice_valid } only.
  /// Frontend tracks consecutive failures. On any fail → [VoiceValidationFailedException]
  /// (no block/lockout; UI shows "go to a silent room & try again or try later").
  Future<Map<String, dynamic>> verifyVoice(File audioFile, {CancelToken? cancelToken}) async {
    final deviceId = await _getDeviceId();
    
    final form = FormData.fromMap({
      'file': await MultipartFile.fromFile(audioFile.path, filename: 'recording.wav'),
    });
    form.fields.add(MapEntry('customer_id', deviceId.toString()));

    final verifyDio = _createEnrollDio();
    verifyDio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (obj) => log('Dio: $obj'),
    ));

    try {
      log('Voice Verify - POST /voiceprint/verify');
      log('Customer ID - $deviceId');
      final res = await verifyDio.post(
        '/voiceprint/verify',
        data: form,
        cancelToken: cancelToken,
      );
      verifyDio.close();

      final data = res.data is Map<String, dynamic> ? res.data as Map<String, dynamic> : <String, dynamic>{};
      final isVoiceValid = data['verified'] == true;

      if (isVoiceValid) {
        await SharedPreferencesService.resetConsecutiveVoiceValidationFailures();
        return data;
      }

      final count = SharedPreferencesService.getConsecutiveVoiceValidationFailures() + 1;
      await SharedPreferencesService.setConsecutiveVoiceValidationFailures(count);

      // Never block; always allow retry. UI will show "go to a silent room & try again or try later".
      throw VoiceValidationFailedException(count);
    } on DioException catch (e) {
      verifyDio.close();
      // Re-throw cancellation so the caller (stopAndTranscribe) propagates it up to VoiceBloc.
      if (CancelToken.isCancel(e)) rethrow;
      log('Voice Verify - DioException: ${e.type} - ${e.message}');
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw Exception("Network timeout. Please check your connection and try again.");
      } else if (e.type == DioExceptionType.connectionError) {
        throw Exception("Connection error. Please check your internet connection.");
      } else if (e.response != null) {
        final msg = e.response?.data?['message'] ?? e.response?.data?['error'] ?? e.message ?? "Voice verification failed";
        throw Exception(msg);
      }
      throw Exception("Network error: ${e.message}");
    }
  }

  /// Gets the native device ID (Android ID or iOS identifierForVendor).
  /// Falls back to a combination of device identifiers if native ID is unavailable.
  Future<String> _getDeviceId() async {
    try {
      final deviceInfo = DeviceInfoPlugin();

      if (Platform.isAndroid) {
        final String? androidId = await getAndroidDeviceId();
        if (androidId != null && androidId.isNotEmpty) {
          return androidId;
        }
        // Fallback to a combination of device identifiers
        final androidInfo = await deviceInfo.androidInfo;
        final deviceIdentifier = '${androidInfo.manufacturer}_${androidInfo.model}_${androidInfo.device}';
        if (deviceIdentifier.isNotEmpty) {
          return deviceIdentifier.replaceAll(' ', '_');
        }
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        // Use identifierForVendor if available (unique per vendor per device)
        final identifier = iosInfo.identifierForVendor;
        if (identifier != null && identifier.isNotEmpty) {
          return identifier;
        }
      }
    } catch (e) {
      log('Error getting native device ID: $e');
    }
    
    // Fallback to stored UUID-based device ID
    return "";
  }

  Future<String> getFilePath() async {
    final dir = await getApplicationDocumentsDirectory();
    return '${dir.path}/recording.wav';
  }

  Future<void> start({
    void Function()? onIdle,
    Duration idleDuration = const Duration(seconds: 2),
    void Function()? onInitialSilence,
    Duration initialSilenceDuration = const Duration(seconds: 12),
    void Function()? onSilenceReminder,
    Duration silenceReminderDuration = const Duration(seconds: 5),
  }) async {
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

      // Listen to amplitude during recording; ignore background noise via higher threshold + sustained level
      _hasSpoken = false;
      _consecutiveAboveThreshold = 0;
      _lastSpeechTime = null;
      _onIdle = onIdle;
      _idleDuration = idleDuration;
      _idleTriggered = false;
     

      _onSilenceReminder = onSilenceReminder;
      _silenceReminderDuration = silenceReminderDuration;
      _silenceReminderTimer?.cancel();
      _silenceReminderTimer = Timer(_silenceReminderDuration, () {
        if (!_hasSpoken) {
          _silenceReminderTimer?.cancel();
          _silenceReminderTimer = null;
          _onSilenceReminder?.call();
        }
      });
      
      _onInitialSilence = onInitialSilence;
      _initialSilenceDuration = initialSilenceDuration;
      _initialSilenceTimer?.cancel();
      _initialSilenceTimer = null;
      _initialSilenceTimer = Timer(_initialSilenceDuration, () {
        if (!_hasSpoken) {
          _initialSilenceTimer?.cancel();
          _initialSilenceTimer = null;
          _silenceReminderTimer?.cancel();
          _silenceReminderTimer = null;
          _amplitudeSubscription?.cancel();
          _amplitudeSubscription = null;
          _onInitialSilence?.call();
        }
      });
      
      _amplitudeSubscription?.cancel();
      _amplitudeSubscription = _rec
          .onAmplitudeChanged(const Duration(milliseconds: 500))
          .listen((amp) {
        if (amp.current > _speechThreshold) {
          _consecutiveAboveThreshold++;
          if (_consecutiveAboveThreshold >= _minConsecutiveForSpeech) {
            _hasSpoken = true;
            _lastSpeechTime = DateTime.now();
            _initialSilenceTimer?.cancel();
            _initialSilenceTimer = null;
            _silenceReminderTimer?.cancel();
            _silenceReminderTimer = null;
          }
        } else {
          _consecutiveAboveThreshold = 0;
          // Check idle: user spoke before, now silent for idleDuration
          if (_hasSpoken &&
              !_idleTriggered &&
              _lastSpeechTime != null &&
              DateTime.now().difference(_lastSpeechTime!) >= _idleDuration) {
            _idleTriggered = true;
            _onIdle?.call();
            _amplitudeSubscription?.cancel();
            _amplitudeSubscription = null;
          }
        }
      });
    } catch (e) {
      print("Voice Repository - Error starting recording: $e");
      rethrow;
    }
  }

  /// Stops recording without sending to server. Use when initial silence timeout fires.
  Future<void> stopWithoutTranscribe() async {
    _initialSilenceTimer?.cancel();
    _initialSilenceTimer = null;
    _silenceReminderTimer?.cancel();
    _silenceReminderTimer = null;
    await _amplitudeSubscription?.cancel();
    _amplitudeSubscription = null;
    await _rec.stop();
  }

  Future<Map<String, dynamic>> stopAndTranscribe(
      {locale = 'en',
      required String sessionId,
      CancelToken? cancelToken,
      Function()? ifNotEmptyCallback}) async {
    try {
      _initialSilenceTimer?.cancel();
      _initialSilenceTimer = null;
      _silenceReminderTimer?.cancel();
      _silenceReminderTimer = null;
      final path = await _rec.stop();

      // Cancel amplitude listener
      await _amplitudeSubscription?.cancel();
      _amplitudeSubscription = null;

      if (path == null) {
        throw Exception("No recording file found");
      }

      final file = File(path);

      // First check: reject if file is missing or has zero size
      if (!await file.exists()) {
        throw EmptyRecordingException();
      }
      final fileSize = await file.length();
      if (fileSize == 0) {
        throw EmptyRecordingException();
      }

      // Reject if no speech was detected during recording (amplitude never above threshold)
      if (!_hasSpoken) {
        throw EmptyRecordingException();
      }

      ifNotEmptyCallback?.call();

      // Verify voice only if user has registered voice; otherwise go straight to transcribe
      if (SharedPreferencesService.isVoiceRegistered()) {
        await verifyVoice(file, cancelToken: cancelToken);
      }

      // Get phone number from shared preferences
      final phone = SharedPreferencesService.getMobileNumber();
      if (phone == null) {
        throw Exception("Phone number not found in shared preferences");
      }

      final form = FormData.fromMap({
        'audio':
            await MultipartFile.fromFile(file.path, filename: 'recording.wav'),
        'session_id': sessionId,
        'locale': locale,
        'phone': phone,
      });

      // Use a fresh HTTP client for each request to avoid connection issues
      final freshDio = _createFreshDio();
      freshDio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => log('Dio: $obj'),
      ));
      log('Form data: ${form.fields.toString()}');
      log('Form data: ${form.files.toString()}');
      final res = await freshDio.post(
        '/voice/transcribe-intent',
        data: form,
        cancelToken: cancelToken,
      );
      freshDio.close();

      res.data['lang'] = locale ?? 'en';
      return res.data;
    } on DioException catch (e) {
      // Re-throw cancellation so the caller (VoiceBloc) can detect it.
      if (CancelToken.isCancel(e)) rethrow;
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
      required String locale,
      CancelToken? cancelToken}) async {
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
      final res = await freshDio.post(
        '/voice/transcribe-intent',
        data: form,
        cancelToken: cancelToken,
      );
      freshDio.close();
      res.data['lang'] = locale;

      return res.data;
    } on DioException catch (e) {
      if (CancelToken.isCancel(e)) rethrow;
      print("Voice Repository Error - OTP verification API call failed: $e");
      rethrow;
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
      double? originalAmount,
      CancelToken? cancelToken}) async {
    try {
      // Get phone number from shared preferences
      final phone = SharedPreferencesService.getMobileNumber();
      if (phone == null) {
        throw Exception("Phone number not found in shared preferences");
      }

      final formData = <String, dynamic>{
        'session_id': sessionId.toString(),
        'phone': phone,
        if (beneficiaryName != null) 'beneficiary_name': beneficiaryName,
      };

      final form = FormData.fromMap(formData);

      // Use a fresh HTTP client for each request to avoid connection issues
      final freshDio = _createFreshDio();
      final res = await freshDio.post(
        '/voice/transcribe-intent',
        data: form,
        cancelToken: cancelToken,
      );
      freshDio.close();
      res.data['lang'] = locale;

      return res.data;
    } on DioException catch (e) {
      // Re-throw cancellation so the caller (VoiceBloc / UI) can detect it.
      if (CancelToken.isCancel(e)) rethrow;
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

  /// Register voice with 3 audio files for voiceprint enrollment.
  ///
  /// Calls POST /enroll/{user_id} where user_id is either:
  /// - Reused from local storage if previously created, or
  /// - Created as deviceId + random(1..100) if not found.
  /// Sends multipart body: files (3 audio files), optional device_id.
  ///
  /// [audio1], [audio2], [audio3] - Audio files (e.g. WAV).
  /// Throws Exception on failure (network errors, validation errors, etc.)
  Future<void> registerVoice({
    required File audio1,
    required File audio2,
    required File audio3,
  }) async {
    try {
      if (!await audio1.exists() || !await audio2.exists() || !await audio3.exists()) {
        throw Exception("One or more audio files are missing");
      }

      // Check for stored user_id first
      // String? userId = SharedPreferencesService.getVoiceprintUserId();
      final deviceId = await _getDeviceId();
      // String? customerId = await SharedPreferencesService.getCustomerId();

      // if(customerId == null || customerId.isEmpty) {
      //   throw Exception("Customer ID not found in shared preferences");
      // }

      // customerId += deviceId;
      
      // If not found, create new user_id: deviceId + random(1..100)
      // if (userId == null || userId.isEmpty) {
      //   final randomSuffix = Random().nextInt(100) + 1; // 1..100
      //   // userId = '$deviceId$randomSuffix';
      //   // Store for future reuse
      //   await SharedPreferencesService.saveVoiceprintUserId(userId);
      //   log('Voice Enrollment - Created new user_id: $userId');
      // } else {
      //   log('Voice Enrollment - Reusing stored user_id: $userId');
      // }


      final form = FormData();
      form.files.addAll([
        MapEntry('files', await MultipartFile.fromFile(audio1.path, filename: 'sample1.wav')),
        MapEntry('files', await MultipartFile.fromFile(audio2.path, filename: 'sample2.wav')),
        MapEntry('files', await MultipartFile.fromFile(audio3.path, filename: 'sample3.wav')),
      ]);
      form.fields.add(MapEntry('device_id', deviceId.toString()));
      form.fields.add(MapEntry('customer_id', deviceId.toString()));

      final enrollDio = _createEnrollDio();
      enrollDio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => log('Dio: $obj'),
      ));

      log('Voice Enrollment - POST /voiceprint/enroll');
      log('Voice Enrollment - device_id: $deviceId');
      log('Voice Enrollment - customer_id: $deviceId');
      log('Voice Enrollment - Audio files: ${audio1.path}, ${audio2.path}, ${audio3.path}');

      final res = await enrollDio.post('/voiceprint/enroll', data: form);
      enrollDio.close();

      if (res.statusCode != 200 && res.statusCode != 201) {
        throw Exception("Voice enrollment failed: ${res.statusMessage}");
      }

      await SharedPreferencesService.setVoiceRegistered(true);
      log('Voice Enrollment - Success: ${res.data}');
    } on DioException catch (e) {
      print("Voice Repository Error - Voice Enrollment DioException: ${e.type} - ${e.message}");
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw Exception(
            "Network timeout. Please check your connection and try again.");
      } else if (e.type == DioExceptionType.connectionError) {
        throw Exception(
            "Connection error. Please check your internet connection.");
      } else if (e.response != null) {
        final errorMessage = e.response?.data?['message'] ??
            e.response?.data?['error'] ??
            e.message ??
            "Voice enrollment failed";
        throw Exception(errorMessage);
      } else {
        throw Exception("Network error: ${e.message}");
      }
    } catch (e) {
      print("Voice Repository Error - Voice enrollment failed: $e");
      rethrow;
    }
  }

  /// Deletes the user's voiceprint from the server.
  /// DELETE /voiceprint/ with body: { customer_id }
  /// Caller should call SharedPreferencesService.setVoiceRegistered(false) on 200.
  Future<void> deleteVoiceprint(String customerId) async {
    // if (customerId.isEmpty) {
    //   throw Exception("Customer ID is required");
    // }
    final deleteDio = _createEnrollDio();
    deleteDio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (obj) => log('Dio: $obj'),
    ));
    try {
      final deviceId = await _getDeviceId();
      log('Voice Delete - DELETE /voiceprint/ customer_id: $deviceId');
      final res = await deleteDio.delete(
        '/voiceprint/',
        queryParameters: {'customer_id': deviceId},
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      deleteDio.close();
      if (res.statusCode != 200) {
        throw Exception(
            res.data?['message'] ?? 'Failed to delete voiceprint');
      }
    } on DioException catch (e) {
      deleteDio.close();
      if (e.response != null) {
        final msg = e.response?.data?['message'] ??
            e.response?.data?['error'] ??
            e.message ??
            'Failed to delete voiceprint';
        throw Exception(msg);
      }
      throw Exception(e.message ?? 'Failed to delete voiceprint');
    }
  }
}
