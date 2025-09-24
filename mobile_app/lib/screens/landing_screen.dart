import 'package:flutter/material.dart';
import 'otp_screen.dart';
import '../l10n/app_localizations.dart';
import '../widgets/language_toggle_widget.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _LandingScreenState? state =
    context.findAncestorStateOfType<_LandingScreenState>();
    state?.setLocale(newLocale);
  }
}

class _LandingScreenState extends State<LandingScreen> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void setLocale(Locale locale) {
    setState(() {});
  }

  void _submitNumber() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() {
      _isLoading = true;
    });

    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));

    final mobile = _controller.text.trim();
    final otp = "123456";

    // Show OTP notification
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Lingo Voice Banking OTP: $otp"),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    setState(() {
      _isLoading = false;
    });

    Navigator.pushNamed(
      context, 
      '/OtpScreen',
      arguments: OtpScreenParams(mobileNumber: int.parse(mobile), otp: int.parse(otp))
    );
  }

  String? _validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.loginPrompt;
    }
    if (value.length < 10) {
      return 'Please enter a valid 10-digit mobile number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.height < 700;
    
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        // title: Text(
        //   loc.appTitle,
        //   style: const TextStyle(
        //     fontWeight: FontWeight.bold,
        //     color: Colors.white,
        //   ),
        // ),
        backgroundColor: const Color(0xFF667eea),
        // elevation: 0,
        actions: [LanguageToggleWidget()],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
               const Color(0xFF667eea),
              const Color(0xFF667eea), // Soft blue-purple
              const Color(0xFF764ba2), // Purple
              const Color(0xFFf093fb), // Pink
              //const Color(0xFFf5576c), // Coral
            ],
            stops: const [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(isSmallScreen ? 16.0 : 24.0),
                child: Column(
                  children: [
                    //SizedBox(height: isSmallScreen ? 10 : 20),
                    
                    // App Logo/Icon
                    Container(
                      width: isSmallScreen ? 70 : 100,
                      height: isSmallScreen ? 70 : 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(isSmallScreen ? 35 : 50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.account_balance,
                        size: isSmallScreen ? 35 : 50,
                        color: Colors.blue,
                      ),
                    ),
                    
                    SizedBox(height: isSmallScreen ? 15 : 25),
                    
                    // Welcome Text
                    Text(
                      'Welcome to',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 18 : 22,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    
                    const SizedBox(height: 6),
                    
                    Text(
                      'Lingo Voice Banking',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 22 : 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    const SizedBox(height: 12),
                    
                    Text(
                      'Experience banking with the power of voice',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 13 : 15,
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    SizedBox(height: isSmallScreen ? 25 : 40),
                    
                    // Login Card
                    Container(
                      padding: EdgeInsets.all(isSmallScreen ? 18 : 22),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Enter Mobile Number',
                              style: TextStyle(
                                fontSize: isSmallScreen ? 16 : 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                            ),
                            
                            const SizedBox(height: 6),
                            
                            Text(
                              'We\'ll send you an OTP to verify your number',
                              style: TextStyle(
                                fontSize: isSmallScreen ? 11 : 13,
                                color: Colors.grey[600],
                              ),
                            ),
                            
                            SizedBox(height: isSmallScreen ? 18 : 22),
                            
                            // Mobile Input Field
                            TextFormField(
                              controller: _controller,
                              keyboardType: TextInputType.phone,
                              validator: _validateMobile,
                              decoration: InputDecoration(
                                labelText: 'Mobile Number',
                                hintText: 'Enter your 10-digit mobile number',
                                prefixIcon: const Icon(Icons.phone, color: Colors.blue),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey[300]!),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey[300]!),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.red),
                                ),
                                filled: true,
                                fillColor: Colors.grey[50],
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 14,
                                ),
                              ),
                            ),
                            
                            SizedBox(height: isSmallScreen ? 18 : 22),
                            
                            // Submit Button
                            SizedBox(
                              width: double.infinity,
                              height: isSmallScreen ? 44 : 50,
                              child: ElevatedButton(
                                onPressed: _isLoading ? null : _submitNumber,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue[600],
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  disabledBackgroundColor: Colors.grey[400],
                                ),
                                child: _isLoading
                                    ? const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                        ),
                                      )
                                    : Text(
                                        'Send OTP',
                                        style: TextStyle(
                                          fontSize: isSmallScreen ? 13 : 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    SizedBox(height: isSmallScreen ? 15 : 25),
                    
                    // Features Section - Only show on larger screens
                    if (!isSmallScreen) ...[
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Why Choose Voice Banking?',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            
                            const SizedBox(height: 12),
                            
                            Row(
                              children: [
                                Expanded(
                                  child: _buildFeatureItem(
                                    Icons.mic,
                                    'Voice Commands',
                                    'Control with your voice',
                                  ),
                                ),
                                Expanded(
                                  child: _buildFeatureItem(
                                    Icons.security,
                                    'Secure',
                                    'Bank-grade security',
                                  ),
                                ),
                              ],
                            ),
                            
                            const SizedBox(height: 10),
                            
                            Row(
                              children: [
                                Expanded(
                                  child: _buildFeatureItem(
                                    Icons.language,
                                    'Multi-language',
                                    'Support for 10+ languages',
                                  ),
                                ),
                                Expanded(
                                  child: _buildFeatureItem(
                                    Icons.speed,
                                    'Fast',
                                    'Quick transactions',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 25),
                    ],
                    
                    // Footer
                    Text(
                      'Powered by AI Technology',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ),
                    
                    const SizedBox(height: 15),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String subtitle) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 9,
            color: Colors.white.withValues(alpha: 0.8),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
