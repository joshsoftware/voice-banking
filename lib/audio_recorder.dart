import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'action_page.dart';
import 'package:flutter_tts/flutter_tts.dart';

enum RecordingState { idle, recording, recorded }

enum PlayingState { idle, playing, played }

class AudioRecorderPage extends StatefulWidget {
  const AudioRecorderPage({super.key});

  @override
  AudioRecorderPageState createState() => AudioRecorderPageState();
}

class AudioRecorderPageState extends State<AudioRecorderPage> {
  final FlutterSoundRecorder recorder = FlutterSoundRecorder();
  final FlutterSoundPlayer player = FlutterSoundPlayer();
  final FlutterTts flutterTts = FlutterTts();
  bool isPlaying = false;
  String selectedMode = 'Online';
  String? recordedPath;
  ValueNotifier<int> totalBytes = ValueNotifier(1);
  ValueNotifier<int> sentBytes = ValueNotifier(0);
  String? response;
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ValueNotifier<int?> recordingLengthNotifier = ValueNotifier(null);
  ValueNotifier<RecordingState> recordingStateNotifier =
      ValueNotifier(RecordingState.idle);
  ValueNotifier<PlayingState> playingStateNotifier =
      ValueNotifier(PlayingState.idle);
  Timer? recordingTimer;

