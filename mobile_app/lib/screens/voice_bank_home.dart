import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../l10n/app_localizations.dart';
import '../widgets/language_toggle_widget.dart';
import '../bloc/voice_bloc.dart';
import '../models/voice_intent.dart';
import '../widgets/speaking_indicator.dart';

class VoiceBankHome extends StatefulWidget {
  const VoiceBankHome({super.key});

  @override
  State<VoiceBankHome> createState() => _VoiceBankHomeState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _VoiceBankHomeState? state =
    context.findAncestorStateOfType<_VoiceBankHomeState>();
    state?.setLocale(newLocale);
  }
}

class _VoiceBankHomeState extends State<VoiceBankHome> {
  final ScrollController _scrollController = ScrollController();
  bool _highlightBalance = false;

  // Mock data
  final balance = "₹12,500.50";
  final contacts = {"Ananya": "ananya@upi", "Rajiv": "rajiv@upi"};
  final transactions = const [
    {"date": "2025-01-15", "desc": "Amazon Purchase", "amount": "-₹1,200", "type": "debit", "category": "shopping"},
    {"date": "2025-01-15", "desc": "Electricity Bill", "amount": "-₹2,500", "type": "debit", "category": "bills"},
    {"date": "2025-01-14", "desc": "Salary Credit", "amount": "+₹50,000", "type": "credit", "category": "salary"},
    {"date": "2025-01-13", "desc": "Swiggy Order", "amount": "-₹800", "type": "debit", "category": "food"},
    {"date": "2025-01-12", "desc": "UPI Transfer", "amount": "-₹5,000", "type": "debit", "category": "transfer"},
    {"date": "2025-01-11", "desc": "ATM Withdrawal", "amount": "-₹2,000", "type": "debit", "category": "cash"},
    {"date": "2025-01-10", "desc": "Interest Credit", "amount": "+₹150", "type": "credit", "category": "interest"},
  ];

  void setLocale(Locale locale) {
    setState(() {});
  }

