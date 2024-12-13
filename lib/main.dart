import 'package:flutter/material.dart';
import 'audio_recorder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: AudioRecorderPage(),
    );
  }
}

