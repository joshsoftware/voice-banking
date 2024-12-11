import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'action_page.dart';

class AudioRecorderPage extends StatefulWidget {
  const AudioRecorderPage({super.key});

  @override
  AudioRecorderPageState createState() => AudioRecorderPageState();
}

class AudioRecorderPageState extends State<AudioRecorderPage> {
  final FlutterSoundRecorder recorder = FlutterSoundRecorder();
  final FlutterSoundPlayer player = FlutterSoundPlayer();
  bool isRecording = false;
  bool isPlaying = false;
  String selectedMode = 'Offline';
  String? recordedPath;
  ValueNotifier<int> totalBytes=ValueNotifier(1);
  ValueNotifier<int> sentBytes=ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    initRecorder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Audio Recorder')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<String>(
                  value: 'Online',
                  groupValue: selectedMode,
                  onChanged: (String? value) {
                    setState(() {
                      selectedMode = value!;
                      recordedPath = null;
                    });
                  },
                ),
                const Text('Online Mode'),
                const SizedBox(width: 20),
                Radio<String>(
                  value: 'Offline',
                  groupValue: selectedMode,
                  onChanged: (String? value) {
                    setState(() {
                      selectedMode = value!;
                      recordedPath = null;
                    });
                  },
                ),
                const Text('Offline Mode'),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isRecording ? stopRecording : startRecording,
              child: Text(isRecording ? 'Stop Recording' : 'Start Recording'),
            ),

            const SizedBox(height: 20),
            if (recordedPath != null)
              ElevatedButton(
                onPressed: () async{
                  String response;
                  if (selectedMode == 'Online') {
                    response =  (await uploadFile(sentBytes, totalBytes));
                  } else {
                    response = await locallyProcessRecording();
                  }
                  navigateToActionPage(response);
                },
                child: const Text('Submit'),
              ),
          ],
        ),
      ),
    );
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

  Future<void> startRecording() async {
    await recorder.startRecorder(toFile: 'audio_record.aac');
    setState(() {
      isRecording = true;
      recordedPath = null;
    });
  }

  Future<void> stopRecording() async {
    final path = await recorder.stopRecorder();
    setState(() {
      isRecording = false;
      recordedPath = path;
    });
    print('Recorded audio saved at: $path');
  }

  Future<void> _playRecording() async {
    if (recordedPath != null && !isPlaying) {
      await player.startPlayer(fromURI: recordedPath);
      setState(() {
        isPlaying = true;
      });
      await player.startPlayer(
        fromURI: recordedPath,
        whenFinished: () {
          setState(() {
            isPlaying = false;
          });
        },
      );
    }
  }

  Future<void> _pausePlayback() async {
    if (isPlaying) {
      await player.pausePlayer();
      setState(() {
        isPlaying = false;
      });
    }
  }

  Future<MultipartFile> getMultiPartFiles(String? filePath) async {
    MultipartFile? multiPartFile;
    try {
      final MultipartFile file = await MultipartFile.fromFile(filePath!);
      multiPartFile = file;
    } catch (e) {

    }
    return multiPartFile!;
  }

  // String uploadAttachmentsUrl = ApiUrls.baseUrl + ApiUrls.upload;


  Future<String> uploadFile(ValueNotifier<int> sentBytes,
      ValueNotifier<int> totalBytes) async{
    return 'hi hello';
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
    Response response= await dio.post('', data: requestBody,onSendProgress: (int sent,int total){
      sentBytes.value=sent;
      totalBytes.value=total;
      print('Upload Progress:$sent/$total');
    }

    );
    // return response as String;
  }

  String locallyProcessRecording(){
    print(recordedPath);
    return 'hello';
  }

  void navigateToActionPage(String response){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ActionPage(response: response)));
  }
  @override
  void dispose() {
    recorder.closeRecorder();
    player.closePlayer();
    super.dispose();
  }
}

