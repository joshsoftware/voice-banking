class Actionables {
  String action;
  List<String> keywords;
  List<String> properties;

  Actionables({required this.action, required this.keywords, required this.properties});
}

List<Actionables> supportedActions = [
  Actionables(
      action: 'Money Transfer',
      keywords: ['transfer', 'send money', 'give money', 'send'],
      properties: ['amount', 'recipient']
  ),
  Actionables(
      action: 'Balance Check',
      keywords: ['account balance', 'balance', 'balance check'],
      properties: []
  ),
  Actionables(
      action: 'Show Transactions',
      keywords: ['show last transaction', 'last transaction', 'last transactions', 'transaction history'],
      properties: []
  ),
  Actionables(
      action: 'Scan and Pay',
      keywords: ['scan and pay', 'scan qr', 'qr payment', 'pay using qr'],
      properties: []
  ),
  Actionables(
      action: 'Check Account Details',
      keywords: ['account details', 'check account', 'account info', 'details of account', 'account number'],
      properties: []
  )
];

