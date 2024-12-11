import 'package:flutter/material.dart';

class ActionPage extends StatelessWidget {
  final String response;

  const ActionPage({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Response')),
      body: Center(
        child: Text(
          response,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
