import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.height < 700;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          loc.faq,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF667eea),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF667eea),
              const Color(0xFF764ba2),
              const Color(0xFFf093fb),
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(isSmallScreen ? 20 : 24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue[600]!, Colors.blue[800]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.help_outline,
                          color: Colors.white,
                          size: isSmallScreen ? 40 : 48,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          loc.frequentlyAskedQuestions,
                          style: TextStyle(
                            fontSize: isSmallScreen ? 20 : 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          loc.learnHowToUseVoiceBanking,
                          style: TextStyle(
                            fontSize: isSmallScreen ? 14 : 16,
                            color: Colors.white.withOpacity(0.9),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // FAQ Items
                  _buildFAQItem(
                    context,
                    loc.whatToSpeak,
                    loc.whatToSpeakDescription,
                    Icons.mic,
                    Colors.green,
                    isSmallScreen,
                  ),

                  const SizedBox(height: 16),

                  _buildFAQItem(
                    context,
                    loc.howToCheckTransactions,
                    loc.howToCheckTransactionsDescription,
                    Icons.history,
                    Colors.blue,
                    isSmallScreen,
                  ),

                  const SizedBox(height: 16),

                  _buildFAQItem(
                    context,
                    loc.voiceCommands,
                    loc.voiceCommandsDescription,
                    Icons.record_voice_over,
                    Colors.purple,
                    isSmallScreen,
                  ),

                  const SizedBox(height: 16),

                  _buildFAQItem(
                    context,
                    loc.supportedLanguages,
                    loc.supportedLanguagesDescription,
                    Icons.language,
                    Colors.orange,
                    isSmallScreen,
                  ),

                  const SizedBox(height: 16),

                  _buildFAQItem(
                    context,
                    loc.privacySecurity,
                    loc.privacySecurityDescription,
                    Icons.security,
                    Colors.red,
                    isSmallScreen,
                  ),

                  const SizedBox(height: 24),

                  // Tips Section
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
                    decoration: BoxDecoration(
                      color: Colors.amber[50],
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.amber[200]!),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.lightbulb_outline,
                              color: Colors.amber[700],
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              loc.proTips,
                              style: TextStyle(
                                fontSize: isSmallScreen ? 16 : 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber[800],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _buildTipItem(
                          loc.tipQuietEnvironment,
                          Icons.volume_up,
                          isSmallScreen,
                        ),
                        _buildTipItem(
                          loc.tipNaturalLanguage,
                          Icons.chat,
                          isSmallScreen,
                        ),
                        _buildTipItem(
                          loc.tipWaitForIndicator,
                          Icons.timer,
                          isSmallScreen,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Contact Support
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.grey[100]!, Colors.grey[200]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.support_agent,
                          color: Colors.grey[600],
                          size: 32,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          loc.needMoreHelp,
                          style: TextStyle(
                            fontSize: isSmallScreen ? 16 : 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          loc.contactSupportDescription,
                          style: TextStyle(
                            fontSize: isSmallScreen ? 12 : 14,
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFAQItem(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
    bool isSmallScreen,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: color,
              size: isSmallScreen ? 20 : 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isSmallScreen ? 16 : 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: isSmallScreen ? 13 : 14,
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipItem(String text, IconData icon, bool isSmallScreen) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.amber[600],
            size: 16,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: isSmallScreen ? 12 : 13,
                color: Colors.amber[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
