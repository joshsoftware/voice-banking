import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'action_page.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AudioRecorderPage extends StatefulWidget {
  const AudioRecorderPage({super.key});

  @override
  AudioRecorderPageState createState() => AudioRecorderPageState();
}

class AudioRecorderPageState extends State<AudioRecorderPage> {
  final FlutterSoundRecorder recorder = FlutterSoundRecorder();
  final FlutterSoundPlayer player = FlutterSoundPlayer();
  final FlutterTts flutterTts = FlutterTts();
  bool isRecording = false;
  bool isPlaying = false;
  String selectedMode = 'Offline';
  String? recordedPath;
  ValueNotifier<int> totalBytes=ValueNotifier(1);
  ValueNotifier<int> sentBytes=ValueNotifier(0);
  String? response;
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    initRecorder();
    checkBengaliSupport();
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
                ValueListenableBuilder(
                  valueListenable: isLoading,
                  builder: (BuildContext context, bool value, Widget? child) {
                    return Radio<String>(
                      value: 'Online',
                      groupValue: selectedMode,
                      onChanged:isLoading.value == true ? null :  (String? value) {
                        setState(() {
                          selectedMode = value!;
                          recordedPath = null;
                        });
                      },
                    );
                  },
                ),
                const Text('Online Mode'),
                const SizedBox(width: 20),
                ValueListenableBuilder(
                  valueListenable: isLoading,
                  builder: (BuildContext context, bool value, Widget? child) {
                    return Radio<String>(
                      value: 'Offline',
                      groupValue: selectedMode,
                      onChanged: isLoading.value == true ? null : (String? value) {
                        setState(() {
                          selectedMode = value!;
                          recordedPath = null;
                        });
                      },
                    );
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
              ValueListenableBuilder(
                valueListenable: isLoading,
                builder: (context, value, child) {
                  return ElevatedButton(
                    onPressed: () async{
                      response = null;
                      if (selectedMode == 'Online') {
                        isLoading.value = true;
                        response =  (await uploadFile(sentBytes, totalBytes));
                        Future.delayed(Duration(seconds: 3),() {
                          isLoading.value = false;
                        },);
                      } else {
                        isLoading.value = true;
                        response = locallyProcessRecording();
                        Future.delayed(Duration(seconds: 3),() {
                          isLoading.value = false;
                        },);
                      }
                      if(!(response == null)){
                        Future.delayed(Duration(seconds: 3),() {
                          navigateToActionPage(response ?? '');
                        },);

                      }

                    },
                    child: !(isLoading.value)?const Text('Submit'):const SizedBox(height: 20,width: 20,child: CircularProgressIndicator(),),
                  );
                },
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
    return 'Check account balance';
  }

  void navigateToActionPage(String response){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ActionPage(response: response)));
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

