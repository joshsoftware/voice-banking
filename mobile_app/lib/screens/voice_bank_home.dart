import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../l10n/app_localizations.dart';
import '../widgets/language_toggle_widget.dart';
import '../bloc/voice_bloc.dart';
import '../models/transaction.dart';
import '../services/shared_preferences_service.dart';
import '../services/banking_api.dart';

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
  List<Transaction> _transactions = [];
  bool _isLoadingTransactions = true;
  String? _balance;
  String? _customerName;
  bool _isRecording = false; // Track recording state locally
  bool _isHolding = false; // Track if user is holding the button
  Timer? _holdTimer; // Timer for hold duration
  double _holdProgress = 0.0; // Progress of hold (0.0 to 1.0)

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _holdTimer?.cancel();
    super.dispose();
  }

  Future<void> _loadData() async {
    // Load from shared preferences and load transactions for home screen display
    _loadCustomerName();
    _loadBalanceFromPrefs();
    await _loadTransactions();
  }

  Future<void> _loadRecentTransactionsFromPrefs() async {
    // Load recent transactions from shared preferences (set by voice transcribe-intent API)
    final recentTransactions = SharedPreferencesService.getRecentTransactions();

    if (recentTransactions.isNotEmpty) {
      // Convert to Transaction objects
      final transactions =
          recentTransactions.map((tx) => Transaction.fromJson(tx)).toList();
      setState(() {
        _transactions = transactions;
        _isLoadingTransactions = false;
      });
    }
  }

  void _loadBalanceFromPrefs() {
    // Load balance from shared preferences (set by voice transcribe-intent API)
    final balance = SharedPreferencesService.getBalance();
    print("DEBUG - Raw balance from SharedPreferences: '$balance'");
    setState(() {
      if (balance != null) {
        // Parse the balance as a double and format to 2 decimal places
        final balanceValue = double.tryParse(balance) ?? 0.0;
        _balance = "₹${balanceValue.toStringAsFixed(2)}";
        print("DEBUG - Formatted balance: '$_balance'");
      } else {
        _balance = "₹0.00";
        print("DEBUG - No balance found, using default: '$_balance'");
      }
    });
  }

  void _loadCustomerName() {
    final customerName = SharedPreferencesService.getCustomerName();
    setState(() {
      _customerName = customerName;
    });
  }

  Future<void> _loadTransactions() async {
    try {
      setState(() {
        _isLoadingTransactions = true;
      });

      final mobileNumber = SharedPreferencesService.getMobileNumber();

      if (mobileNumber != null) {
        // Import BankingAPI for transactions
        final BankingAPI bankingAPI = BankingAPI();
        final transactions = await bankingAPI.getTransactions(
          phone: mobileNumber,
          limit: 5, // Load only top 5 for home screen
        );

        setState(() {
          _transactions = transactions;
          _isLoadingTransactions = false;
        });
      } else {
        setState(() {
          _isLoadingTransactions = false;
        });
      }
    } catch (e) {
      print("Error loading transactions: $e");
      setState(() {
        _isLoadingTransactions = false;
      });
    }
  }

  void setLocale(Locale locale) {
    setState(() {});
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'shopping':
      case 'e-commerce':
        return Icons.shopping_bag;
      case 'bills':
      case 'utility':
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
      case 'e-commerce':
        return Colors.purple;
      case 'bills':
      case 'utility':
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
              child: Text(AppLocalizations.of(context)!.cancel),
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
      // Clear shared preferences
      await SharedPreferencesService.clearAll();

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.logoutSuccess),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );

      // Navigate back to landing screen and clear all previous routes
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.height < 700;

    return GestureDetector(
      onTap: () {
        // Dismiss keyboard when tapping outside input fields
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, '/FAQ'),
            tooltip: 'FAQ',
          ),
          LanguageToggleWidget(),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
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
        child: SafeArea(
          child: Column(
            children: [
              // Header Section
              Container(
                padding: isSmallScreen
                    ? EdgeInsets.fromLTRB(16, 0, 16, 16)
                    : EdgeInsets.fromLTRB(24, 10, 24,
                        16), //EdgeInsets.all(isSmallScreen ? 16 : 20),
                child: Column(
                  children: [
                    // SizedBox(height: isSmallScreen ? 10 : 20),

                    // Welcome Message
                    Text(
                      _customerName != null
                          ? "${AppLocalizations.of(context)!.welcomeBack}, $_customerName!"
                          : AppLocalizations.of(context)!.welcomeBack,
                      style: TextStyle(
                        fontSize: isSmallScreen ? 18 : 22,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      AppLocalizations.of(context)!.voiceBankingDashboard,
                      style: TextStyle(
                        fontSize: isSmallScreen ? 14 : 16,
                        color: Colors.white.withOpacity(0.9),
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
                                color: Colors.green.withOpacity(0.3),
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
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                _balance ?? "₹0.00",
                                style: TextStyle(
                                  fontSize: isSmallScreen ? 28 : 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                AppLocalizations.of(context)!.availableBalance,
                                style: TextStyle(
                                  fontSize: isSmallScreen ? 12 : 14,
                                  color: Colors.white.withOpacity(0.8),
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
                          children: [
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context)!.recTxns,
                                style: TextStyle(
                                  fontSize: isSmallScreen ? 18 : 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, '/AllTransactions'),
                              child: Text(
                                AppLocalizations.of(context)!.viewAll,
                                style: TextStyle(
                                  fontSize: isSmallScreen ? 12 : 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[600],
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // Transactions List
                        Builder(
                          builder: (context) {
                            if (_isLoadingTransactions) {
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else if (_transactions.isEmpty) {
                              return Container(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .noTransactionsFound,
                                  style: TextStyle(
                                    fontSize: isSmallScreen ? 14 : 16,
                                    color: Colors.grey[600],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            } else {
                              return Column(
                                children: _transactions
                                    .map((tx) => _buildTransactionItem(
                                        tx, isSmallScreen))
                                    .toList(),
                              );
                            }
                          },
                        ),
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
      floatingActionButton: BlocListener<VoiceBloc, VoiceState>(
        listener: (context, state) {
          if (state is ShowTransactionsDialog) {
            _showTransactionsDialog(
                context, state.message, state.transactions, state.sessionId);
          } else if (state is ShowOtpDialog) {
            _showOtpDialog(context, state.message, state.sessionId,
                state.recipient, state.amount);
          } else if (state is ShowDuplicateDialog) {
            _showDuplicateDialog(
                context, state.message, state.sessionId, state.beneficiaries,
                originalAmount: state.originalAmount);
          } else if (state is ShowBeneficiariesDialog) {
            _showBeneficiariesDialog(
                context, state.message, state.beneficiaries, state.sessionId);
          } else if (state is Executing) {
            // Refresh balance, customer name, and recent transactions from shared preferences (updated by voice bloc)
            _loadBalanceFromPrefs();
            _loadCustomerName();
            _loadRecentTransactionsFromPrefs();
          } else if (state is Listening) {
            setState(() {
              _isRecording = true;
              _isHolding = false; // Stop holding when recording starts
            });
          } else if (state is Transcribing || state is Idle) {
            setState(() {
              _isRecording = false;
              _isHolding = false;
              _holdProgress = 0.0;
            });
          }
        },
        child: BlocBuilder<VoiceBloc, VoiceState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Main Voice Button
                _buildAnimatedVoiceButton(state, context),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTransactionItem(Transaction transaction, bool isSmallScreen) {
    final isDebit = transaction.type == 'debit';
    final category = transaction.category;

    String _formatDate(String dateString) {
      try {
        final date = DateTime.parse(dateString);
        return '${date.day}/${date.month}/${date.year}';
      } catch (e) {
        return dateString;
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
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
              color: _getCategoryColor(category).withOpacity(0.1),
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
                  transaction.merchant,
                  style: TextStyle(
                    fontSize: isSmallScreen ? 14 : 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _formatDate(transaction.date),
                  style: TextStyle(
                    fontSize: isSmallScreen ? 11 : 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Text(
            transaction.formattedAmount,
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

  void _showTransactionsDialog(BuildContext context, String message,
      List<Map<String, dynamic>> transactions, String sessionId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
              maxWidth: MediaQuery.of(context).size.width * 0.9,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue[600]!, Colors.blue[800]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.account_balance_wallet,
                        color: Colors.white,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Transaction Details',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                // Message
                if (message.isNotEmpty)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    color: Colors.grey[100],
                    child: Text(
                      message,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[800],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                // Transactions List
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = transactions[index];
                      final isDebit =
                          transaction['transaction_type'] == 'debit';
                      final amount = transaction['amount']?.toDouble() ?? 0.0;
                      final recipient = transaction['recipient'] ?? 'Unknown';
                      final category = transaction['category'] ?? 'other';
                      final date = transaction['transaction_date'] ?? '';
                      final referenceId = transaction['reference_id'] ?? '';

                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[200]!),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: _getCategoryColor(category)
                                    .withOpacity(0.1),
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
                                    recipient,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    _formatTransactionDate(date),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  if (referenceId.isNotEmpty) ...[
                                    const SizedBox(height: 2),
                                    Text(
                                      'Ref: $referenceId',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${isDebit ? '-' : '+'}₹${amount.abs().toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isDebit
                                        ? Colors.red[600]
                                        : Colors.green[600],
                                  ),
                                ),
                                Text(
                                  isDebit ? 'Debit' : 'Credit',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // Footer
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          'Close',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _formatTransactionDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return dateString;
    }
  }

  Color _getButtonColor(VoiceState state) {
    if (state is Listening) {
      return Colors.red[600]!;
    } else if (state is Transcribing) {
      return Colors.orange[600]!;
    } else if (state is Executing) {
      return Colors.purple[600]!;
    } else {
      return Colors.blue[600]!;
    }
  }

  Widget _buildButtonIcon(VoiceState state) {
    if (state is Listening) {
      return const Icon(Icons.stop, color: Colors.white);
    } else if (state is Transcribing) {
      return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else if (state is Executing) {
      return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return const Icon(Icons.mic, color: Colors.white);
    }
  }

  Widget _buildButtonLabel(VoiceState state, BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    if (_isHolding && !_isRecording) {
      return Text(
        "Hold... ${(0.1 - (_holdProgress * 0.1)).toStringAsFixed(1)}s",
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (state is Listening) {
      return Text(
        "Release to Stop",
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (state is Transcribing) {
      return Text(
        loc.transcribing,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (state is Executing) {
      return Text(
        loc.executing,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return Text(
        "Hold to Speak",
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  Widget _buildAnimatedVoiceButton(VoiceState state, BuildContext context) {
    return _buildHoldToSpeakButton(state, context);
  }

  Widget _buildHoldToSpeakButton(VoiceState state, BuildContext context) {
    return GestureDetector(
      onPanDown: (_) {
        _startHold();
      },
      onPanEnd: (_) {
        _endHold();
      },
      onPanCancel: () {
        _endHold();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: _getButtonColor(state).withOpacity(0.3),
              blurRadius: 15,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Stack(
          children: [
            // Progress indicator
            if (_isHolding && !_isRecording)
              Positioned.fill(
                child: CircularProgressIndicator(
                  value: _holdProgress,
                  strokeWidth: 4,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  backgroundColor: Colors.white.withOpacity(0.3),
                ),
              ),
            // Button
            FloatingActionButton.extended(
              onPressed: null, // Disable tap, only use gesture
              backgroundColor: _getButtonColor(state),
              icon: _buildButtonIcon(state),
              label: _buildButtonLabel(state, context),
            ),
          ],
        ),
      ),
    );
  }

  void _startHold() {
    if (_isHolding || _isRecording) return;

    setState(() {
      _isHolding = true;
      _holdProgress = 0.0;
    });

    // Start timer for 0.1 seconds
    _holdTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        _holdProgress = (timer.tick * 50) / 100.0; // 0.1 seconds = 100ms
      });

      if (_holdProgress >= 1.0) {
        // 0.1 seconds completed, start recording
        timer.cancel();
        _startRecording();
      }
    });
  }

  void _endHold() {
    _holdTimer?.cancel();

    if (_isRecording) {
      // Stop recording
      final bloc = context.read<VoiceBloc>();
      bloc.add(
          StopListening(locale: Localizations.localeOf(context).languageCode));
    }

    setState(() {
      _isHolding = false;
      _holdProgress = 0.0;
    });
  }

  void _startRecording() {
    if (_isRecording) return;

    final bloc = context.read<VoiceBloc>();
    bloc.add(StartListening());
  }

  void _showOtpDialog(BuildContext context, String message, String sessionId,
      String recipient, double amount) {
    final TextEditingController otpController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    bool isLoading = false;
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.height < 700;
    final isVerySmallScreen = size.height < 600;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: isVerySmallScreen
                      ? MediaQuery.of(context).size.height * 0.85
                      : MediaQuery.of(context).size.height * 0.75,
                  maxWidth: MediaQuery.of(context).size.width * 0.95,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Header
                      Container(
                        padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFF667eea),
                              const Color(0xFF764ba2)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(isSmallScreen ? 6 : 8),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.security,
                                color: Colors.white,
                                size: isSmallScreen ? 20 : 24,
                              ),
                            ),
                            SizedBox(width: isSmallScreen ? 12 : 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'OTP Verification',
                                    style: TextStyle(
                                      fontSize: isSmallScreen ? 18 : 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  if (!isVerySmallScreen) ...[
                                    const SizedBox(height: 4),
                                    Text(
                                      'Secure your transaction',
                                      style: TextStyle(
                                        fontSize: isSmallScreen ? 12 : 14,
                                        color: Colors.white.withOpacity(0.9),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Transaction Details
                      Container(
                        margin: EdgeInsets.all(isSmallScreen ? 12 : 16),
                        padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey[200]!),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF667eea)
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    color: const Color(0xFF667eea),
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Recipient',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        recipient,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: isSmallScreen ? 12 : 16),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    Icons.account_balance_wallet,
                                    color: Colors.green[600],
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Amount',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        '₹${amount.toStringAsFixed(2)}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // OTP Input
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: isSmallScreen ? 12 : 16),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.all(isSmallScreen ? 16 : 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: Colors.grey[200]!),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.security,
                                          color: const Color(0xFF667eea),
                                          size: 24,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Enter OTP',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[800],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: isSmallScreen ? 12 : 16),
                                    TextFormField(
                                      controller: otpController,
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.done,
                                      onFieldSubmitted: (_) {
                                        if (formKey.currentState!.validate()) {
                                          setState(() {
                                            isLoading = true;
                                          });

                                          try {
                                            // Call the voice bloc to verify OTP
                                            final bloc = context.read<VoiceBloc>();
                                            bloc.add(VerifyOtp(
                                              otp: otpController.text.trim(),
                                              sessionId: sessionId,
                                              locale: Localizations.localeOf(context).languageCode,
                                            ));

                                            Navigator.of(context).pop();
                                          } catch (e) {
                                            setState(() {
                                              isLoading = false;
                                            });
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text('Error: ${e.toString()}'),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                          }
                                        }
                                      },
                                      textAlign: TextAlign.center,
                                      maxLength: 6,
                                      style: TextStyle(
                                        fontSize: isSmallScreen ? 20 : 24,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: isSmallScreen ? 6 : 8,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: '000000',
                                        hintStyle: TextStyle(
                                          fontSize: isSmallScreen ? 20 : 24,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: isSmallScreen ? 6 : 8,
                                          color: Colors.grey[400],
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                            color: const Color(0xFF667eea),
                                            width: 2,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                            color: Colors.grey[300]!,
                                            width: 1,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                            color: const Color(0xFF667eea),
                                            width: 2,
                                          ),
                                        ),
                                        counterText: '',
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 16,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter OTP';
                                        }
                                        if (value.length != 6) {
                                          return 'OTP must be 6 digits';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Enter the 6-digit OTP sent to your mobile',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: isSmallScreen ? 12 : 16),
                            ],
                          ),
                        ),
                      ),

                      // Buttons
                      Container(
                        padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: isSmallScreen ? 45 : 50,
                                child: OutlinedButton(
                                  onPressed: isLoading
                                      ? null
                                      : () {
                                          Navigator.of(context).pop();
                                        },
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                      color: Colors.grey[400]!,
                                      width: 1.5,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.bold,
                                      fontSize: isSmallScreen ? 12 : 14,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: isSmallScreen ? 8 : 12),
                            Expanded(
                              child: Container(
                                height: isSmallScreen ? 45 : 50,
                                child: ElevatedButton(
                                  onPressed: isLoading
                                      ? null
                                      : () async {
                                          if (formKey.currentState!
                                              .validate()) {
                                            setState(() {
                                              isLoading = true;
                                            });

                                            try {
                                              // Call the voice bloc to verify OTP
                                              final bloc =
                                                  context.read<VoiceBloc>();
                                              bloc.add(VerifyOtp(
                                                otp: otpController.text.trim(),
                                                sessionId: sessionId,
                                                locale: Localizations.localeOf(
                                                        context)
                                                    .languageCode,
                                              ));

                                              Navigator.of(context).pop();
                                            } catch (e) {
                                              setState(() {
                                                isLoading = false;
                                              });
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      'Error: ${e.toString()}'),
                                                  backgroundColor: Colors.red,
                                                ),
                                              );
                                            }
                                          }
                                        },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF667eea),
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: isLoading
                                      ? SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.white),
                                          ),
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.verified_user,
                                              size: isSmallScreen ? 16 : 18,
                                            ),
                                            SizedBox(
                                                width: isSmallScreen ? 4 : 6),
                                            Flexible(
                                              child: Text(
                                                isSmallScreen
                                                    ? 'Verify'
                                                    : 'Verify OTP',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      isSmallScreen ? 12 : 14,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showDuplicateDialog(BuildContext context, String message,
      String sessionId, List<Map<String, dynamic>> beneficiaries,
      {double? originalAmount}) {
    print("Duplicate Dialog Debug - originalAmount received: $originalAmount");
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.7,
              maxWidth: MediaQuery.of(context).size.width * 0.9,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue[600]!, Colors.blue[800]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.people,
                        color: Colors.white,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Duplicate Beneficiaries',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                // Message
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  color: Colors.grey[100],
                  child: Text(
                    message,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // Beneficiaries List
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: beneficiaries.length,
                    itemBuilder: (context, index) {
                      final beneficiary = beneficiaries[index];
                      final name = beneficiary['name'] ?? 'Unknown';
                      final accountNumber = beneficiary['account_number'] ?? '';
                      final bankName = beneficiary['bank_name'] ?? '';
                      final ifscCode = beneficiary['ifsc_code'] ?? '';

                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.blue[100],
                              child: Icon(
                                Icons.person,
                                color: Colors.blue[600],
                              ),
                            ),
                            title: Text(
                              name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Account: $accountNumber',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                if (bankName.isNotEmpty)
                                  Text(
                                    '$bankName • $ifscCode',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                              ],
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey[400],
                              size: 16,
                            ),
                            onTap: () async {
                              // Store references before closing dialog
                              final bloc = context.read<VoiceBloc>();
                              final voiceRepo = bloc.repo;
                              final currentLocale =
                                  Localizations.localeOf(context).languageCode;
                              final scaffoldMessenger =
                                  ScaffoldMessenger.of(context);

                              // Close dialog first
                              Navigator.of(context).pop();

                              // Show loading indicator
                              scaffoldMessenger.showSnackBar(
                                SnackBar(
                                  content: Row(
                                    children: [
                                      SizedBox(
                                        width: 16,
                                        height: 16,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.white),
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Text(
                                          'Processing beneficiary selection...'),
                                    ],
                                  ),
                                  backgroundColor: Colors.blue[600],
                                  duration: Duration(seconds: 2),
                                ),
                              );

                              // Call the voice repository to select duplicate beneficiary
                              try {
                                print(
                                    "Beneficiary Selection Debug - Selecting beneficiary: $name");
                                // Call the selectDuplicateBeneficiary method with only required parameters
                                final response =
                                    await voiceRepo.selectDuplicateBeneficiary(
                                  sessionId: sessionId,
                                  locale: currentLocale,
                                  beneficiaryName: name,
                                );

                                // Process the response through the voice bloc
                                bloc.add(
                                    GotTranscript(response, currentLocale));
                              } catch (error) {
                                print(
                                    "Error selecting duplicate beneficiary: $error");

                                // Show error message
                                scaffoldMessenger.showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Error selecting beneficiary. Please try again.'),
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 3),
                                  ),
                                );

                                // Reset the voice bloc to idle state
                                bloc.add(Reset());
                              }
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Instructions
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.touch_app,
                            color: Colors.blue[600],
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Tap on a beneficiary to select and continue with the transaction',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showBeneficiariesDialog(BuildContext context, String message,
      List<Map<String, dynamic>> beneficiaries, String sessionId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
              maxWidth: MediaQuery.of(context).size.width * 0.9,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.green[600]!, Colors.green[800]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.people,
                        color: Colors.white,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Beneficiaries List',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                // Message
                if (message.isNotEmpty)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    color: Colors.grey[100],
                    child: Text(
                      message,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[800],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                // Beneficiaries List
                Flexible(
                  child: beneficiaries.isEmpty
                      ? Container(
                          padding: const EdgeInsets.all(40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.people_outline,
                                size: 64,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'No beneficiaries found',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Add beneficiaries to your account to see them here',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[500],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: beneficiaries.length,
                          itemBuilder: (context, index) {
                            final beneficiary = beneficiaries[index];
                            final name = beneficiary['name'] ?? 'Unknown';
                            final accountNumber =
                                beneficiary['account_number'] ?? '';
                            final bankName = beneficiary['bank_name'] ?? '';
                            final ifscCode = beneficiary['ifsc_code'] ?? '';
                            final nickname = beneficiary['nickname'] ?? '';
                            final isActive = beneficiary['is_active'] ?? true;
                            final tag = beneficiary['tag'] ?? '';

                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 4),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isActive
                                      ? Colors.green[200]!
                                      : Colors.grey[300]!,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: isActive
                                          ? Colors.green[100]
                                          : Colors.grey[200],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Icon(
                                      Icons.person,
                                      color: isActive
                                          ? Colors.green[600]
                                          : Colors.grey[600],
                                      size: 24,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                name,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[800],
                                                ),
                                              ),
                                            ),
                                            if (isActive)
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 4),
                                                decoration: BoxDecoration(
                                                  color: Colors.green[100],
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Text(
                                                  'Active',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green[700],
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        if (nickname.isNotEmpty) ...[
                                          Text(
                                            'Nickname: $nickname',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                        ],
                                        Text(
                                          'Account: $accountNumber',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[700],
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          '$bankName • $ifscCode',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        if (tag.isNotEmpty) ...[
                                          const SizedBox(height: 4),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 2),
                                            decoration: BoxDecoration(
                                              color: Colors.blue[100],
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              tag,
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.blue[700],
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),

                // Footer
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          'Close',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
