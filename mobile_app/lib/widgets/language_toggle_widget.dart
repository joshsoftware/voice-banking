import 'package:flutter/material.dart';
import '../main.dart'; // for VoiceBankingApp.setLocale


class LanguageToggleWidget extends StatelessWidget {

  const LanguageToggleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Locale>(
      icon: const Icon(Icons.language),
      onSelected: (locale) {
        VoiceBankingApp.setLocale(context, locale);
      },
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: Locale('en'),
          child: Text("English"),
        ),
        PopupMenuItem(
          value: Locale('hi'),
          child: Text("हिन्दी"),
        ),
        PopupMenuItem(
          value: Locale('ta'),
          child: Text("தமிழ்"),
        ),
        PopupMenuItem(
            value: const Locale('te'),
            child: Text("తెలుగు"),
        ),
        PopupMenuItem(
            value: const Locale('bn'),
            child: Text("বাংলা"),
        ),
        PopupMenuItem(
            value: const Locale('gu'),
            child: Text("ગુજરાતી"),
        ),
        PopupMenuItem(
            value: const Locale('ml'),
            child: Text("മലയാളം"),
        ),
        PopupMenuItem(
            value: const Locale('mr'),
            child: Text("मराठी"),
        ),
        PopupMenuItem(
            value: const Locale('kn'),
            child: Text("ಕನ್ನಡ"),
        ),
        PopupMenuItem(
            value: const Locale('pa'),
            child: Text("ਪੰਜਾਬੀ"),
        ),
      ],
    );
  }
}
