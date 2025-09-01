import 'dart:io';
import 'package:dio/dio.dart';
import 'package:record/record.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'dart:io' if (dart.library.html) 'dart:html' as platform;
import 'audio_helper.dart';  
//import 'audio_helper_web.dart'; 
import 'audio_helper_mobile.dart';
import 'package:path_provider/path_provider.dart';



class VoiceRepository {
  final _rec = AudioRecorder();
  final AudioHelper _helper = AudioHelperMobile();
  //final AudioHelper _helper = kIsWeb ? AudioHelperWeb() : AudioHelperMobile();

  final _dio = Dio(BaseOptions(baseUrl: "http://127.0.0.1:8000")); // Android emulator -> localhost

  Future<Uint8List?> pickAudio() async {
    return _helper.pickAudioBytes();
  }




  Future<String> getFilePath() async {
    final dir = await getApplicationDocumentsDirectory();
    return '${dir.path}/recording.wav';
  }


  Future<void> start() async {
    if (await _rec.hasPermission()) {
      final path = await getFilePath();
      await _rec.start(const RecordConfig(encoder: AudioEncoder.wav, sampleRate: 16000), path: path);
    }
  }

  Future<Map<String, dynamic>> stopAndTranscribe() async {
    final path = await _rec.stop();
    final file = File(path!);
    final form = FormData.fromMap({
      'audio': await MultipartFile.fromFile(file.path, filename: 'audio.wav'),
      'session_id': const Uuid().v4(),
    });
    final res = await _dio.post('/voice/transcribe-intent', data: form);
    return res.data;
  }

  Future<String?> uploadAudio(Uint8List bytes, String url) async {
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(http.MultipartFile.fromBytes('audio', bytes,
        filename: 'audio.wav'));
    final streamed = await request.send();
    return await streamed.stream.bytesToString();
  }
 
}
