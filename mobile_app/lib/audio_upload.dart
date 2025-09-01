import 'dart:typed_data';
import 'dart:io' show File;
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class AudioUploader {
  final String backendUrl;
  AudioUploader({required this.backendUrl});

  Future<String?> pickAndUpload() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['wav', 'mp3', 'm4a'],
      withData: kIsWeb,
    );
    if (result == null) return null;

    if (kIsWeb) {
      final bytes = result.files.first.bytes!;
      final request = http.MultipartRequest('POST', Uri.parse(backendUrl));
      request.files.add(http.MultipartFile.fromBytes('audio', bytes,
          filename: result.files.first.name));
      final streamed = await request.send();
      return await streamed.stream.bytesToString();
    } else {
      final filePath = result.files.first.path!;
      final file = File(filePath);
      final request = http.MultipartRequest('POST', Uri.parse(backendUrl));
      request.files.add(await http.MultipartFile.fromPath('audio', file.path));
      final streamed = await request.send();
      return await streamed.stream.bytesToString();
    }
  }
}
