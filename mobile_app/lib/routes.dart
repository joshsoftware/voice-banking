import 'package:flutter/material.dart';
import 'package:voice_banking_poc/landing_screen.dart';
import 'package:voice_banking_poc/main.dart';
import 'package:voice_banking_poc/otp_screen.dart';

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
