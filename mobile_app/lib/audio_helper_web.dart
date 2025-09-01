// Only used in Web
import 'dart:typed_data';
import 'dart:html' as html;
import 'audio_helper.dart';
import 'dart:async'; // for Completer

class AudioHelperWeb implements AudioHelper {
  @override
  Future<Uint8List?> pickAudioBytes() async {
    final completer = Completer<Uint8List?>();
    final uploadInput = html.FileUploadInputElement();
    uploadInput.accept = '.wav,.mp3,.m4a';
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      final file = uploadInput.files!.first;
      final reader = html.FileReader();
      reader.readAsArrayBuffer(file);
      reader.onLoadEnd.listen((e) {
        completer.complete(reader.result as Uint8List);
      });
    });

    return completer.future;
  }
}
