import 'package:flutter/material.dart';
import 'otp_screen.dart';
import 'l10n/app_localizations.dart';
import 'language_toggle_widget.dart';


class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();


  static void setLocale(BuildContext context, Locale newLocale) {
    _LandingScreenState? state =
    context.findAncestorStateOfType<_LandingScreenState>();
    state?.setLocale(newLocale);
  }
}

class _LandingScreenState extends State<LandingScreen> {
  Locale _locale = const Locale('en'); // default

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  final _controller = TextEditingController();
  void _submitNumber() {
    final mobile = _controller.text.trim();
    if (mobile.isEmpty || mobile.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text( AppLocalizations.of(context)!.loginPrompt)),
      );
      return;
    }

    // generate dummy OTP
    final otp = "123456";

    // simulate push notification
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Lingo Voice Banking OTP: $otp")),
    );

    Navigator.pushNamed(context, '/OtpScreen',arguments: OtpScreenParams(mobileNumber: int.parse(mobile), otp: int.parse(otp)));
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.appTitle),actions: [LanguageToggleWidget()],),
      body: Padding(

        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: loc.loginPrompt,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitNumber,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text("Submit"),

            ),
          ],
        ),
      ),
    );
  }
}
