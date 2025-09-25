import 'dart:io';
import 'package:dio/dio.dart';
import 'package:record/record.dart';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class VoiceRepository {
  final _rec = AudioRecorder();
  
  //final Dio dio = Dio(BaseOptions(baseUrl: "http://192.168.1.6:8000"));
  final Dio dio = Dio(BaseOptions(baseUrl: "https://loglytics.joshsoftware.com"));

  Future<String> getFilePath() async {
    final dir = await getApplicationDocumentsDirectory();
    return '${dir.path}/recording.wav';
  }

  Future<bool> _requestMicrophonePermission() async {
    print('🔍 Checking microphone permission...');
    
    // Check if permission is already granted
    var status = await Permission.microphone.status;
    print('📱 Current microphone permission status: $status');
    
    if (status.isGranted) {
      print('✅ Microphone permission already granted');
      return true;
    }
    
    print('❌ Microphone permission not granted, requesting...');
    // Request permission if not granted
    status = await Permission.microphone.request();
    print('📱 Permission request result: $status');
    
    final isGranted = status.isGranted;
    print('🎤 Microphone permission granted: $isGranted');
    return isGranted;
  }

  Future<void> start() async {
    try {
      print('🚀 Starting voice recording...');
      
      // Request microphone permission first
      final hasPermission = await _requestMicrophonePermission();
      
      if (!hasPermission) {
        print('❌ Microphone permission denied, cannot start recording');
        throw Exception('Microphone permission denied. Please enable microphone access in Settings.');
      }
      
      // Check if recorder has permission
      final recorderHasPermission = await _rec.hasPermission();
      print('🎙️ Audio recorder permission: $recorderHasPermission');
      
      if (!recorderHasPermission) {
        print('❌ Audio recorder permission denied');
        throw Exception('Audio recorder permission denied');
      }
      
      final path = await getFilePath();
      print('📁 Starting recording to: $path');
      
      await _rec.start(
        const RecordConfig(
          encoder: AudioEncoder.wav, 
          sampleRate: 16000,
          bitRate: 128000,
        ), 
        path: path
      );
      
      print('✅ Recording started successfully');
    } catch (e) {
      print('💥 Error starting recording: $e');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> stopAndTranscribe({locale = 'en'}) async {
    try {
      print('⏹️ Stopping recording...');
      final path = await _rec.stop();
      
      if (path == null) {
        print('❌ No recording file found');
        throw Exception('No recording file found');
      }
      
      print('📁 Recording stopped, file path: $path');
      
      final file = File(path);
      if (!await file.exists()) {
        print('❌ Recording file does not exist');
        throw Exception('Recording file does not exist');
      }
      
      final fileSize = await file.length();
      print('📊 File size: $fileSize bytes');
      
      if (fileSize == 0) {
        print('⚠️ Warning: Recording file is empty');
      }
      
      final form = FormData.fromMap({
        'audio': await MultipartFile.fromFile(
          file.path, 
          filename: 'recording.wav',
          contentType: DioMediaType('audio', 'wav'),
        ),
        'session_id': const Uuid().v4(),
        'locale': locale,
      });
      
      print('🌐 Sending transcription request...');
      final res = await dio.post('/voice/transcribe-intent', data: form);
      
      print('📥 Transcription response: ${res.data}');
      
      res.data['lang'] = locale ?? 'en';
      return res.data;
    } catch (e) {
      print('💥 Error in stopAndTranscribe: $e');
      rethrow;
    }
  }
}
