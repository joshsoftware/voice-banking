import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_banking_poc/routes.dart';
import 'voice_bloc.dart';
import 'voice_repository.dart';
import 'l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'language_toggle_widget.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  print("Starting app...");

  final voiceRepo = VoiceRepository();

  runApp(
    BlocProvider(
      create: (_) => VoiceBloc(voiceRepo),
      child: VoiceBankingApp(),
    ),
  );
}

  class VoiceBankingApp extends StatefulWidget {
    const VoiceBankingApp({super.key});

    @override
    State<VoiceBankingApp> createState() => _VoiceBankingAppState();

    static void setLocale(BuildContext context, Locale newLocale) {
      _VoiceBankingAppState? state =
      context.findAncestorStateOfType<_VoiceBankingAppState>();
      state?.setLocale(newLocale);
    }
  }

  class _VoiceBankingAppState extends State<VoiceBankingApp> {
    Locale _locale = const Locale('en'); // default

    void setLocale(Locale locale) {
      setState(() {
        _locale = locale;
      });
    }


    @override
    Widget build(BuildContext context) {
        return MaterialApp(
          title: "Lingo Voice Banking",
          theme: ThemeData(primarySwatch: Colors.blue),
          initialRoute: '/',
          onGenerateRoute: MyRouter.generateRoute,
          locale: _locale,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English
            Locale('hi'), // Hindi
            Locale('ta'), // Tamil
            Locale('te'), // Telugu
            Locale('bn'), // Bengali 
            Locale('gu'),  // Gujarati
            Locale('ml'),  // Malayalam
            Locale('mr'),  // Marathi
            Locale('kn'),  // Kannada
            Locale('pa'),  // Punjabi
          ],
        );
    }
  }


class VoiceBankHome extends StatelessWidget {
  const VoiceBankHome({super.key});
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: const Text('Lingo Voice Banking'),actions: [LanguageToggleWidget()],),
      body: Center(
        child: BlocBuilder<VoiceBloc, VoiceState>(
          builder: (context, st) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  st is Idle ? AppLocalizations.of(context)!.micHint :
                  st is Listening ? AppLocalizations.of(context)!.listening :
                  st is Transcribing ? AppLocalizations.of(context)!.transcribing :
                  st is Understood ? "Intent: ${st.intent.summary()}" :
                  st is Executing ? AppLocalizations.of(context)!.executing : "",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 24),
                FloatingActionButton(
                  onPressed: () {
                    final bloc = context.read<VoiceBloc>();
                    if (st is Idle) {
                      bloc.add(StartListening());
                    } else if (st is Listening) {
                      bloc.add(StopListening(locale: Localizations.localeOf(context).languageCode));
                    }else {
                      bloc.add(Reset());
                    }
                    },
                    child: const Icon(Icons.add),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
