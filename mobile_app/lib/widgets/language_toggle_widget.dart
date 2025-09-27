import 'package:flutter/material.dart';
import '../main.dart'; // for VoiceBankingApp.setLocale
import "../l10n/app_localizations.dart";

class LanguageToggleWidget extends StatelessWidget {

  const LanguageToggleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    
    return PopupMenuButton<Locale>(
      icon: const Icon(Icons.language),
      onSelected: (locale) {
        VoiceBankingApp.setLocale(context, locale);
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: const Locale('en'),
          child: Text(loc.english),
        ),
        PopupMenuItem(
          value: const Locale('hi'),
          child: Text(loc.hindi),
        ),
        PopupMenuItem(
          value: const Locale('ta'),
          child: Text(loc.tamil),
        ),
        PopupMenuItem(
            value: const Locale('te'),
            child: Text(loc.telugu),
        ),
        PopupMenuItem(
            value: const Locale('bn'),
            child: Text(loc.bengali),
        ),
        PopupMenuItem(
            value: const Locale('gu'),
            child: Text(loc.gujarati),
        ),
        PopupMenuItem(
            value: const Locale('ml'),
            child: Text(loc.malayalam),
        ),
        PopupMenuItem(
            value: const Locale('mr'),
            child: Text(loc.marathi),
        ),
        PopupMenuItem(
            value: const Locale('kn'),
            child: Text(loc.kannada),
        ),
        PopupMenuItem(
            value: const Locale('pa'),
            child: Text(loc.punjabi),
        ),
      ],
    );
  }
}
