import 'dart:typed_data';

abstract class AudioHelper {
  Future<Uint8List?> pickAudioBytes();
}
