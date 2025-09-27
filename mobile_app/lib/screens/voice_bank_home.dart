import 'dart:math';
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

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    // Load from shared preferences and load transactions for home screen display
    _loadCustomerName();
    _loadBalanceFromPrefs();
    await _loadTransactions();
  }

  void _loadBalanceFromPrefs() {
    // Load balance from shared preferences (set by voice transcribe-intent API)
    final balance = SharedPreferencesService.getBalance();
    setState(() {
      _balance = balance != null ? "₹${balance}" : "₹0.00";
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
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, '/FAQ'),
            tooltip: 'FAQ',
          ),
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
                                      color:
                                          Colors.white.withOpacity(0.9),
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
          } else if (state is Executing) {
            // Refresh balance and customer name from shared preferences (updated by voice bloc)
            _loadBalanceFromPrefs();
            _loadCustomerName();
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Session ID: ${sessionId.substring(0, 8)}...',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
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

    if (state is Listening) {
      return Text(
        loc.stop,
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
        loc.voice,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  Widget _buildAnimatedVoiceButton(VoiceState state, BuildContext context) {
    if (state is Listening) {
      return _buildPulsingButton(state, context);
    } else {
      return FloatingActionButton.extended(
        onPressed: () {
          final bloc = context.read<VoiceBloc>();
          if (state is Idle) {
            bloc.add(StartListening());
          } else if (state is Listening) {
            bloc.add(StopListening(
                locale: Localizations.localeOf(context).languageCode));
          } else {
            bloc.add(Reset());
          }
        },
        backgroundColor: _getButtonColor(state),
        icon: _buildButtonIcon(state),
        label: _buildButtonLabel(state, context),
      );
    }
  }

  Widget _buildPulsingButton(VoiceState state, BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1000),
      tween: Tween<double>(begin: 0.0, end: 1.0),
      onEnd: () {
        // Restart animation for continuous pulsing
        if (state is Listening) {
          (context as Element).markNeedsBuild();
        }
      },
      builder: (context, value, child) {
        final pulseValue =
            sin(value * 2 * pi) * 0.5 + 0.5; // Sine wave for smooth pulsing
        return Transform.scale(
          scale: 1.0 + (pulseValue * 0.1),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.3 * pulseValue),
                  blurRadius: 20 * pulseValue,
                  spreadRadius: 5 * pulseValue,
                ),
                BoxShadow(
                  color: Colors.red.withOpacity(0.1 * pulseValue),
                  blurRadius: 40 * pulseValue,
                  spreadRadius: 10 * pulseValue,
                ),
              ],
            ),
            child: FloatingActionButton.extended(
              onPressed: () {
                final bloc = context.read<VoiceBloc>();
                if (state is Idle) {
                  bloc.add(StartListening());
                } else if (state is Listening) {
                  bloc.add(StopListening(
                      locale: Localizations.localeOf(context).languageCode));
                } else {
                  bloc.add(Reset());
                }
              },
              backgroundColor: _getButtonColor(state),
              icon: _buildButtonIcon(state),
              label: _buildButtonLabel(state, context),
            ),
          ),
        );
      },
    );
  }
}
