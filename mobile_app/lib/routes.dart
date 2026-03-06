import 'package:flutter/material.dart';
import 'package:voice_banking_poc/screens/backend_url_screen.dart';
import 'package:voice_banking_poc/screens/landing_screen.dart';
import 'package:voice_banking_poc/screens/otp_screen.dart';
import 'package:voice_banking_poc/screens/voice_bank_home.dart';
import 'package:voice_banking_poc/screens/all_transactions_screen.dart';
import 'package:voice_banking_poc/screens/faq_screen.dart';
import 'package:voice_banking_poc/screens/registration_voice_screen.dart';
import 'package:voice_banking_poc/config/backend_url_config.dart';
import 'package:voice_banking_poc/services/shared_preferences_service.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        // Require backend URL to be set first (after splash / app launch)
        final backendUrl = BackendUrlConfig.getBackendUrl();
        if (backendUrl == null || backendUrl.trim().isEmpty) {
          return MaterialPageRoute(builder: (context) => const BackendUrlScreen());
        }
        // Check if user is already logged in
        if (SharedPreferencesService.isLoggedIn()) {
          return MaterialPageRoute(builder: (context) => VoiceBankHome());
        } else {
          return MaterialPageRoute(builder: (context) => LandingScreen());
        }
      case '/OtpScreen':
        return MaterialPageRoute(
            builder: (context) => OtpScreen(
                  params: settings.arguments as OtpScreenParams,
                ));
      case '/HomeScreen':
        return MaterialPageRoute(builder: (context) => VoiceBankHome());
      case '/AllTransactions':
        return MaterialPageRoute(builder: (context) => AllTransactionsScreen());
      case '/FAQ':
        return MaterialPageRoute(builder: (context) => FAQScreen());
      case '/RegistrationVoice':
        return MaterialPageRoute(builder: (context) => const RegistrationVoiceScreen());
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
      body: Center(
        child: Text('Error route'),
      ),
    );
  }
}
