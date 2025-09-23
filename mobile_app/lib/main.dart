import 'package:flutter/material.dart';
import 'models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_banking_poc/routes.dart';
import 'bloc/voice_bloc.dart';
import 'services/voice_repository.dart';
import 'l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'widgets/language_toggle_widget.dart';
import 'models/voice_intent.dart';
import 'widgets/speaking_indicator.dart';



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


class VoiceBankHome extends StatefulWidget {
  const VoiceBankHome({super.key});

  @override
  State<VoiceBankHome> createState() => _VoiceBankHomeState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _VoiceBankHomeState? state =
    context.findAncestorStateOfType<_VoiceBankHomeState>();
    state?.setLocale(newLocale);
  }
}
class _VoiceBankHomeState extends State<VoiceBankHome> {

  Locale _locale = const Locale('en'); // default


  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  bool _highlightBalance = false;
  final ScrollController _scrollController = ScrollController();

  //Mock DB mapping with backend

  final balance = "₹12500.50"; // mock data
  final contacts = {"Ananya": "ananya@upi", "Rajiv": "rajiv@upi"};
  final transactions = const [
    {"date": "2025-08-01", "desc": "Amazon Purchase", "amount": "-₹1,200"},
    {"date": "2025-08-01", "desc": "Electricity Bill", "amount": "-₹2,500"},
    {"date": "2025-08-01", "desc": "Salary Credit", "amount": "+₹50,000"},
    {"date": "2025-08-26", "desc": "Swiggy Order", "amount": "-₹800"},
    {"date": "2025-08-25", "desc": "UPI Transfer", "amount": "-₹5,000"},
  ];

  void _handleIntent(Understood st) {
    final name = st.intent.name;

    if (name == "get_balance") {
      setState(() => _highlightBalance = true);
      Future.delayed(
        const Duration(seconds: 2),
            () => setState(() => _highlightBalance = false),
      );
    } else if (name == "recent_txn") {
      Future.delayed(const Duration(milliseconds: 300), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      });
    } else if (name == "pay_person") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Payment initiated 🚀")),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: AppBar(title:  Text(loc.appTitle), actions: [LanguageToggleWidget()],),


       body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Balance Card
            Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.curBalance,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 8),
                    Text(balance,
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.green)),
                  ],
                ),
              ),
            ),

            // Transactions List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(AppLocalizations.of(context)!.recTxns,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final tx = transactions[index];
                  return ListTile(
                    title: Text(tx["desc"]!),
                    subtitle: Text(tx["date"]!),
                    trailing: Text(tx["amount"]!,
                        style: TextStyle(
                          color: tx["amount"]!.startsWith('-')
                              ? Colors.red
                              : Colors.green,
                          fontWeight: FontWeight.w600,
                        )),
                  );
                },
              ),
            ),
             

          ],
        ),
                 
        // Floating mic button
        floatingActionButton: BlocBuilder<VoiceBloc, VoiceState>(
          builder: (context, st) {

            return FloatingActionButton(
              onPressed: () {
                final bloc = context.read<VoiceBloc>();
                if (st is Idle) {
                  Text(AppLocalizations.of(context)!.micHint);
                  bloc.add(StartListening());
                } else if (st is Listening) {
                  Text(AppLocalizations.of(context)!.listening);
                  bloc.add(StopListening(locale: Localizations
                      .localeOf(context)
                      .languageCode));
                } else {
                  bloc.add(Reset());
                }
              },

              child: Icon(st is Listening ? Icons.stop : Icons.mic),
            );
          },
        ),
      );
  }
}