  @override
  void initState() {
    super.initState();
    initRecorder();
    checkBengaliSupport();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Banking'),
        centerTitle: true,
      ),
      body: Center(
        child: ValueListenableBuilder(
            valueListenable: recordingStateNotifier,
            builder: (context, recordingState, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Offline mode switch
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Text(
                            'Use Offline',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        //TODO: Enable following once offline mode is ready
                        Switch(
                          value: selectedMode == 'online',
                          onChanged: true
                              ? null
                              // ignore: dead_code
                              : (set) {
                                  setState(() {
                                    if (set) {
                                      selectedMode = 'online';
                                    } else {
                                      selectedMode = 'offline';
                                    }
                                  });
                                },
                        )
                      ],
                    ),
                  ),

                  // Recording widgets set
                  Padding(
                    padding: const EdgeInsets.only(bottom: 56.0),
                    child: Column(
                      children: [
                        // Recording label (CTA and duration)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Playback Action
                              ValueListenableBuilder(
                                valueListenable: playingStateNotifier,
                                builder: (context, playingState, _) {
                                  if (recordingState !=
                                      RecordingState.recorded) {
                                    return const SizedBox();
                                  }
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: IconButton(
                                      onPressed: () => togglePlayback(
                                          recordingState, playingState),
                                      padding: EdgeInsets.zero,
                                      icon: Icon(
                                        playButtonIcon(playingState),
                                        size: 24.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  );
                                },
                              ),
                          
                              // Label
                              ValueListenableBuilder(
                                valueListenable: recordingLengthNotifier,
                                builder: (context, recordingLength, _) {
                                  return Text(
                                    getRecordingLabel(
                                        recordingState, recordingLength),
                                    style: const TextStyle(fontSize: 24.0),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),

                        // Recording controls (start, stop, retry and submit)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Start and stop button
                            if (recordingState != RecordingState.recorded)
                              IconButton(
                                onPressed: () =>
                                    toggleRecording(recordingState),
                                icon: Icon(
                                  recordingButtonIcon(recordingState),
                                  size: 96.0,
                                  color: Colors.red,
                                ),
                              ),

                            // Retry button
                            if (recordingState == RecordingState.recorded)
                              IconButton(
                                onPressed: discardRecording,
                                icon: const Icon(
                                  Icons.restart_alt_rounded,
                                  color: Colors.grey,
                                  size: 96.0,
                                ),
                              ),

                            // Submit button
                            if (recordingState == RecordingState.recorded)
                              IconButton(
                                onPressed: submitRecording,
                                icon: const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 96.0,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(height: 20),
                  // if (recordedPath != null)
                  //   ValueListenableBuilder(
                  //     valueListenable: isLoading,
                  //     builder: (context, value, child) {
                  //       return ElevatedButton(
                  //         onPressed: () async {
                  //           response = null;
                  //           if (selectedMode == 'Online') {
                  //             isLoading.value = true;
                  //             response = (await uploadFile(sentBytes, totalBytes));
                  //             Future.delayed(
                  //               Duration(seconds: 3),
                  //               () {
                  //                 isLoading.value = false;
                  //               },
                  //             );
                  //           } else {
                  //             isLoading.value = true;
                  //             response = locallyProcessRecording();
                  //             Future.delayed(
                  //               Duration(seconds: 3),
                  //               () {
                  //                 isLoading.value = false;
                  //               },
                  //             );
                  //           }
                  //           if (!(response == null)) {
                  //             Future.delayed(
                  //               Duration(seconds: 3),
                  //               () {
                  //                 navigateToActionPage(response ?? '');
                  //               },
                  //             );
                  //           }
                  //         },
                  //         child: !(isLoading.value)
                  //             ? const Text('Submit')
                  //             : const SizedBox(
                  //                 height: 20,
                  //                 width: 20,
                  //                 child: CircularProgressIndicator(),
                  //               ),
                  //       );
                  //     },
                  //   ),
                ],
              );
            }),
      ),
    );
  }

  String getRecordingLabel(RecordingState state, int? recordingLength) {
    switch (state) {
      case RecordingState.idle:
        return 'Start Recording';

      case RecordingState.recording:
        if (recordingLength == null) {
          return 'N/A';
        }
        return getFormattedTimeFromSeconds(recordingLength);

      case RecordingState.recorded:
        return 'Submit?';
    }
  }

  String getFormattedTimeFromSeconds(final int seconds) {
    String formattedTime = "";

    int mins = seconds ~/ 60;
    int secs = seconds - mins * 60;

    formattedTime =
        "${mins > 9 ? mins : '0$mins'}:${secs > 9 ? secs : '0$secs'}";

    return formattedTime;
  }

  Future<void> initRecorder() async {
    await Permission.microphone.request();
    if (await Permission.microphone.isGranted) {
      await recorder.openRecorder();
      await player.openPlayer();
    } else {
      throw 'Microphone permission not granted';
    }
  }

  IconData playButtonIcon(PlayingState playingState) {
    return playingState == PlayingState.playing
        ? Icons.pause
        : Icons.play_arrow;
  }

  IconData recordingButtonIcon(RecordingState recordingState) {
    return recordingState == RecordingState.recording
        ? Icons.stop
        : Icons.circle;
  }

  Future<void> submitRecording() async {
    throw UnimplementedError();
  }

  Future<void> discardRecording() async {
    setState(() {
      playingStateNotifier.value = PlayingState.idle;
      recordingStateNotifier.value = RecordingState.idle;
      recordedPath = null;
    });
  }

  Future<void> toggleRecording(RecordingState recordingState) async {
    if (recordingState == RecordingState.recording) {
      await _stopRecording();
    } else {
      await _startRecording();
    }
  }

  Future<void> _startRecording() async {
    await recorder.startRecorder(toFile: 'audio_record.aac');
    recordingLengthNotifier.value = 0;
    recordingTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      recordingLengthNotifier.value = recordingLengthNotifier.value! + 1;
    });
    setState(() {
      playingStateNotifier.value = PlayingState.idle;
      recordingStateNotifier.value = RecordingState.recording;
      recordedPath = null;
    });
  }

  Future<void> _stopRecording() async {
    final path = await recorder.stopRecorder();
    
    recordingTimer?.cancel();
    recordingTimer = null;
    recordingLengthNotifier.value = null;

    if (path == null) {
      //TODO: Handle recording failure
    }
    setState(() {
      recordingStateNotifier.value = RecordingState.recorded;
      recordedPath = path;
    });
    log('Recorded audio saved at: $path');
  }

  Future<void> togglePlayback(
      RecordingState recordingState, PlayingState playingState) async {
    if (recordingState == RecordingState.recorded) {
      if (playingState == PlayingState.playing) {
        playingStateNotifier.value = PlayingState.played;
        await player.pausePlayer();
      } else {
        playingStateNotifier.value = PlayingState.playing;
        await player.startPlayer(
          fromURI: recordedPath,
          whenFinished: () {
            setState(() {
              playingStateNotifier.value = PlayingState.played;
            });
          },
        );
      }
    }
  }

  Future<MultipartFile> getMultiPartFiles(String? filePath) async {
    MultipartFile? multiPartFile;
    try {
      final MultipartFile file = await MultipartFile.fromFile(filePath!);
      multiPartFile = file;
    } catch (e) {}
    return multiPartFile!;
  }

  // String uploadAttachmentsUrl = ApiUrls.baseUrl + ApiUrls.upload;

  Future<String> uploadFile(
      ValueNotifier<int> sentBytes, ValueNotifier<int> totalBytes) async {
    return 'Show last transaction';
    final FormData requestBody = FormData.fromMap({
      // 'attachmentType': attachmentType,
      'files': await getMultiPartFiles(recordedPath),
    });
    final Dio dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        contentType: Headers.jsonContentType,
      ),
    );
    Response response = await dio.post('', data: requestBody,
        onSendProgress: (int sent, int total) {
      sentBytes.value = sent;
      totalBytes.value = total;
      print('Upload Progress:$sent/$total');
    });
    // return response as String;
  }

  String locallyProcessRecording() {
    print(recordedPath);
    return 'Check account balance';
  }

  void navigateToActionPage(String response) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ActionPage(response: response)));
  }

  void checkBengaliSupport() async {
    List<dynamic> languages = await flutterTts.getLanguages;
    if (languages.contains("bn")) {
      print("Bengali is supported.");
    } else {
      print("Bengali is not supported on this device.");
    }
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    player.closePlayer();
    super.dispose();
  }
}
