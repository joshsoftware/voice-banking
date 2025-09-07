import 'package:flutter/material.dart';
import 'main.dart'; // for VoiceBankingApp.setLocale


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
      ],
    );
  }
}
