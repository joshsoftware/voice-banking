import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'actionables.dart';

class ActionPage extends StatelessWidget {
  final String response;

   ActionPage({super.key, required this.response});

  RegExp amountRegex = RegExp(r'\b\d+\b');
  // RegExp recipientRegex = RegExp(r'\b\w+\b');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Response')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              response,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(onPressed: (){
              processTranscript(response);
            }, child: const Text('Submit'))
          ],
        ),
      ),
    );
  }

  String findRecipient(String transcript) {
    transcript = transcript.toLowerCase();
    List<String> words = transcript.split(RegExp(r'\s+'));

    List<String> filteredWords = words.where((word) {
      bool isNumeric = RegExp(r'^\d+$').hasMatch(word);
      return !isNumeric && !all.contains(word);
    }).toList();

    return filteredWords.isNotEmpty ? filteredWords.first : 'Unknown';
  }

  String findActionFromTranscript(String transcript) {
    List<Actionables> matchingActions = supportedActions.where((actionable) {
      return actionable.keywords.any(
              (keyword) => transcript.toLowerCase().contains(keyword.toLowerCase()));
    }).toList();
    log(matchingActions.toString());

    if (matchingActions.isEmpty) return 'No Actionables found';
    if (matchingActions.length > 1) return 'Multiple Actionables found';

    return matchingActions.first.action;
  }

  Map<String, dynamic> filterProperties(String transcript, Actionables actionable) {
    Map<String, dynamic> result = {};
    RegExp amountRegex = RegExp(r'\b\d+\b');

    switch (actionable.action) {
      case 'Money Transfer':
        result['amount'] = amountRegex.firstMatch(transcript)?.group(0) ?? 'Unknown';
        result['recipient'] = findRecipient(transcript);
        break;

      case 'Balance Check':
        result['message'] = 'Balance check requested';
        break;

      case 'Show Transactions':
        result['message'] = 'Displaying the last transaction';
        break;

      case 'Scan and Pay':
        result['message'] = 'Opening QR scanner...';
        break;

      case 'Check Account Details':
        result['message'] = 'Account details requested';
        break;

      default:
        result['message'] = 'Unknown action';
    }

    return result;
  }

  String resultantAction(String action, Map<String, dynamic> properties) {
    Map<String, String> actionResults = {
      'Money Transfer':
      '${properties['amount']} transferred to ${properties['recipient']} successfully.',
      'Balance Check': 'Your account balance is abc.',
      'Show Transactions': 'Displaying the last transaction.',
      'Scan and Pay': 'QR scanner opened.',
      'Check Account Details': 'Here are your account details: Account Name, Number, etc.',
    };

    return actionResults[action] ?? 'Action completed.';
  }

  void processTranscript(String transcript) {
    String action = findActionFromTranscript(transcript);

    if (action == 'No Actionables found' || action == 'Multiple Actionables found') {
      log(action);
      return;
    }

    Actionables actionable = supportedActions.firstWhere((a) => a.action == action);
    Map<String, dynamic> properties = filterProperties(transcript, actionable);
    String result = resultantAction(action, properties);

    log(result);
  }
}
