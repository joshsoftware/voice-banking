/// Events for voice registration flow
sealed class RegistrationVoiceEvent {}

/// Initialize the voice registration step
class InitializeVoiceStep extends RegistrationVoiceEvent {
  final List<String> localizedDescriptions;
  InitializeVoiceStep({required this.localizedDescriptions});
}

/// Start recording audio for current image
class StartRecording extends RegistrationVoiceEvent {}

/// Stop recording audio for current image
class StopRecording extends RegistrationVoiceEvent {}

/// Re-record audio for current image (overwrite previous)
class ReRecord extends RegistrationVoiceEvent {}

/// Play TTS description for current image
class PlayTTS extends RegistrationVoiceEvent {
  final List<String> localizedDescriptions;
  final String localeCode;
  PlayTTS({required this.localizedDescriptions, required this.localeCode});
}

/// Stop TTS playback
class StopTTS extends RegistrationVoiceEvent {}

/// TTS playback completed
class TTSCompleted extends RegistrationVoiceEvent {}

/// Move to next image
class NextImage extends RegistrationVoiceEvent {}

/// Submit all 3 voice recordings to API
class SubmitVoiceRegistration extends RegistrationVoiceEvent {}

/// Upload succeeded
class UploadSuccess extends RegistrationVoiceEvent {}

/// Upload failed
class UploadFailure extends RegistrationVoiceEvent {
  final String errorMessage;
  UploadFailure(this.errorMessage);
}
