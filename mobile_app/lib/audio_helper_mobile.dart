import 'dart:typed_data';
import 'dart:io';
import 'audio_helper.dart';
import 'package:file_picker/file_picker.dart';

class AudioHelperMobile implements AudioHelper {
  @override
  Future<Uint8List?> pickAudioBytes() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['wav', 'mp3', 'm4a'],
      withData: true,
    );

    if (result == null) return null;

    final filePath = result.files.first.path;
    if (filePath != null) {
      return File(filePath).readAsBytes();
    } else {
      return result.files.first.bytes;
    }
  }
}
