import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import '../bloc/registration_voice_event.dart';
import '../bloc/registration_voice_state.dart';
import '../services/voice_repository.dart';
import '../services/tts_service.dart';

/// Bloc for managing voice registration flow

/// Maximum recording duration in seconds (used in bloc and UI)
const kMaxRecordingSeconds = 15;

/// Minimum recording duration in seconds (user must speak at least this long)
const kMinRecordingSeconds = 5;

class RegistrationVoiceBloc
    extends Bloc<RegistrationVoiceEvent, RegistrationVoiceState> {
  final VoiceRepository _voiceRepository;
  final TTSService _ttsService;
  final AudioRecorder _recorder = AudioRecorder();
  
  StreamSubscription? _ttsCompletionSubscription;
  StreamSubscription<Amplitude>? _amplitudeSubscription;
  Timer? _recordingLimitTimer;
  bool _isDisposed = false;
  bool _hasSpoken = false;
  int _consecutiveAboveThreshold = 0;
  /// dBFS threshold for speech detection. -20 dBFS is a reasonable default for speech.
  static const double _speechThreshold = -20;
  /// Number of consecutive amplitude samples above threshold to confirm speech.
  static const int _minConsecutiveForSpeech = 2;

  // All available image paths (matching order with descriptions in .arb)
  static const List<String> _allImagePaths = [
    'assets/images/board_meeting.png',
    'assets/images/boy_with_dog.png',
    'assets/images/children_painting.png',
    'assets/images/children_with_dog.png',
    'assets/images/construction_site.png',
    'assets/images/family_dinner.png',
    'assets/images/holi_celebration.png',
    'assets/images/lady_painting.png',
    'assets/images/mom_and_son.png',
    'assets/images/people_diwali_celebration.png',
    'assets/images/taj_mahal.png',
    'assets/images/village_scene.png',
    'assets/images/women_diwali_celebration.png',
  ];

  /// Randomly select 3 images and their corresponding descriptions
  static List<Map<String, String>> _getRandomImagesAndDescriptions(List<String> localizedDescriptions) {
    final random = Random();
    final availableIndices = List<int>.generate(_allImagePaths.length, (i) => i);
    final selected = <Map<String, String>>[];
    
    // Randomly select 3 images
    for (int i = 0; i < 3 && availableIndices.isNotEmpty; i++) {
      final index = random.nextInt(availableIndices.length);
      final selectedIndex = availableIndices.removeAt(index);
      selected.add({
        'path': _allImagePaths[selectedIndex],
        'description': localizedDescriptions[selectedIndex],
      });
    }
    
    return selected;
  }

  RegistrationVoiceBloc({
    required VoiceRepository voiceRepository,
    required TTSService ttsService,
  })  : _voiceRepository = voiceRepository,
        _ttsService = ttsService,
        super(RegistrationVoiceInitial()) {
    on<InitializeVoiceStep>(_onInitializeVoiceStep);
    on<StartRecording>(_onStartRecording);
    on<StopRecording>(_onStopRecording);
    on<ReRecord>(_onReRecord);
    on<PlayTTS>(_onPlayTTS);
    on<StopTTS>(_onStopTTS);
    on<TTSCompleted>(_onTTSCompleted);
    on<NextImage>(_onNextImage);
    on<SubmitVoiceRegistration>(_onSubmitVoiceRegistration);
    on<UploadSuccess>(_onUploadSuccess);
    on<UploadFailure>(_onUploadFailure);
  }

  Future<void> _onInitializeVoiceStep(
    InitializeVoiceStep event,
    Emitter<RegistrationVoiceState> emit,
  ) async {
    // Randomly select 3 images and their descriptions
    final selected = _getRandomImagesAndDescriptions(event.localizedDescriptions);
    final selectedPaths = selected.map((item) => item['path']!).toList();
    final selectedDescriptions = selected.map((item) => item['description']!).toList();
    
    emit(RegistrationVoiceReady(
      currentImageIndex: 0,
      isRecording: false,
      isTTSPlaying: false,
      isUploading: false,
      recordedFilePaths: ['', '', ''],
      selectedImagePaths: selectedPaths,
      selectedImageDescriptions: selectedDescriptions,
    ));
  }

  Future<void> _onStartRecording(
    StartRecording event,
    Emitter<RegistrationVoiceState> emit,
  ) async {
    if (_isDisposed) return;
    
    final currentState = state;
    if (currentState is! RegistrationVoiceReady) return;

    // Prevent recording if TTS is playing
    if (currentState.isTTSPlaying) {
      emit(currentState.copyWith(
        errorMessage: 'Please wait for the description to finish playing.',
      ));
      return;
    }

    // If already recording, ignore
    if (currentState.isRecording) return;

    try {
      // Check microphone permission
      final hasPermission = await _recorder.hasPermission();
      if (!hasPermission) {
        emit(currentState.copyWith(
          errorMessage:
              'Microphone permission is required. Please enable it in Settings.',
        ));
        return;
      }

      // Stop TTS if playing
      if (currentState.isTTSPlaying) {
        await _ttsService.stop();
      }

      // Get file path for current image
      final dir = await getApplicationDocumentsDirectory();
      final filePath =
          '${dir.path}/voice_registration_${currentState.currentImageIndex}.wav';

      // Start recording
      await _recorder.start(
        const RecordConfig(
          encoder: AudioEncoder.wav,
          sampleRate: 16000,
        ),
        path: filePath,
      );
      

      _hasSpoken = false;
      _consecutiveAboveThreshold = 0;
      _amplitudeSubscription?.cancel();
      _amplitudeSubscription = _recorder
          .onAmplitudeChanged(const Duration(milliseconds: 500))
          .listen((amp) {
        final isSilent = amp.current <= _speechThreshold;
        print('[RegVoice] amp=${amp.current.toStringAsFixed(1)} dBFS | silent=$isSilent | hasSpoken=$_hasSpoken | consecutive=$_consecutiveAboveThreshold');

        if (!isSilent) {
          _consecutiveAboveThreshold++;
          if (_consecutiveAboveThreshold >= _minConsecutiveForSpeech && !_hasSpoken) {
            _hasSpoken = true;
            print('[RegVoice] ✅ Speech confirmed after $_consecutiveAboveThreshold consecutive samples');
          }
        } else {
          _consecutiveAboveThreshold = 0;
          if (!_hasSpoken) {
            print('[RegVoice] ⏳ Silent — waiting for user to start speaking');
          }
        }
      });

      final startedAt = DateTime.now();
      print('[RegVoice] 🎙 Recording started');
      emit(currentState.copyWith(
        isRecording: true,
        errorMessage: null,
        recordingStartedAt: startedAt,
      ));
      _recordingLimitTimer?.cancel();
      _recordingLimitTimer = Timer(const Duration(seconds: kMaxRecordingSeconds), () {
        if (!_isDisposed) add(StopRecording());
      });
    } catch (e) {
      emit(currentState.copyWith(
        isRecording: false,
        errorMessage: 'Failed to start recording: ${e.toString()}',
      ));
    }
  }

  Future<void> _onStopRecording(
    StopRecording event,
    Emitter<RegistrationVoiceState> emit,
  ) async {
    if (_isDisposed) return;
    
    final currentState = state;
    if (currentState is! RegistrationVoiceReady) return;

    if (!currentState.isRecording) return;

    _recordingLimitTimer?.cancel();
    _recordingLimitTimer = null;
    await _amplitudeSubscription?.cancel();
    _amplitudeSubscription = null;

    try {
      print('[RegVoice] ⏹ Recording stopped — validating');
      final path = await _recorder.stop();

      if (path == null || path.isEmpty) {
        print('[RegVoice] ❌ Validation failed: no file path returned');
        emit(currentState.copyWith(
          isRecording: false,
          errorMessage: 'Recording failed. Please try again.',
          recordingStartedAt: null,
        ));
        return;
      }

      final file = File(path);
      if (!await file.exists()) {
        print('[RegVoice] ❌ Validation failed: file not found at $path');
        emit(currentState.copyWith(
          isRecording: false,
          errorMessage: 'Recording file not found. Please try again.',
          recordingStartedAt: null,
        ));
        return;
      }

      final fileSize = await file.length();
      print('[RegVoice] 📁 File size: ${fileSize} bytes');
      if (fileSize == 0) {
        print('[RegVoice] ❌ Validation failed: file is empty');
        emit(currentState.copyWith(
          isRecording: false,
          errorMessage: 'Recording is empty. Please try again.',
          recordingStartedAt: null,
        ));
        return;
      }

      // 1) Check duration: compare stop time with recording start
      final startedAt = currentState.recordingStartedAt;
      if (startedAt != null) {
        final durationSec = DateTime.now().difference(startedAt).inSeconds;
        print('[RegVoice] ⏱ Duration: ${durationSec}s (min: ${kMinRecordingSeconds}s)');
        if (durationSec < kMinRecordingSeconds) {
          print('[RegVoice] ❌ Validation failed: too short (${durationSec}s < ${kMinRecordingSeconds}s)');
          emit(currentState.copyWith(
            isRecording: false,
            errorMessage: 'Please speak for at least $kMinRecordingSeconds seconds.',
            recordingStartedAt: null,
          ));
          return;
        }
      }

      // 2) Check if user spoke (amplitude above threshold during recording)
      print('[RegVoice] 🗣 hasSpoken=$_hasSpoken');
      if (!_hasSpoken) {
        print('[RegVoice] ❌ Validation failed: no speech detected above threshold');
        emit(currentState.copyWith(
          isRecording: false,
          errorMessage: 'Please speak something.',
          recordingStartedAt: null,
        ));
        return;
      }

      // 3) Validation passed: save path and enable Next
      print('[RegVoice] ✅ Validation passed — recording accepted');
      final updatedPaths = List<String>.from(currentState.recordedFilePaths);
      updatedPaths[currentState.currentImageIndex] = path;

      emit(currentState.copyWith(
        isRecording: false,
        recordedFilePaths: updatedPaths,
        errorMessage: null,
        recordingStartedAt: null,
      ));
    } catch (e) {
      emit(currentState.copyWith(
        isRecording: false,
        errorMessage: 'Failed to stop recording: ${e.toString()}',
        recordingStartedAt: null,
      ));
    }
  }

  Future<void> _onReRecord(
    ReRecord event,
    Emitter<RegistrationVoiceState> emit,
  ) async {
    if (_isDisposed) return;
    
    final currentState = state;
    if (currentState is! RegistrationVoiceReady) return;

    // Stop any ongoing recording or TTS
    if (currentState.isRecording) {
      try {
        await _amplitudeSubscription?.cancel();
        _amplitudeSubscription = null;
        await _recorder.stop();
      } catch (e) {
        print('Error stopping recording: $e');
      }
    }

    if (currentState.isTTSPlaying) {
      try {
        await _ttsService.stop();
      } catch (e) {
        print('Error stopping TTS: $e');
      }
    }

    // Clear the current recording
    final updatedPaths = List<String>.from(currentState.recordedFilePaths);
    updatedPaths[currentState.currentImageIndex] = '';

    try {
      // Check microphone permission
      final hasPermission = await _recorder.hasPermission();
      if (!hasPermission) {
        emit(currentState.copyWith(
          isRecording: false,
          isTTSPlaying: false,
          recordedFilePaths: updatedPaths,
          errorMessage:
              'Microphone permission is required. Please enable it in Settings.',
        ));
        return;
      }

      // Get file path for current image
      final dir = await getApplicationDocumentsDirectory();
      final filePath =
          '${dir.path}/voice_registration_${currentState.currentImageIndex}.wav';

      // Start recording immediately
      await _recorder.start(
        const RecordConfig(
          encoder: AudioEncoder.wav,
          sampleRate: 16000,
        ),
        path: filePath,
      );

      _hasSpoken = false;
      _consecutiveAboveThreshold = 0;
      _amplitudeSubscription?.cancel();
      _amplitudeSubscription = _recorder
          .onAmplitudeChanged(const Duration(milliseconds: 500))
          .listen((amp) {
        final isSilent = amp.current <= _speechThreshold;
        print('[RegVoice] amp=${amp.current.toStringAsFixed(1)} dBFS | silent=$isSilent | hasSpoken=$_hasSpoken | consecutive=$_consecutiveAboveThreshold');

        if (!isSilent) {
          _consecutiveAboveThreshold++;
          if (_consecutiveAboveThreshold >= _minConsecutiveForSpeech && !_hasSpoken) {
            _hasSpoken = true;
            print('[RegVoice] ✅ Speech confirmed after $_consecutiveAboveThreshold consecutive samples');
          }
        } else {
          _consecutiveAboveThreshold = 0;
          if (!_hasSpoken) {
            print('[RegVoice] ⏳ Silent — waiting for user to start speaking');
          }
        }
      });

      final startedAt = DateTime.now();
      print('[RegVoice] 🎙 Re-recording started');
      emit(currentState.copyWith(
        isRecording: true,
        isTTSPlaying: false,
        recordedFilePaths: updatedPaths,
        errorMessage: null,
        recordingStartedAt: startedAt,
      ));
      _recordingLimitTimer?.cancel();
      _recordingLimitTimer = Timer(const Duration(seconds: kMaxRecordingSeconds), () {
        if (!_isDisposed) add(StopRecording());
      });
    } catch (e) {
      emit(currentState.copyWith(
        isRecording: false,
        isTTSPlaying: false,
        recordedFilePaths: updatedPaths,
        errorMessage: 'Failed to start recording: ${e.toString()}',
      ));
    }
  }

  Future<void> _onPlayTTS(
    PlayTTS event,
    Emitter<RegistrationVoiceState> emit,
  ) async {
    if (_isDisposed) return;
    
    final currentState = state;
    if (currentState is! RegistrationVoiceReady) return;

    // Prevent TTS if recording is active
    if (currentState.isRecording) {
      emit(currentState.copyWith(
        errorMessage: 'Please stop recording before playing the description.',
      ));
      return;
    }

    // If already playing, ignore
    if (currentState.isTTSPlaying) return;

    try {
      // Stop any ongoing recording
      if (currentState.isRecording) {
        await _recorder.stop();
      }

      emit(currentState.copyWith(
        isTTSPlaying: true,
        isRecording: false,
        errorMessage: null,
      ));

      // Get the path of the currently selected image
      final currentImagePath = currentState.currentImageIndex < currentState.selectedImagePaths.length
          ? currentState.selectedImagePaths[currentState.currentImageIndex]
          : null;
      
      if (currentImagePath == null) {
        emit(currentState.copyWith(
          isTTSPlaying: false,
          errorMessage: 'Image not found for current index.',
        ));
        return;
      }
      
      // Find the index of this image in the original _allImagePaths array
      final originalImageIndex = _allImagePaths.indexOf(currentImagePath);
      
      if (originalImageIndex == -1 || originalImageIndex >= event.localizedDescriptions.length) {
        emit(currentState.copyWith(
          isTTSPlaying: false,
          errorMessage: 'Description not found for selected image.',
        ));
        return;
      }
      
      // Get the description for this specific image in the current locale
      final description = event.localizedDescriptions[originalImageIndex];

      // Play TTS with the current locale
      await _ttsService.speak(description, langCode: event.localeCode);

      // Emit completion event
      add(TTSCompleted());
    } catch (e) {
      emit(currentState.copyWith(
        isTTSPlaying: false,
        errorMessage: 'Failed to play description: ${e.toString()}',
      ));
    }
  }

  Future<void> _onStopTTS(
    StopTTS event,
    Emitter<RegistrationVoiceState> emit,
  ) async {
    if (_isDisposed) return;
    
    final currentState = state;
    if (currentState is! RegistrationVoiceReady) return;

    if (!currentState.isTTSPlaying) return;

    try {
      // Stop TTS playback
      await _ttsService.stop();

      emit(currentState.copyWith(
        isTTSPlaying: false,
        errorMessage: null,
      ));
    } catch (e) {
      emit(currentState.copyWith(
        isTTSPlaying: false,
        errorMessage: 'Failed to stop description: ${e.toString()}',
      ));
    }
  }

  Future<void> _onTTSCompleted(
    TTSCompleted event,
    Emitter<RegistrationVoiceState> emit,
  ) async {
    if (_isDisposed) return;
    
    final currentState = state;
    if (currentState is! RegistrationVoiceReady) return;

    emit(currentState.copyWith(
      isTTSPlaying: false,
    ));
  }

  Future<void> _onNextImage(
    NextImage event,
    Emitter<RegistrationVoiceState> emit,
  ) async {
    if (_isDisposed) return;
    
    final currentState = state;
    if (currentState is! RegistrationVoiceReady) return;

    // Can only proceed if current image has been recorded
    if (!currentState.hasCurrentRecording) {
      emit(currentState.copyWith(
        errorMessage: 'Please record your voice before proceeding.',
      ));
      return;
    }

    // Can't proceed if recording or TTS is active
    if (currentState.isRecording || currentState.isTTSPlaying) {
      emit(currentState.copyWith(
        errorMessage: 'Please wait for recording or description to complete.',
      ));
      return;
    }

    // Move to next image (max index 2)
    if (currentState.currentImageIndex < 2) {
      emit(currentState.copyWith(
        currentImageIndex: currentState.currentImageIndex + 1,
        errorMessage: null,
      ));
    }
  }

  Future<void> _onSubmitVoiceRegistration(
    SubmitVoiceRegistration event,
    Emitter<RegistrationVoiceState> emit,
  ) async {
    if (_isDisposed) return;
    
    final currentState = state;
    if (currentState is! RegistrationVoiceReady) return;

    // Verify all recordings are complete
    if (!currentState.allRecordingsComplete) {
      emit(currentState.copyWith(
        errorMessage: 'Please complete all 3 recordings before submitting.',
      ));
      return;
    }

    // Stop any ongoing recording or TTS
    if (currentState.isRecording) {
      try {
        await _recorder.stop();
      } catch (e) {
        print('Error stopping recording: $e');
      }
    }

    if (currentState.isTTSPlaying) {
      try {
        await _ttsService.stop();
      } catch (e) {
        print('Error stopping TTS: $e');
      }
    }

    emit(currentState.copyWith(
      isUploading: true,
      isRecording: false,
      isTTSPlaying: false,
      errorMessage: null,
    ));

    try {
      final audio1 = File(currentState.recordedFilePaths[0]);
      final audio2 = File(currentState.recordedFilePaths[1]);
      final audio3 = File(currentState.recordedFilePaths[2]);

      if (!await audio1.exists() || !await audio2.exists() || !await audio3.exists()) {
        add(UploadFailure('One or more recording files are missing.'));
        return;
      }

      await _voiceRepository.registerVoice(
        audio1: audio1,
        audio2: audio2,
        audio3: audio3,
      );

      add(UploadSuccess());
    } catch (e) {
      add(UploadFailure(e.toString()));
    }
  }

  Future<void> _onUploadSuccess(
    UploadSuccess event,
    Emitter<RegistrationVoiceState> emit,
  ) async {
    if (_isDisposed) return;
    
    final currentState = state;
    if (currentState is! RegistrationVoiceReady) return;

    emit(currentState.copyWith(
      isUploading: false,
      uploadSuccess: true,
      errorMessage: null,
    ));
  }

  Future<void> _onUploadFailure(
    UploadFailure event,
    Emitter<RegistrationVoiceState> emit,
  ) async {
    if (_isDisposed) return;
    
    final currentState = state;
    if (currentState is! RegistrationVoiceReady) return;

    emit(currentState.copyWith(
      isUploading: false,
      uploadSuccess: false,
      errorMessage: event.errorMessage,
    ));
  }


  @override
  Future<void> close() async {
    _isDisposed = true;
    _recordingLimitTimer?.cancel();
    _recordingLimitTimer = null;
    await _amplitudeSubscription?.cancel();
    _amplitudeSubscription = null;
    
    // Stop recording if active
    try {
      if (await _recorder.isRecording()) {
        await _recorder.stop();
      }
    } catch (e) {
      print('Error stopping recorder on dispose: $e');
    }

    // Stop TTS if playing
    try {
      await _ttsService.stop();
    } catch (e) {
      print('Error stopping TTS on dispose: $e');
    }

    // Cancel subscriptions
    await _ttsCompletionSubscription?.cancel();

    // Dispose recorder
    await _recorder.dispose();

    return super.close();
  }
}
