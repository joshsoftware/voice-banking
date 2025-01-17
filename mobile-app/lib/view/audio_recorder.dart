import 'dart:async';
import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tts/util/helper.dart';
import 'package:tts/value/language.dart';
import 'package:tts/value/message.dart';
import 'package:tts/value/network.dart';
import 'package:tts/view/action_result.dart';
import 'package:tts/view/component/footer.dart';

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
  final ValueNotifier<int> totalBytes = ValueNotifier(1);
  final ValueNotifier<int> sentBytes = ValueNotifier(0);
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<int?> recordingLengthNotifier = ValueNotifier(null);
  final ValueNotifier<ViewState> viewStateNotifier =
      ValueNotifier(ViewState.idle);
  final ValueNotifier<PlayingState> playingStateNotifier =
      ValueNotifier(PlayingState.idle);
  final ValueNotifier<VoiceBankingLanguage> selectedVoiceBankingLanguage =
      ValueNotifier(VoiceBankingLanguage.hindi);
  
  bool isPlaying = false;
  String selectedMode = 'Online';
  String? recordedPath;
  Timer? recordingTimer;

  @override
  void initState() {
    super.initState();
    initRecorder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppMessages.appTitle,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white70,
          ),
        ),
        centerTitle: false,
        actions: [
          // Language selection
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ValueListenableBuilder(
              valueListenable: selectedVoiceBankingLanguage,
              builder: (context, language, _) {
                return DropdownButton<VoiceBankingLanguage>(
                  value: language,
                  onChanged: (selectedLanguage) {
                    selectedVoiceBankingLanguage.value =
                        selectedLanguage ?? VoiceBankingLanguage.hindi;
                  },
                  items: VoiceBankingLanguage.values
                      .map(
                        (language) => DropdownMenuItem(
                          value: language,
                          child: Row(
                            spacing: 8.0,
                            children: [
                              const Icon(Icons.translate_outlined,
                                  color: Colors.white38),
                              Text(language.label),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
        ],
        bottom: PreferredSize(
            preferredSize: const Size(double.maxFinite, 1.0),
            child: Container(
              height: 1.0,
              color: Colors.white10,
            )),
      ),
      body: ValueListenableBuilder(
          valueListenable: viewStateNotifier,
          builder: (context, viewState, _) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox.shrink(),

                const Spacer(),
                    
                // Recording widgets set
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
                                onPressed: () =>
                                    togglePlayback(viewState, playingState),
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
                      ValueListenableBuilder<int?>(
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

                // Sample Commands
                ValueListenableBuilder<ViewState>(
                    valueListenable: viewStateNotifier,
                    builder: (context, viewState, _) {
                      return Opacity(
                        opacity: viewState == ViewState.idle ? 1.0 : 0.25,
                        child: ValueListenableBuilder<VoiceBankingLanguage>(
                          valueListenable: selectedVoiceBankingLanguage,
                          builder: (context, selectedLanguage, _) {
                            return Column(
                              spacing: 8.0,
                              children: selectedLanguage.sampleCommands
                                  .map(
                                    (command) => Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 4.0,
                                        horizontal: 8.0,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white10,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Text(
                                        command,
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.white38,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            );
                          },
                        ),
                      );
                    }),

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
                      language: selectedVoiceBankingLanguage.value.id,
                      context: context,
                    ),
                  ),
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

                const Spacer(),

                const Footer(),
              ],
            );
          }),
    );
  }

  String getRecordingLabel(ViewState state, int? recordingLength) {
    switch (state) {
      case ViewState.idle:
        return AppMessages.appStateLabelIdle;

      case ViewState.recording:
        if (recordingLength == null) {
          return '';
        }
        return getFormattedTimeFromSeconds(recordingLength);

      case ViewState.recorded:
        return AppMessages.appStateLabelRecorded;

      case ViewState.processingAudio:
        return AppMessages.appStateLabelProcessing;
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
      throw AppMessages.permissionMicNotGranted;
    }
  }

  IconData playButtonIcon(PlayingState playingState) {
    return playingState == PlayingState.playing
        ? Icons.pause
        : Icons.play_arrow;
  }

  Future<void> submitRecording({
    required final String recordedPath,
    required final String language,
    required final BuildContext context,
  }) async {
    viewStateNotifier.value = ViewState.processingAudio;
    try {
      final BankingActionable? action =
          await getActionFromAudio(recordedPath, language);
      if (action == null) {
        //TODO: handle this
      }
      performBankingAction(action!);
    } catch (e) {
      //TODO: Handle this
      dev.log("Error while mapping action: ${e.toString()}");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(AppMessages.actionExtractionFailed),
      ));
    }
    viewStateNotifier.value = ViewState.idle;
  }

  Future<BankingActionable?> getActionFromAudio(
    final String recordedPath,
    final String language,
  ) async {
    final response = await postAudioToGetAction(recordedPath, language);
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
        language: selectedVoiceBankingLanguage.value.id,
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
    final String recordingPath,
    final String language,
  ) async {
    final MultipartFile? file = await getMultiPartFile(recordingPath);
    //TODO: Above call can throw error, handle it
    final FormData requestBody = FormData.fromMap({
      'file': file,
      'language': language,
    });
    final Dio dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        contentType: Headers.jsonContentType,
      ),
    );
    final Response response = await dio.post(
        AppNetwork.getActionFromAudio,
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

  @override
  void dispose() {
    recorder.closeRecorder();
    player.closePlayer();
    super.dispose();
  }
}
