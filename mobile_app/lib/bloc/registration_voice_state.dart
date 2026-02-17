/// States for voice registration flow
sealed class RegistrationVoiceState {}

/// Initial state
class RegistrationVoiceInitial extends RegistrationVoiceState {}

/// Ready state with current image index and recording status
class RegistrationVoiceReady extends RegistrationVoiceState {
  final int currentImageIndex; // 0, 1, or 2
  final bool isRecording;
  final bool isTTSPlaying;
  final bool isUploading;
  final List<String> recordedFilePaths; // Size 3, empty strings if not recorded
  final List<String> selectedImagePaths; // 3 randomly selected image paths
  final List<String> selectedImageDescriptions; // Descriptions matching selected images
  final String? errorMessage;
  final bool uploadSuccess;

  RegistrationVoiceReady({
    required this.currentImageIndex,
    required this.isRecording,
    required this.isTTSPlaying,
    required this.isUploading,
    required this.recordedFilePaths,
    required this.selectedImagePaths,
    required this.selectedImageDescriptions,
    this.errorMessage,
    this.uploadSuccess = false,
  });

  /// Check if current image has been recorded
  bool get hasCurrentRecording => 
      currentImageIndex < recordedFilePaths.length && 
      recordedFilePaths[currentImageIndex].isNotEmpty;

  /// Check if all 3 recordings are complete
  bool get allRecordingsComplete =>
      recordedFilePaths.length == 3 &&
      recordedFilePaths.every((path) => path.isNotEmpty);

  /// Check if can proceed to next image
  bool get canProceedToNext => hasCurrentRecording && !isRecording && !isTTSPlaying;

  /// Create a copy with updated fields
  RegistrationVoiceReady copyWith({
    int? currentImageIndex,
    bool? isRecording,
    bool? isTTSPlaying,
    bool? isUploading,
    List<String>? recordedFilePaths,
    List<String>? selectedImagePaths,
    List<String>? selectedImageDescriptions,
    String? errorMessage,
    bool? uploadSuccess,
  }) {
    return RegistrationVoiceReady(
      currentImageIndex: currentImageIndex ?? this.currentImageIndex,
      isRecording: isRecording ?? this.isRecording,
      isTTSPlaying: isTTSPlaying ?? this.isTTSPlaying,
      isUploading: isUploading ?? this.isUploading,
      recordedFilePaths: recordedFilePaths ?? this.recordedFilePaths,
      selectedImagePaths: selectedImagePaths ?? this.selectedImagePaths,
      selectedImageDescriptions: selectedImageDescriptions ?? this.selectedImageDescriptions,
      errorMessage: errorMessage,
      uploadSuccess: uploadSuccess ?? this.uploadSuccess,
    );
  }
}
