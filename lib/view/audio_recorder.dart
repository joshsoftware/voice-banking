import 'dart:async';
import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tts/util/helper.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:tts/view/action_result.dart';

import '../util/action.dart';
import 'component/recorder_actions.dart';

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
  ValueNotifier<ViewState> viewStateNotifier = ValueNotifier(ViewState.idle);
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
            valueListenable: viewStateNotifier,
            builder: (context, viewState, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Recording widgets set
                  Column(
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
                                return Visibility(
                                  visible: viewState == ViewState.recorded,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: IconButton(
                                      onPressed: () => togglePlayback(
                                          viewState, playingState),
                                      visualDensity: VisualDensity.compact,
                                      padding: EdgeInsets.zero,
                                      icon: Icon(
                                        playButtonIcon(playingState),
                                        size: 36.0,
                                        color: Colors.grey,
                                      ),
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
                                  getRecordingLabel(viewState, recordingLength),
                                  style: const TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.white70,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),

                      // Recording controls (start, stop, retry and submit)
                      ConstrainedBox(
                        constraints: const BoxConstraints(minHeight: 200.0),
                        child: AudioRecorderControls(
                          viewState: viewState,
                          audioRecordingPath: recordedPath,
                          toggleRecording: (viewState) => toggleRecording(
                            viewState: viewState,
                            context: context,
                          ),
                          discardRecording: discardRecording,
                          submitRecording: (path) => submitRecording(
                            recordedPath: path,
                            context: context,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Offline mode switch
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          'On-Device AI',
                          style: TextStyle(color: Colors.white38),
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
                ],
              );
            }),
      ),
    );
  }

  String getRecordingLabel(ViewState state, int? recordingLength) {
    switch (state) {
      case ViewState.idle:
        return 'Say Something';

      case ViewState.recording:
        if (recordingLength == null) {
          return 'N/A';
        }
        return getFormattedTimeFromSeconds(recordingLength);

      case ViewState.recorded:
        return 'Submit?';

      case ViewState.processingAudio:
        return 'Hold on';
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

  Future<void> submitRecording({
    required final String recordedPath,
    required final BuildContext context,
  }) async {
    viewStateNotifier.value = ViewState.processingAudio;
    try {
      final BankingActionable? action = await getActionFromAudio(recordedPath);
      if (action == null) {
        //TODO: handle this
      }
      performBankingAction(action!);
    } catch (e) {
      //TODO: Handle this
      dev.log("Error while mapping action: ${e.toString()}");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Couldn't get you, try again."),
      ));
    }
    viewStateNotifier.value = ViewState.idle;
  }

  Future<BankingActionable?> getActionFromAudio(
      final String recordedPath) async {
    final response = await postAudioToGetAction(recordedPath);
    if (response != null) {
      final BankingActionable action =
          BankingActionable.fromMap(response["result"]);
      if (action.action == BankingAction.unsupported) {
        dev.log("Action matched: Unsupported");
        //TODO: Handle this
        return null;
      }
      dev.log("Action matched: ${action.toMap().toString()}");
      return action;
    }
    return null;
  }

  Future<void> performBankingAction(final BankingActionable action) async {
    //TODO: Perform action and navigate to resultant screen

    final BankingActionable verifiedAction = BankingActionable(
      action: action.action,
      amount: action.amount ?? (Random().nextInt(10000) + 100),
      recipient: action.recipient,
    );

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ActionResultView(actionable: verifiedAction),
      ),
    );
  }

  Future<void> discardRecording() async {
    setState(() {
      playingStateNotifier.value = PlayingState.idle;
      viewStateNotifier.value = ViewState.idle;
      recordedPath = null;
    });
  }

  Future<void> toggleRecording({
    required final ViewState viewState,
    required final BuildContext context,
  }) async {
    if (viewState == ViewState.recording) {
      await _stopRecording(context);
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
      viewStateNotifier.value = ViewState.recording;
      recordedPath = null;
    });
  }

  Future<void> _stopRecording(
    final BuildContext context,
  ) async {
    final path = await recorder.stopRecorder();

    recordingTimer?.cancel();
    recordingTimer = null;
    recordingLengthNotifier.value = null;

    if (path == null) {
      //TODO: Handle recording failure
    }
    setState(() {
      viewStateNotifier.value = ViewState.recorded;
      recordedPath = path;
    });
    dev.log('Recorded audio saved at: $path');
    if (path != null) {
      submitRecording(
        recordedPath: path,
        context: context,
      );
    }
  }

  Future<void> togglePlayback(
      ViewState viewState, PlayingState playingState) async {
    if (viewState == ViewState.recorded) {
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

  Future<MultipartFile?> getMultiPartFile(final String filePath) async {
    try {
      return await MultipartFile.fromFile(filePath);
    } catch (e) {
      dev.log(
          "Error while creating multipart file from file path ${e.toString()}");
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> postAudioToGetAction(
      final String recordingPath) async {
    final file = await getMultiPartFile(recordingPath);
    //TODO: Above call can throw error, handle it
    final FormData requestBody = FormData.fromMap({
      'file': file,
    });
    final Dio dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        contentType: Headers.jsonContentType,
      ),
    );
    final Response response = await dio.post(
        'https://a3bc-202-149-221-42.ngrok-free.app/get-action-from-audio',
        data: requestBody, onSendProgress: (int sent, int total) {
      sentBytes.value = sent;
      totalBytes.value = total;
      dev.log("Audio File Upload Progress:$sent/$total");
    });
    dev.log("Response from audio file upload: ${response.data.toString()}");
    if (response.statusCode == HttpStatus.ok) {
      return response.data;
    }
    return null;
  }

  void checkBengaliSupport() async {
    List<dynamic> languages = await flutterTts.getLanguages;
    if (languages.contains("bn")) {
      dev.log("Bengali is supported.");
    } else {
      dev.log("Bengali is not supported on this device.");
    }
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    player.closePlayer();
    super.dispose();
  }
}
