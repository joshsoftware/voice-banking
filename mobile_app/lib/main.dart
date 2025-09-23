import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_banking_poc/routes.dart';
import 'bloc/voice_bloc.dart';
import 'services/voice_repository.dart';
import 'l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