  void _handleIntent(Understood st) {
    final name = st.intent.name;

    if (name == "get_balance") {
      setState(() => _highlightBalance = true);
      Future.delayed(
        const Duration(seconds: 2),
        () => setState(() => _highlightBalance = false),
      );
    } else if (name == "recent_txn") {
      Future.delayed(const Duration(milliseconds: 300), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      });
    } else if (name == "pay_person") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Payment initiated 🚀"),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'shopping':
        return Icons.shopping_bag;
      case 'bills':
        return Icons.receipt_long;
      case 'salary':
        return Icons.account_balance_wallet;
      case 'food':
        return Icons.restaurant;
      case 'transfer':
        return Icons.swap_horiz;
      case 'cash':
        return Icons.atm;
      case 'interest':
        return Icons.trending_up;
      default:
        return Icons.payment;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'shopping':
        return Colors.purple;
      case 'bills':
        return Colors.orange;
      case 'salary':
        return Colors.green;
      case 'food':
        return Colors.red;
      case 'transfer':
        return Colors.blue;
      case 'cash':
        return Colors.brown;
      case 'interest':
        return Colors.teal;
      default:
        return Colors.grey;
    }
  }

  void _logout() async {
    // Show confirmation dialog
    final bool? shouldLogout = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.logout),
          content: Text(AppLocalizations.of(context)!.logoutConfirm),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(AppLocalizations.of(context)!.logout),
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
            ),
          ],
        );
      },
    );

    if (shouldLogout == true) {
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.logoutSuccess),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );

      // Navigate back to landing screen and clear all previous routes
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    }
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
        backgroundColor:const Color(0xFF667eea),
        elevation: 0,
        actions: [
          LanguageToggleWidget(),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (String value) {
              if (value == 'logout') {
                _logout();
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.red[600]),
                    const SizedBox(width: 8),
                    Text(
                      AppLocalizations.of(context)!.logout,
                      style: TextStyle(color: Colors.red[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              // const Color(0xFF667eea), // Soft blue-purple
              // const Color(0xFF764ba2), // Purple
              // const Color(0xFFf093fb), // Pink
              // const Color(0xFFf5576c), // Coral
              // const Color(0xFF4facfe), // Light blue
                   const Color(0xFF667eea),
                    const Color(0xFF667eea),
              const Color(0xFF667eea), // Soft blue-purple
              const Color(0xFF764ba2), // Purple
              const Color(0xFFf093fb), // Pink
              //const Color(0xFFf5576c), // Coral
            ],
            stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
          ),
        ),
        child: SafeArea(          child: Column(
            children: [
              // Header Section
              Container(
                padding: isSmallScreen? EdgeInsets.fromLTRB(16, 0, 16, 16) : EdgeInsets.fromLTRB(24, 10, 24, 16),//EdgeInsets.all(isSmallScreen ? 16 : 20),
                child: Column(
                  children: [
                   // SizedBox(height: isSmallScreen ? 10 : 20),
                    
                    // Welcome Message
                    Text(
                      'Welcome back! 👋',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 18 : 22,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    
                    const SizedBox(height: 8),
                    
                    Text(
                      'Your voice banking dashboard',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 14 : 16,
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Main Content
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Balance Card
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(isSmallScreen ? 20 : 24),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.green[400]!, Colors.green[600]!],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green.withValues(alpha: 0.3),
                                blurRadius: 15,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.account_balance_wallet,
                                    color: Colors.white,
                                    size: isSmallScreen ? 20 : 24,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    AppLocalizations.of(context)!.curBalance,
                                    style: TextStyle(
                                      fontSize: isSmallScreen ? 14 : 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white.withValues(alpha: 0.9),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                balance,
                                style: TextStyle(
                                  fontSize: isSmallScreen ? 28 : 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Available Balance',
                                style: TextStyle(
                                  fontSize: isSmallScreen ? 12 : 14,
                                  color: Colors.white.withValues(alpha: 0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        SizedBox(height: isSmallScreen ? 10 : 14),
                        
                        // Quick Actions
                        // Text(
                        //   'Quick Actions',
                        //   style: TextStyle(
                        //     fontSize: isSmallScreen ? 18 : 20,
                        //     fontWeight: FontWeight.bold,
                        //     color: Colors.grey[800],
                        //   ),
                        // ),
                        
                       // const SizedBox(height: 12),
                        
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: _buildQuickAction(
                        //         Icons.send,
                        //         'Send Money',
                        //         Colors.blue,
                        //         () => _showSnackBar('Send Money feature coming soon!'),
                        //       ),
                        //     ),
                        //     const SizedBox(width: 12),
                        //     Expanded(
                        //       child: _buildQuickAction(
                        //         Icons.qr_code_scanner,
                        //         'Scan & Pay',
                        //         Colors.purple,
                        //         () => _showSnackBar('Scan & Pay feature coming soon!'),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        
                        //const SizedBox(height: 12),
                        
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: _buildQuickAction(
                        //         Icons.account_balance,
                        //         'Pay Bills',
                        //         Colors.orange,
                        //         () => _showSnackBar('Pay Bills feature coming soon!'),
                        //       ),
                        //     ),
                        //     const SizedBox(width: 12),
                        //     Expanded(
                        //       child: _buildQuickAction(
                        //         Icons.history,
                        //         'Transaction History',
                        //         Colors.teal,
                        //         () => _scrollController.animateTo(
                        //           _scrollController.position.maxScrollExtent,
                        //           duration: const Duration(seconds: 1),
                        //           curve: Curves.easeInOut,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        
                       // SizedBox(height: isSmallScreen ? 24 : 30),
                        
                        // Recent Transactions Header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.recTxns,
                              style: TextStyle(
                                fontSize: isSmallScreen ? 18 : 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                            ),
                            TextButton(
                              onPressed: () => _showSnackBar('View all transactions'),
                              child: Text(
                                'View All',
                                style: TextStyle(
                                  fontSize: isSmallScreen ? 12 : 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[600],
                                ),
                              ),
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 12),
                        
                        // Transactions List
                        ...transactions.take(5).map((tx) => _buildTransactionItem(tx, isSmallScreen)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      
      // Enhanced Floating Action Button
      floatingActionButton: BlocBuilder<VoiceBloc, VoiceState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Voice Status Indicator
              if (state is Listening || state is Transcribing)
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (state is Listening) ...[
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Listening...',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.red[600],
                          ),
                        ),
                      ] else if (state is Transcribing) ...[
                        const SizedBox(
                          width: 12,
                          height: 12,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Transcribing...',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[600],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              
              // Main Voice Button
              FloatingActionButton.extended(
                onPressed: () {
                  final bloc = context.read<VoiceBloc>();
                  if (state is Idle) {
                    bloc.add(StartListening());
                  } else if (state is Listening) {
                    bloc.add(StopListening(locale: Localizations.localeOf(context).languageCode));
                  } else {
                    bloc.add(Reset());
                  }
                },
                backgroundColor: state is Listening ? Colors.red[600] : Colors.blue[600],
                icon: Icon(
                  state is Listening ? Icons.stop : Icons.mic,
                  color: Colors.white,
                ),
                label: Text(
                  state is Listening ? 'Stop' : 'Voice',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildQuickAction(IconData icon, String title, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem(Map<String, String> transaction, bool isSmallScreen) {
    final isDebit = transaction['type'] == 'debit';
    final category = transaction['category']!;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _getCategoryColor(category).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              _getCategoryIcon(category),
              color: _getCategoryColor(category),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction['desc']!,
                  style: TextStyle(
                    fontSize: isSmallScreen ? 14 : 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  transaction['date']!,
                  style: TextStyle(
                    fontSize: isSmallScreen ? 11 : 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Text(
            transaction['amount']!,
            style: TextStyle(
              fontSize: isSmallScreen ? 14 : 16,
              fontWeight: FontWeight.bold,
              color: isDebit ? Colors.red[600] : Colors.green[600],
            ),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.blue[600],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
