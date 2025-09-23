import 'package:flutter/material.dart';
import 'package:voice_banking_poc/screens/landing_screen.dart';
import 'package:voice_banking_poc/screens/otp_screen.dart';
import 'package:voice_banking_poc/screens/voice_bank_home.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => LandingScreen());
      case '/OtpScreen':
        return MaterialPageRoute(builder: (context) => OtpScreen(params: settings.arguments as OtpScreenParams,));
      case '/HomeScreen':
        return MaterialPageRoute(builder: (context) => VoiceBankHome());
      default:
        return MaterialPageRoute(builder: (context) => ErrorPage());
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Error route'),),
    );
  }
}
