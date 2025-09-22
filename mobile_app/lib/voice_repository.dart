import 'dart:io';
import 'package:dio/dio.dart';
import 'package:record/record.dart';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';



class VoiceRepository {
  final _rec = AudioRecorder();
  
  //final Dio dio = Dio(BaseOptions(baseUrl: "http://192.168.1.6:8000"));
  final Dio dio = Dio(BaseOptions(baseUrl: "https://loglytics.joshsoftware.com"));



  Future<String> getFilePath() async {
    final dir = await getApplicationDocumentsDirectory();
    return '${dir.path}/recording.mp3';
  }


  Future<void> start() async {
    if (await _rec.hasPermission()) {
      final path = await getFilePath();
      await _rec.start(const RecordConfig(encoder: AudioEncoder.wav, sampleRate: 16000), path: path);
    }
  }

  Future<Map<String, dynamic>> stopAndTranscribe({locale = 'en'}) async {
    final path = await _rec.stop();
    final file = File(path!);
    final form = FormData.fromMap({
      'audio': await MultipartFile.fromFile(file.path, filename: 'recording.mp3'),
      'session_id': const Uuid().v4(),
      'locale' : locale,
    });
    final res = await dio.post('/voice/transcribe-intent', data: form);
    res.data['lang'] = locale ?? 'en';
    return res.data;
  }


 
}
