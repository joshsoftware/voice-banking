import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/registration_voice_bloc.dart';
import '../bloc/registration_voice_event.dart';
import '../bloc/registration_voice_state.dart';
import '../services/voice_repository.dart';
import '../services/tts_service.dart';
import '../l10n/app_localizations.dart';
import '../widgets/language_toggle_widget.dart';

/// Screen for voice registration flow with 3 images
class RegistrationVoiceScreen extends StatefulWidget {
  const RegistrationVoiceScreen({super.key});

  @override
  State<RegistrationVoiceScreen> createState() => _RegistrationVoiceScreenState();
}

class _RegistrationVoiceScreenState extends State<RegistrationVoiceScreen> {

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    // Get localized image descriptions (same order as _allImagePaths in bloc)
    final localizedDescriptions = [
      loc.imageDescriptionBoardMeeting,
      loc.imageDescriptionBoyWithDog,
      loc.imageDescriptionChildrenPainting,
      loc.imageDescriptionChildrenWithDog,
      loc.imageDescriptionConstructionSite,
      loc.imageDescriptionFamilyDinner,
      loc.imageDescriptionHoliCelebration,
      loc.imageDescriptionLadyPainting,
      loc.imageDescriptionMomAndSon,
      loc.imageDescriptionPeopleDiwaliCelebration,
      loc.imageDescriptionTajMahal,
      loc.imageDescriptionVillageScene,
      loc.imageDescriptionWomenDiwaliCelebration,
    ];
    
