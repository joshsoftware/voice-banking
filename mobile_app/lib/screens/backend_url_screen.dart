import 'package:flutter/material.dart';
import '../config/backend_url_config.dart';

/// Shown on first launch when no backend URL is set. User must enter a non-empty URL
/// and confirm; it is then saved and used for all API calls.
class BackendUrlScreen extends StatefulWidget {
  const BackendUrlScreen({super.key});

  @override
  State<BackendUrlScreen> createState() => _BackendUrlScreenState();
}

class _BackendUrlScreenState extends State<BackendUrlScreen> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _confirm() async {
    if (!_formKey.currentState!.validate()) return;

    final url = _controller.text.trim();
    await BackendUrlConfig.setBackendUrl(url);

    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Set Backend URL',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Enter the backend server URL to connect to. This is required before using the app.',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: 'Backend URL',
                    hintText: 'https://example.com',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.url,
                  autocorrect: false,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Backend URL is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: _confirm,
                  child: const Text('Confirm'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
