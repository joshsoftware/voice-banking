import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tts/util/action.dart';
import 'package:tts/value/message.dart';

class ActionResultView extends StatelessWidget {
  ActionResultView({
    super.key,
    required this.actionable,
  });

  final BankingActionable actionable;
  final NumberFormat currencyFormat =
      NumberFormat.simpleCurrency(locale: "en-In");
  final DateFormat dateFormat = DateFormat.yMMMMd();

  String getActionTitleFromAction() {
    const Map<BankingAction, String> actionToActionTitleMap = {
      BankingAction.moneyTransfer: AppMessages.moneyTransferTitle,
      BankingAction.accountBalanceCheck: AppMessages.accountBalanceCheckTitle,
      BankingAction.loanEmiCheck: AppMessages.loanEmiCheckTitle,
      BankingAction.unsupported: ""
    };
    return actionToActionTitleMap[actionable.action] ?? "";
  }

  String getFormattedPrimaryDataTextAccordingToAction() {
    switch (actionable.action) {
      case BankingAction.moneyTransfer:
      case BankingAction.accountBalanceCheck:
      case BankingAction.loanEmiCheck:
        final String formattedData =
            currencyFormat.format(actionable.amount ?? -1);
        return formattedData;

      case BankingAction.unsupported:
        return "Unsupported";
    }
  }

  String getFormattedSecondaryDataTextAccordingToAction() {
    switch (actionable.action) {
      case BankingAction.moneyTransfer:
        return '${AppMessages.moneyTransferSubtitleSuffix} ${actionable.recipient}';

      case BankingAction.accountBalanceCheck:
        return '${AppMessages.accountBalanceCheckSuffix} ${dateFormat.format(DateTime.now())}';

      case BankingAction.loanEmiCheck:
        //TODO: Take date from somewhere
        return '${AppMessages.loanEmiCheckSuffix} ${dateFormat.format(DateTime.now())}';

      case BankingAction.unsupported:
        return "Unsupported";
    }
  }

  String getActionCTALabelFromAction() {
    const Map<BankingAction, String> actionToActionTitleMap = {
      BankingAction.moneyTransfer: AppMessages.moneyTransferCTALabel,
      BankingAction.accountBalanceCheck:
          AppMessages.accountBalanceCheckCTALabel,
      BankingAction.loanEmiCheck: AppMessages.loanEmiCheckCTALabel,
      BankingAction.unsupported: "OK"
    };
    return actionToActionTitleMap[actionable.action] ?? "";
  }

  void onCTAPerformed(final BuildContext context) {
    switch (actionable.action) {
      case BankingAction.moneyTransfer:
        Navigator.of(context).pop();
        //TODO: Show transaction result
        return;

      case BankingAction.accountBalanceCheck:
      case BankingAction.loanEmiCheck:
      case BankingAction.unsupported:
        return Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Banking'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Action
            Text(
              getActionTitleFromAction(),
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white70,
              ),
            ),
            // Primary Data
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                getFormattedPrimaryDataTextAccordingToAction(),
                style: const TextStyle(
                  fontSize: 42,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // Secondary Data (opt)
            Text(
              getFormattedSecondaryDataTextAccordingToAction(),
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white70,
              ),
            ),
            // CTA (Confirmation or Dismiss)
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: MaterialButton(
                onPressed: () => onCTAPerformed(context),
                color: Colors.green,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 32.0,
                ),
                child: Text(
                  getActionCTALabelFromAction(),
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
