import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'voice_bloc.dart';
import 'voice_repository.dart';
import 'audio_upload.dart';

final uploader = AudioUploader(backendUrl: "http://10.0.2.2:8000/transcribe");

void main() {
  print("🔥 Starting app..."); // Check if this appears
  runApp(VoiceBankingApp());
}

class VoiceBankingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voice Banking PoC',
      home: BlocProvider(
        create: (_) => VoiceBloc(VoiceRepository()),
        child: VoiceBankHome(),
      ),
    );
  }
}

class VoiceBankHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Voice Banking PoC')),
      body: Center(
        child: BlocBuilder<VoiceBloc, VoiceState>(
          builder: (ctx, st) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  st is Idle ? "Tap mic to speak" :
                  st is Listening ? "Listening..." :
                  st is Transcribing ? "Transcribing..." :
                  st is Understood ? "Intent: ${st.intent.summary()}" :
                  st is Executing ? st.message : "",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 24),
                FloatingActionButton(
                  onPressed: () {
                    final bloc = context.read<VoiceBloc>();
                    if (st is Idle) {
                      bloc.add(StartListening());
                    } else if (st is Listening) {
                      bloc.add(StopListening());
                    }
                  },
                  child: const Icon(Icons.mic),
                ),
                // In your UI button
                ElevatedButton(
                onPressed: () async {
                    final response = await uploader.pickAndUpload();
                    print("STT Response: $response");
                },
                child: const Text("Record & Upload"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