    return BlocProvider(
      create: (context) => RegistrationVoiceBloc(
        voiceRepository: VoiceRepository(),
        ttsService: TTSService(),
      )..add(InitializeVoiceStep(localizedDescriptions: localizedDescriptions)),
      child: BlocBuilder<RegistrationVoiceBloc, RegistrationVoiceState>(
        builder: (context, state) {
          final isUploading = state is RegistrationVoiceReady && state.isUploading;
          return WillPopScope(
            onWillPop: () async {
              // Prevent back navigation during upload
              if (isUploading) {
                final loc = AppLocalizations.of(context)!;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(loc.pleaseWaitForUpload),
                    duration: const Duration(seconds: 2),
                  ),
                );
                return false;
              }
              return true;
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text(AppLocalizations.of(context)!.voiceRegistration),
                centerTitle: true,
                // Prevent back navigation during upload
                leading: isUploading
                    ? const SizedBox.shrink() // Hide back button during upload
                    : IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                actions: [
                  if (!isUploading)
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("Skip"),
                    ),
                  LanguageToggleWidget(color: Colors.black),
                ],
              ),
              body: BlocConsumer<RegistrationVoiceBloc, RegistrationVoiceState>(
                listener: (context, state) {
                  if (state is RegistrationVoiceReady) {
                    // Show error messages
                    if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
                      final loc = AppLocalizations.of(context)!;
                      final translatedMessage = _translateErrorMessage(state.errorMessage!, loc);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(translatedMessage),
                          backgroundColor: Colors.red,
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }

                    // Show success message and navigate back
                    if (state.uploadSuccess) {
                      final loc = AppLocalizations.of(context)!;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(loc.voiceRegistrationCompleted),
                          backgroundColor: Colors.green,
                          duration: const Duration(seconds: 2),
                        ),
                      );
                      // Pop the registration screen immediately after successful registration
                      Future.delayed(const Duration(milliseconds: 500), () {
                        if (mounted) {
                          Navigator.of(context).pop(true); // Return success
                        }
                      });
                    }
                  }
                },
                builder: (context, state) {
                  if (state is RegistrationVoiceInitial) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is RegistrationVoiceReady) {
                    return _buildContent(context, state);
                  }

                  return Center(
                    child: Text(AppLocalizations.of(context)!.unknownState),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, RegistrationVoiceReady state) {
    // Show loading overlay during upload
    if (state.isUploading) {
      return Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 0.0, bottom: 12.0),
                  child: _buildScrollableContent(context, state),
                ),
              ),
              // Show Register button only after 3rd image recording is complete
              if (state.currentImageIndex == 2 && 
                  state.recordedFilePaths.length > 2 && 
                  state.recordedFilePaths[2].isNotEmpty)
                _buildRegisterButton(context, state),
            ],
          ),
          Container(
            color: Colors.black54,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context)!.uploadingVoiceRecordings,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 0.0, bottom: 12.0),
            child: _buildScrollableContent(context, state),
          ),
        ),
        // Show Register button only after 3rd image recording is complete
        if (state.currentImageIndex == 2 && 
            state.recordedFilePaths.length > 2 && 
            state.recordedFilePaths[2].isNotEmpty)
          _buildRegisterButton(context, state),
      ],
    );
  }

  Widget _buildScrollableContent(BuildContext context, RegistrationVoiceReady state) {
    final loc = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);
    final localizedDescriptions = [
      loc.imageDescriptionBoardMeeting,
      loc.imageDescriptionBoyWithDog,
      loc.imageDescriptionChildrenPainting,
      loc.imageDescriptionChildrenWithDog,
      loc.imageDescriptionConstructionSite,
      loc.imageDescriptionFamilyDinner,
      loc.imageDescriptionHoliCelebration,
      loc.imageDescriptionLadyPainting,
      loc.imageDescriptionMomAndSon,
      loc.imageDescriptionPeopleDiwaliCelebration,
      loc.imageDescriptionTajMahal,
      loc.imageDescriptionVillageScene,
      loc.imageDescriptionWomenDiwaliCelebration,
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Progress indicator
        _buildProgressIndicator(state.currentImageIndex),

        const SizedBox(height: 20),

        // Image display with speaker button in bottom right
        _buildImageDisplay(
          context,
          state.currentImageIndex,
          state.selectedImagePaths,
          state,
          localizedDescriptions,
          locale.languageCode,
        ),

        const SizedBox(height: 20),

        // Instructions
        _buildInstructions(state.currentImageIndex, context),

        const SizedBox(height: 20),

        // Control buttons
        _buildControlButtons(context, state),

        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildProgressIndicator(int currentIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index <= currentIndex ? Colors.blue : Colors.grey[300],
                border: Border.all(
                  color: index == currentIndex ? Colors.blue : Colors.grey,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: index <= currentIndex ? Colors.white : Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            if (index < 2)
              Container(
                width: 40,
                height: 2,
                color: index < currentIndex ? Colors.blue : Colors.grey[300],
              ),
          ],
        );
      }),
    );
  }

  Widget _buildImageDisplay(
    BuildContext context,
    int currentIndex,
    List<String> imagePaths,
    RegistrationVoiceReady state,
    List<String> localizedDescriptions,
    String localeCode,
  ) {
    final canPlay = !state.isRecording && !state.isUploading;
    final canStop = state.isTTSPlaying && !state.isUploading;

    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: currentIndex < imagePaths.length
                ? Image.asset(
                    imagePaths[currentIndex],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image, size: 64, color: Colors.grey[400]),
                            const SizedBox(height: 8),
                            Text(
                              AppLocalizations.of(context)!.imageNumber(currentIndex + 1),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              AppLocalizations.of(context)!.somethingWentWrong,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(AppLocalizations.of(context)!.imageNotAvailable),
                  ),
          ),
          // Google-style speaker button in bottom right corner
          Positioned(
            bottom: 12,
            right: 12,
            child: Material(
              color: Colors.blue[100],
              shape: const CircleBorder(),
              child: InkWell(
                onTap: canPlay || canStop
                    ? () {
                        if (state.isTTSPlaying) {
                          context.read<RegistrationVoiceBloc>().add(StopTTS());
                        } else {
                          context.read<RegistrationVoiceBloc>().add(PlayTTS(
                                localizedDescriptions: localizedDescriptions,
                                localeCode: localeCode,
                              ));
                        }
                      }
                    : null,
                customBorder: const CircleBorder(),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    state.isTTSPlaying ? Icons.stop : Icons.volume_up,
                    size: 16,
                    color: canPlay || canStop
                        ? (state.isTTSPlaying ? Colors.red : Colors.blue[700])
                        : Colors.grey[400],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInstructions(int currentIndex, BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, color: Colors.blue[700]),
              const SizedBox(width: 8),
              Text(
                loc.stepOfTotal(currentIndex + 1, 3),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            loc.describeImageInstruction(kMaxRecordingSeconds),
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildControlButtons(BuildContext context, RegistrationVoiceReady state) {
    final loc = AppLocalizations.of(context)!;

    return Column(
      children: [
        // Record/Re-record button
        SizedBox(
          width: double.infinity,
          // height: 46,
          child: ElevatedButton.icon(
            onPressed: state.isRecording
                ? () => context.read<RegistrationVoiceBloc>().add(StopRecording())
                : state.isTTSPlaying || state.isUploading
                    ? null
                    : state.hasCurrentRecording
                        ? () => context.read<RegistrationVoiceBloc>().add(ReRecord())
                        : () => context.read<RegistrationVoiceBloc>().add(StartRecording()),
            icon: Icon(
              state.isRecording 
                  ? Icons.stop 
                  : state.hasCurrentRecording 
                      ? Icons.refresh 
                      : Icons.mic,
              size: 24,
            ),
            label: Text(
              state.isRecording 
                  ? loc.stopRecording
                  : state.hasCurrentRecording 
                      ? loc.reRecord
                      : loc.startRecording,
              style: const TextStyle(fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: state.isRecording 
                  ? Colors.red 
                  : state.hasCurrentRecording 
                      ? Colors.orange 
                      : Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),

        SizedBox(height: state.isRecording ? 5 : 15),

        // Recording indicator with gentle filling progress (no countdown)
        if (state.isRecording && state.recordingStartedAt != null)
          _RecordingProgressSection(
            recordingStartedAt: state.recordingStartedAt!,
            maxDurationSeconds: kMaxRecordingSeconds,
          ),

        if (state.isRecording)
          const SizedBox(height: 15),

        // Next button (only show if not on last image and recording is done)
        if (state.currentImageIndex < 2 && state.hasCurrentRecording)
          SizedBox(
            width: double.infinity,
            // height: 46,
            child: ElevatedButton.icon(
              onPressed: state.canProceedToNext && !state.isUploading
                  ? () => context.read<RegistrationVoiceBloc>().add(NextImage())
                  : null,
              icon: const Icon(Icons.arrow_forward),
              label: Text(loc.nextStep),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildRegisterButton(BuildContext context, RegistrationVoiceReady state) {
    // Button is only shown when 3rd recording is complete, so it's always enabled
    // unless uploading
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          // height: 46,
          child: ElevatedButton(
            onPressed: !state.isUploading
                ? () => context.read<RegistrationVoiceBloc>().add(SubmitVoiceRegistration())
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: state.isUploading ? Colors.grey[400] : Colors.blue[600],
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              AppLocalizations.of(context)!.register,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _translateErrorMessage(String errorMessage, AppLocalizations loc) {
    // Map error messages to localization keys
    if (errorMessage.contains('Please wait for the description to finish playing')) {
      return loc.pleaseWaitForDescription;
    } else if (errorMessage.contains('Microphone permission is required')) {
      return loc.microphonePermissionRequired;
    } else if (errorMessage.contains('Failed to start recording')) {
      final error = errorMessage.split(':').length > 1 ? errorMessage.split(':')[1].trim() : '';
      return loc.failedToStartRecording(error);
    } else if (errorMessage.contains('Recording failed')) {
      return loc.recordingFailed;
    } else if (errorMessage.contains('Recording file not found')) {
      return loc.recordingFileNotFound;
    } else if (errorMessage.contains('Recording is empty')) {
      return loc.recordingEmpty;
    } else if (errorMessage.contains('Please speak for at least')) {
      return loc.pleaseSpeakAtLeastSeconds(kMinRecordingSeconds);
    } else if (errorMessage.contains('Please speak something')) {
      return loc.pleaseSaySomething;
    } else if (errorMessage.contains('Failed to stop recording')) {
      final error = errorMessage.split(':').length > 1 ? errorMessage.split(':')[1].trim() : '';
      return loc.failedToStopRecording(error);
    } else if (errorMessage.contains('Please stop recording before playing')) {
      return loc.pleaseStopRecordingBeforePlay;
    } else if (errorMessage.contains('Failed to play description')) {
      final error = errorMessage.split(':').length > 1 ? errorMessage.split(':')[1].trim() : '';
      return loc.failedToPlayDescription(error);
    } else if (errorMessage.contains('Failed to stop description')) {
      final error = errorMessage.split(':').length > 1 ? errorMessage.split(':')[1].trim() : '';
      return loc.failedToStopDescription(error);
    } else if (errorMessage.contains('Please record your voice before proceeding')) {
      return loc.pleaseRecordBeforeProceeding;
    } else if (errorMessage.contains('Please wait for recording or description to complete')) {
      return loc.pleaseWaitForRecordingOrDescription;
    } else if (errorMessage.contains('Please complete all 3 recordings')) {
      return loc.pleaseCompleteAllRecordings;
    } else if (errorMessage.contains('User ID not found')) {
      return loc.userIdNotFound;
    } else if (errorMessage.contains('recording files are missing')) {
      return loc.recordingFilesMissing;
    }
    // Return original message if no translation found
    return errorMessage;
  }
}

/// Gentle filling progress indicator during recording — no countdown numbers.
/// Shows a soft pill-shaped bar that fills over [maxDurationSeconds].
class _RecordingProgressSection extends StatefulWidget {
  final DateTime recordingStartedAt;
  final int maxDurationSeconds;

  const _RecordingProgressSection({
    required this.recordingStartedAt,
    required this.maxDurationSeconds,
  });

  @override
  State<_RecordingProgressSection> createState() =>
      _RecordingProgressSectionState();
}

class _RecordingProgressSectionState extends State<_RecordingProgressSection> {
  Timer? _timer;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _updateProgress();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (mounted) _updateProgress();
    });
  }

  void _updateProgress() {
    final elapsed = DateTime.now().difference(widget.recordingStartedAt);
    final seconds = elapsed.inMilliseconds / 1000.0;
    final p = (seconds / widget.maxDurationSeconds).clamp(0.0, 1.0);
    if (p != _progress) {
      setState(() => _progress = p);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red[100]!),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                loc.recording,
                style: TextStyle(
                  color: Colors.red[700],
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Gentle filling bar — fills over time, no numbers
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 6,
              child: LinearProgressIndicator(
                value: _progress,
                backgroundColor: Colors.red[100],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                minHeight: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
