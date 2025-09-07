import 'package:flutter/material.dart';
import 'language_toggle_widget.dart';
import 'l10n/app_localizations.dart';



class OtpScreen extends StatefulWidget {
  final OtpScreenParams params;

  const OtpScreen({super.key, required this.params});

  @override
  State<OtpScreen> createState() => _OtpScreenState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _OtpScreenState? state =
    context.findAncestorStateOfType<_OtpScreenState>();
    state?.setLocale(newLocale);
  }
}

class _OtpScreenState extends State<OtpScreen> {
  Locale _locale = const Locale('en'); // default

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  final _otpController = TextEditingController();

void _verifyOtp() {
  print(widget.params.otp);
  if (_otpController.text.trim() == widget.params.otp.toString()) {
    Navigator.pushNamedAndRemoveUntil(context, '/HomeScreen', (route) => false);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Invalid OTP, try again")),
    );
  }
 }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text("Verify OTP (${widget.params.mobileNumber})"),actions: [LanguageToggleWidget()],),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: AppLocalizations.of(context)!.otpPrompt,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verifyOtp,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text("Verify"),
            ),
          ],
        ),
      ),
    );
  }
}

class OtpScreenParams {
  final int mobileNumber;
  final int otp;

  OtpScreenParams({
    required this.mobileNumber,
    required this.otp,
});
}
