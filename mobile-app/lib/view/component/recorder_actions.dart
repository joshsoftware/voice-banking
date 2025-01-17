import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pulsator/pulsator.dart';
import 'package:tts/util/helper.dart';

class AudioRecorderControls extends StatelessWidget {
  const AudioRecorderControls({
    super.key,
    required this.audioRecordingPath,
    required this.viewState,
    required this.toggleRecording,
    required this.discardRecording,
    required this.submitRecording,
  });

  final ViewState viewState;
  final String? audioRecordingPath;
  final Future<void> Function(ViewState viewState) toggleRecording;
  final Future<void> Function() discardRecording;
  final Future<void> Function(String recordingPath) submitRecording;

  Widget recordingButtonIcon(ViewState viewState) {
    return viewState == ViewState.recording
        ? const PulseIcon(
            icon: Icons.circle,
            pulseColor: Colors.red,
            iconColor: Colors.white,
            iconSize: 96,
            innerSize: 96,
            pulseSize: 200,
            pulseCount: 2,
            pulseDuration: Duration(seconds: 2),
          )
        : const Icon(
            Icons.circle,
            size: 96.0,
            color: Colors.red,
          );
  }

  @override
  Widget build(BuildContext context) {
    switch (viewState) {
      case ViewState.idle:
      case ViewState.recording:
        return Listener(
          onPointerDown: (_) => toggleRecording(viewState),
          onPointerUp: (_) => toggleRecording(viewState),
          child: recordingButtonIcon(viewState),
        );

      case ViewState.recorded:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Retry button
            IconButton(
              onPressed: discardRecording,
              visualDensity: VisualDensity.compact,
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.restart_alt_rounded,
                color: Colors.grey,
                size: 96.0,
              ),
            ),

            // Submit button
            IconButton(
              onPressed: () async {
                if (audioRecordingPath != null &&
                    audioRecordingPath!.isNotEmpty) {
                  await submitRecording(audioRecordingPath!);
                } else {
                  log("Recording path is invalid: ${audioRecordingPath}");
                  //TODO: handle this
                }
              },
              visualDensity: VisualDensity.compact,
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.check,
                color: Colors.green,
                size: 96.0,
              ),
            ),
          ],
        );

      case ViewState.processingAudio:
        return Center(
          child: SizedBox.square(
            dimension: 64.0,
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.teal,
              size: 64,
            ),
            // child: CircularProgressIndicator(
            //   strokeWidth: 2.0,
            //   color: Colors.teal,
            // ),
          ),
        );
    }
  }
}
