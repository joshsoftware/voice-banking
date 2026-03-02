import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/models.dart' as models;
import '../services/voice_repository.dart';
import '../services/banking_api.dart';
import '../services/tts_service.dart';
import '../services/shared_preferences_service.dart';
import '../services/translation_service.dart';
import '../models/voice_intent.dart';

sealed class VoiceState {}

class Idle extends VoiceState {}

class Listening extends VoiceState {}

class Transcribing extends VoiceState {}

class Understood extends VoiceState {
  final models.Intent intent;
  Understood(this.intent);
}

class Executing extends VoiceState {
  final String message;
  final VoiceIntent intent;
  Executing(this.message, this.intent);
}

class ShowTransactionsDialog extends VoiceState {
  final String message;
  final List<Map<String, dynamic>> transactions;
  final String sessionId;
  ShowTransactionsDialog(this.message, this.transactions, this.sessionId);
}

class ShowOtpDialog extends VoiceState {
  final String message;
  final String sessionId;
  final String recipient;
  final double amount;
  ShowOtpDialog(this.message, this.sessionId, this.recipient, this.amount);
}

class ShowDuplicateDialog extends VoiceState {
  final String message;
  final String sessionId;
  final List<Map<String, dynamic>> beneficiaries;
  final double? originalAmount;
  ShowDuplicateDialog(this.message, this.sessionId, this.beneficiaries,
      {this.originalAmount});
}

class ShowBeneficiariesDialog extends VoiceState {
  final String message;
  final List<Map<String, dynamic>> beneficiaries;
  final String sessionId;
  ShowBeneficiariesDialog(this.message, this.beneficiaries, this.sessionId);
}

/// Emitted when the user recorded but said nothing (empty/silent audio).
class RecordingEmpty extends VoiceState {}

/// Emitted when voice validation fails (1st or 2nd consecutive failure).
class VoiceValidationFailed extends VoiceState {
  final int consecutiveFailures;
  final String message;
  VoiceValidationFailed(this.consecutiveFailures, this.message);
}

/// Emitted when user is locked out due to too many failed voice validation attempts.
class VoiceLockout extends VoiceState {
  final DateTime lockoutUntil;
  final String message;
  VoiceLockout(this.lockoutUntil, this.message);
}

sealed class VoiceEvent {}

class StartListening extends VoiceEvent {
  final String locale;
  final String sessionId;
  StartListening({required this.locale, required this.sessionId});
}

class StopListening extends VoiceEvent {
  final String locale;
  final String sessionId;
  /// Snapshot of the active request ID at the moment this event was created.
  /// Used to detect stale events that arrived after a cancel/restart.
  final int requestId;
  StopListening({required this.locale, required this.sessionId, required this.requestId});
}

class GotTranscript extends VoiceEvent {
  final Map<String, dynamic> data;
  final String locale;
  /// Snapshot of the active request ID when this transcript was requested.
  final int requestId;
  GotTranscript(this.data, this.locale, this.requestId);
}

class Reset extends VoiceEvent {}

/// Fired when user said nothing for initial silence duration (e.g. first 5s).
class InitialSilence extends VoiceEvent {
  final String locale;
  InitialSilence({required this.locale});
}

class VerifyOtp extends VoiceEvent {
  final String otp;
  final String sessionId;
  final String locale;
  VerifyOtp({required this.otp, required this.sessionId, required this.locale});
}

/// User confirmed they want to stop voice banking; stop recording, TTS, timers and reset to Idle.
class CancelVoiceSession extends VoiceEvent {}

class VoiceBloc extends Bloc<VoiceEvent, VoiceState> {
  final VoiceRepository repo;
  final BankingAPI bank = BankingAPI();
  final TTSService tts = TTSService();
  String _currentLocale = 'en'; // Track current locale
  /// BuildContext of the currently shown dialog (excluding logout). Cleared when dialog is closed or when user speaks and we pop it.
  BuildContext? currentDialogContext;

  /// Monotonically-increasing counter. Each new voice session gets a unique ID.
  /// Any async handler that captured an older ID must abort when it resumes,
  /// because a newer session has since started (or the session was cancelled).
  int _activeRequestId = 0;

  /// Public read-only access to the current active request ID.
  /// Use this when constructing a [GotTranscript] event from outside the bloc
  /// (e.g. after a user-initiated action like selecting a duplicate beneficiary).
  int get activeRequestId => _activeRequestId;

  /// Cancel token for the currently in-flight Dio transcribe request.
  /// Cancelled whenever a new session starts or the user cancels.
  CancelToken? _activeCancelToken;

  /// Public read-only access to the current cancel token.
  /// Use this when making a repository call from outside the bloc (e.g. UI)
  /// so it participates in the same cancellation lifecycle as the active session.
  CancelToken? get activeCancelToken => _activeCancelToken;

  VoiceBloc(this.repo) : super(Idle()) {
    on<StartListening>((e, emit) async {
      // Invalidate any in-flight request from a previous session.
      _activeRequestId++;
      _activeCancelToken?.cancel('New voice session started');
      _activeCancelToken = null;

      try {
        final myRequestId = _activeRequestId;
        await repo.start(
          onIdle: () {
            if (_activeRequestId == myRequestId) {
              add(StopListening(locale: e.locale, sessionId: e.sessionId, requestId: myRequestId));
            }
          },
          idleDuration: const Duration(seconds: 2),
          onInitialSilence: () {
            if (_activeRequestId == myRequestId) {
              add(InitialSilence(locale: e.locale));
            }
          },
          initialSilenceDuration: const Duration(seconds: 12),
          onSilenceReminder: () async {
            if (_activeRequestId != myRequestId) return;
            final message = TranslationService.translateResponse(
                'empty_recording', e.locale, null);
            if (_activeRequestId != myRequestId) return;
            try {
              await tts.speak(message, langCode: e.locale);
            } catch (e) {
              print("TTS Error: $e");
            }
            if (_activeRequestId != myRequestId) return;
          },
          silenceReminderDuration: const Duration(seconds: 5),
        );
        emit(Listening());
      } catch (e) {
        print("Voice Bloc Error - Permission denied: $e");
        emit(Idle());
      }
    });

    on<InitialSilence>((e, emit) async {
      try {
        await repo.stopWithoutTranscribe();
      } catch (err) {
        print("Voice Bloc Error - stopWithoutTranscribe: $err");
      }
      emit(Idle());
    });

    on<CancelVoiceSession>((e, emit) async {
      // Invalidate any in-flight request so its async continuations abort.
      _activeRequestId++;
      _activeCancelToken?.cancel('User cancelled voice session');
      _activeCancelToken = null;
      try {
        await repo.stopWithoutTranscribe();
      } catch (err) {
        print("Voice Bloc Error - stopWithoutTranscribe on cancel: $err");
      }
      try {
        await tts.stop();
      } catch (err) {
        print("TTS stop on cancel: $err");
      }
      emit(Idle());
    });

    on<StopListening>((e, emit) async {
      // Abort if this event belongs to a superseded session.
      if (e.requestId != _activeRequestId) return;

      emit(Transcribing());
      _currentLocale = e.locale;

      // Create a cancel token for this specific HTTP request so it can be
      // aborted if the user cancels or starts a new session mid-flight.
      final cancelToken = CancelToken();
      _activeCancelToken = cancelToken;

      print("Voice Bloc Debug - Processing normal voice input");
      try {
        final data = await repo.stopAndTranscribe(
          locale: e.locale,
          sessionId: e.sessionId,
          cancelToken: cancelToken,
          ifNotEmptyCallback: () {
            if (currentDialogContext != null && currentDialogContext!.mounted) {
              Navigator.of(currentDialogContext!).pop();
              currentDialogContext = null;
            }
          },
        );

        // Guard: session may have been cancelled while the HTTP call was in-flight.
        if (e.requestId != _activeRequestId) return;

        add(GotTranscript(data, e.locale, e.requestId));
      } on EmptyRecordingException catch (_) {
        if (e.requestId != _activeRequestId) return;
        emit(RecordingEmpty());
        add(Reset());
      } on VoiceValidationFailedException catch (ve) {
        if (e.requestId != _activeRequestId) return;
        final messageKey = 'voice_validation_failed';
        final message = TranslationService.translateResponse(
          messageKey,
          e.locale,
          null,
        );
        if (e.requestId == _activeRequestId) {
          try {
            await tts.speak(message, langCode: e.locale);
          } catch (err) {
            print("TTS Error on voice validation failed: $err");
          }
        }
        if (e.requestId != _activeRequestId) return;
        emit(VoiceValidationFailed(ve.consecutiveFailures, message));
        add(Reset());
      } on DioException catch (err) {
        if (CancelToken.isCancel(err)) {
          print("Voice Bloc - Request cancelled: ${err.message}");
          return;
        }
        print("Voice Bloc Error - Stop/transcribe failed: $err");
        if (e.requestId == _activeRequestId) emit(Idle());
      } catch (err) {
        print("Voice Bloc Error - Stop/transcribe failed: $err");
        if (e.requestId == _activeRequestId) emit(Idle());
      } finally {
        // Clear the cancel token if it's still ours.
        if (_activeCancelToken == cancelToken) _activeCancelToken = null;
      }
    });

    on<Reset>((e, emit) {
      emit(Idle());
    });

    on<VerifyOtp>((e, emit) async {
      // OTP verification is a user-initiated action; treat it as a new request.
      _activeRequestId++;
      _activeCancelToken?.cancel('OTP verification started');
      final myRequestId = _activeRequestId;
      final cancelToken = CancelToken();
      _activeCancelToken = cancelToken;

      emit(Transcribing());

      try {
        final data = await repo.verifyOtpWithTranscribe(
            otp: e.otp, sessionId: e.sessionId, locale: e.locale,
            cancelToken: cancelToken);

        if (myRequestId != _activeRequestId) return;
        add(GotTranscript(data, e.locale, myRequestId));
      } on DioException catch (err) {
        if (CancelToken.isCancel(err)) return;
        print("OTP Verification Error: $err");
        if (myRequestId == _activeRequestId) {
          emit(Executing("OTP verification failed. Please try again.",
              VoiceIntent(VoiceIntentType.unknown)));
          add(Reset());
        }
      } catch (error) {
        print("OTP Verification Error: $error");
        if (myRequestId == _activeRequestId) {
          emit(Executing("OTP verification failed. Please try again.",
              VoiceIntent(VoiceIntentType.unknown)));
          add(Reset());
        }
      } finally {
        if (_activeCancelToken == cancelToken) _activeCancelToken = null;
      }
    });

    on<GotTranscript>((e, emit) async {
      // Abort immediately if this transcript belongs to a superseded session.
      if (e.requestId != _activeRequestId) {
        print("Voice Bloc - Discarding stale GotTranscript (requestId=${e.requestId}, active=$_activeRequestId)");
        return;
      }

      print("=== NEW VOICE BLOC CODE IS RUNNING - LANGUAGE FIX VERSION ===");
      print("Voice Bloc Debug - GotTranscript handler started");
      // Capture the request ID for all subsequent guards within this handler.
      final myRequestId = e.requestId;
      // Get orchestrator data and intent data
      final orchestratorData = e.data["orchestrator_data"];
      final intentData = e.data["intent_data"];
      final sessionId = e.data["session_id"] ?? "";

      print("Voice Bloc Debug - Full intentData: $intentData");
      print("Voice Bloc Debug - intentData type: ${intentData.runtimeType}");

      // Use the language detected by the API from intent_data.language
      final ttsLanguage = intentData?["language"] ?? "en";
      print(
          "Voice Bloc Debug - API detected language: ${intentData?["language"]}");
      print("Voice Bloc Debug - TTS language to use: $ttsLanguage");
      print("Voice Bloc Debug - Passed locale: ${e.locale}");

      // Parse intent
      String intentName = intentData?["intent"] ?? "unknown";

      print("Voice Bloc Debug - Parsed intentName: $intentName");
      print("Voice Bloc Debug - About to start intent handling section");
      print("Voice Bloc Debug - Full intentData: $intentData");
      print("Voice Bloc Debug - Full orchestratorData: $orchestratorData");
      print(
          "Voice Bloc Debug - orchestratorData is null: ${orchestratorData == null}");
      print("Voice Bloc Debug - About to check for recent_txn intent");
      print("Voice Bloc Debug - About to check for list_beneficiaries intent");
      print("Voice Bloc Debug - About to start intent handling section");

      // Check if beneficiaries data exists
      if (orchestratorData != null && orchestratorData["data"] != null) {
        print(
            "Voice Bloc Debug - orchestratorData.data exists: ${orchestratorData["data"]}");
        if (orchestratorData["data"]["beneficiaries"] != null) {
          print(
              "Voice Bloc Debug - beneficiaries data found: ${orchestratorData["data"]["beneficiaries"]}");
        } else {
          print(
              "Voice Bloc Debug - No beneficiaries data in orchestrator_data.data");
        }
      }

      // Check if there's an early message processing happening
      if (orchestratorData != null && orchestratorData["message"] != null) {
        print(
            "Voice Bloc Debug - Found message in orchestrator_data: ${orchestratorData["message"]}");
      }

      // Check if there's any early processing that might be calling TTS
      print("Voice Bloc Debug - About to check for early TTS processing");

      // Handle different intents
      print(
          "Voice Bloc Debug - About to check intent handlers for: $intentName");
      if (intentName == "recent_txn" && orchestratorData != null) {
        // Handle recent transactions - show popup dialog

        // Get transactions from orchestrator data
        List<Map<String, dynamic>> transactions = [];
        if (orchestratorData["data"] != null &&
            orchestratorData["data"]["transactions"] != null) {
          transactions = List<Map<String, dynamic>>.from(
              orchestratorData["data"]["transactions"]);
        }

        // Get message for transactions (use actual API response)
        String originalMessage = orchestratorData["message"] ??
            orchestratorData["data"]?["message"] ??
            e.data["translation"] ??
            e.data["message"] ??
            "Here are your recent transactions";

        // Translate the message to user's language
        final transactionCount = transactions.length;
        final context = {'count': transactionCount.toString()};
        String translatedMessage = TranslationService.translateApiResponse(
            originalMessage, _currentLocale, context);

        // Speak the translated message
        if (myRequestId != _activeRequestId) return;
        try {
          await tts.speak(translatedMessage, langCode: ttsLanguage);
        } catch (e) {
          print("TTS Error: $e");
        }
        if (myRequestId != _activeRequestId) return;

        // Show transactions dialog
        emit(
            ShowTransactionsDialog(translatedMessage, transactions, sessionId));
        add(StartListening(locale: _currentLocale, sessionId: sessionId));
        return;
      }

      print(
          "Voice Bloc Debug - After recent_txn check, checking beneficiaries for: $intentName");
      // Handle list beneficiaries intent - check multiple possible intent names
      print(
          "Voice Bloc Debug - Checking list_beneficiaries condition: intentName='$intentName', orchestratorData null=${orchestratorData == null}");
      if ((intentName == "list_beneficiaries" ||
              intentName == "show_beneficiaries" ||
              intentName == "beneficiaries_list" ||
              intentName == "get_beneficiaries") &&
          orchestratorData != null) {
        print("Voice Bloc Debug - Processing list_beneficiaries intent");

        // Get beneficiaries from orchestrator data
        List<Map<String, dynamic>> beneficiaries = [];
        if (orchestratorData["data"] != null &&
            orchestratorData["data"]["beneficiaries"] != null) {
          beneficiaries = List<Map<String, dynamic>>.from(
              orchestratorData["data"]["beneficiaries"]);
          print(
              "Voice Bloc Debug - Found ${beneficiaries.length} beneficiaries");
        } else {
          print(
              "Voice Bloc Debug - No beneficiaries found in orchestrator data");
        }

        // Get message for beneficiaries (use actual API response)
        String originalMessage = orchestratorData["message"] ??
            orchestratorData["data"]?["message"] ??
            e.data["translation"] ??
            e.data["message"] ??
            "Here are your beneficiaries";

        print("Voice Bloc Debug - Original message: $originalMessage");

        // Translate the message to user's language
        final beneficiaryCount = beneficiaries.length;
        final context = {'count': beneficiaryCount.toString()};
        String translatedMessage = TranslationService.translateApiResponse(
            originalMessage, _currentLocale, context);

        print("Voice Bloc Debug - Translated message: $translatedMessage");

        // Speak the translated message
        if (myRequestId != _activeRequestId) return;
        try {
          await tts.speak(translatedMessage, langCode: ttsLanguage);
        } catch (e) {
          print("TTS Error: $e");
        }
        if (myRequestId != _activeRequestId) return;

        // Show beneficiaries dialog
        print("Voice Bloc Debug - Emitting ShowBeneficiariesDialog");
        emit(ShowBeneficiariesDialog(
            translatedMessage, beneficiaries, sessionId));
        add(StartListening(locale: _currentLocale, sessionId: sessionId));
        return;
      }

      // Handle OTP status for transfer money
      if (intentName == "transfer_money" && orchestratorData != null) {
        // Check if the response indicates OTP is required (regardless of success status)
        if (orchestratorData["data"] != null &&
            orchestratorData["data"]["status"] == "otp") {
          final message = orchestratorData["data"]["message"] ??
              "Please confirm the transaction with OTP";

          // Extract recipient and amount from intent_data.entities
          final recipient = intentData?["entities"]?["recipient"]?.toString() ??
              orchestratorData["data"]["recipient"] ??
              "Unknown";
          final amount = (intentData?["entities"]?["amount"]?.toDouble() ??
              orchestratorData["data"]["amount"]?.toDouble() ??
              0.0);

          // Translate the message to user's language
          String translatedMessage = TranslationService.translateApiResponse(
              message,
              _currentLocale,
              {'amount': amount.toString(), 'recipient': recipient});

          // Speak the translated message
          if (myRequestId != _activeRequestId) return;
          try {
            await tts.speak(translatedMessage, langCode: ttsLanguage);
          } catch (e) {
            print("TTS Error: $e");
          }
          if (myRequestId != _activeRequestId) return;

          // Show OTP dialog
          emit(ShowOtpDialog(translatedMessage, sessionId, recipient, amount));
          add(Reset());
          return;
        }

        // Check if the response indicates duplicate beneficiaries (regardless of success status)
        if (orchestratorData["data"] != null &&
            orchestratorData["data"]["status"] == "duplicate") {
          final message = orchestratorData["data"]["message"] ??
              "Multiple beneficiaries found. Please select one.";
          final beneficiaries = List<Map<String, dynamic>>.from(
              orchestratorData["data"]["beneficiaries"] ?? []);

          // Extract original amount from intent data
          final originalAmount = intentData?["entities"]?["amount"]?.toDouble();
          print(
              "Voice Bloc Debug - Extracted original amount: $originalAmount");

          // Store session ID for later use
          await SharedPreferencesService.saveSessionId(sessionId);

          // Translate the message to user's language
          String translatedMessage = TranslationService.translateApiResponse(
              message, _currentLocale, {});

          // Speak the translated message
          if (myRequestId != _activeRequestId) return;
          try {
            await tts.speak(translatedMessage, langCode: ttsLanguage);
          } catch (e) {
            print("TTS Error: $e");
          }
          if (myRequestId != _activeRequestId) return;

          // Show duplicate beneficiaries dialog
          emit(ShowDuplicateDialog(translatedMessage, sessionId, beneficiaries,
              originalAmount: originalAmount));
          add(StartListening(locale: _currentLocale, sessionId: sessionId));
          return;
        }
      }

      // Handle unknown intents - show error message
      if (intentName == "unknown") {
        String? originalMessage;

        print("Voice Bloc Debug - Unknown intent detected");
        print("Voice Bloc Debug - orchestratorData: $orchestratorData");
        print("Voice Bloc Debug - Full response data: ${e.data}");

        // Get the error message from orchestrator data
        if (orchestratorData != null &&
            orchestratorData["message"] != null &&
            orchestratorData["message"].toString().trim().isNotEmpty) {
          originalMessage = orchestratorData["message"].toString().trim();
          print(
              "Voice Bloc Debug - Found message in orchestratorData: $originalMessage");
        } else {
          print(
              "Voice Bloc Debug - No message found in orchestratorData, checking main response");
          // Check if there's a message in the main response data
          if (e.data["message"] != null &&
              e.data["message"].toString().trim().isNotEmpty) {
            originalMessage = e.data["message"].toString().trim();
            print(
                "Voice Bloc Debug - Found message in main response: $originalMessage");
          }
        }

        if (originalMessage != null) {
          // Translate the message to user's language
          String translatedMessage = TranslationService.translateApiResponse(
              originalMessage, _currentLocale, {});

          print("Voice Bloc Debug - Translated message: $translatedMessage");

          // Speak the translated message
          if (myRequestId != _activeRequestId) return;
          try {
            await tts.speak(translatedMessage, langCode: ttsLanguage);
          } catch (e) {
            print("TTS Error: $e");
          }
          if (myRequestId != _activeRequestId) return;

          // Show the error message
          emit(Executing(
              translatedMessage, VoiceIntent(VoiceIntentType.unknown)));
          // After TTS completes, restart listening for continuous conversation
          add(StartListening(locale: _currentLocale, sessionId: sessionId));
          return;
        } else {
          print(
              "Voice Bloc Debug - No message found for unknown intent, will fall through to general handling");
        }
      }

      // Handle other intents (transfer money, check balance, etc.) - skip unknown intents
      print(
          "Voice Bloc Debug - Reached general handler for intent: $intentName");
      String? originalMessage;

      if (orchestratorData != null && intentName != "unknown") {
        // Case 1: error message at top-level (failure cases)
        if (orchestratorData["message"] != null &&
            orchestratorData["message"].toString().trim().isNotEmpty) {
          originalMessage = orchestratorData["message"].toString().trim();
        }
        // Case 2: success message inside data (success cases)
        else if (orchestratorData["data"] != null &&
            orchestratorData["data"]["message"] != null &&
            orchestratorData["data"]["message"].toString().trim().isNotEmpty) {
          originalMessage =
              orchestratorData["data"]["message"].toString().trim();
        }
        // Case 3: fallback to translation field
        else if (e.data["translation"] != null &&
            e.data["translation"].toString().trim().isNotEmpty) {
          originalMessage = e.data["translation"].toString().trim();
        }
        // Case 4: fallback to main message field
        else if (e.data["message"] != null &&
            e.data["message"].toString().trim().isNotEmpty) {
          originalMessage = e.data["message"].toString().trim();
        }

        // Update balance and customer name from orchestrator data if available
        if (orchestratorData["data"] != null) {
          final balance = orchestratorData["data"]["balance"];
          final customerName = orchestratorData["data"]["customer_name"];

          if (balance != null) {
            // Store balance in shared preferences for UI updates (format to 2 decimal places)
            print(
                "DEBUG - Raw balance from voice bloc: '${balance.toString()}'");
            final balanceValue = double.tryParse(balance.toString()) ?? 0.0;
            final formattedBalance = balanceValue.toStringAsFixed(2);
            print(
                "DEBUG - Formatted balance for saving in voice bloc: '$formattedBalance'");
            await SharedPreferencesService.saveBalance(formattedBalance);
          }

          if (customerName != null &&
              customerName.toString().trim().isNotEmpty) {
            await SharedPreferencesService.saveCustomerName(
                customerName.toString().trim());
          }

          // Handle recent transactions for any intent that has them

          if (orchestratorData["data"]["recent_transactions"] != null) {
            final recentTransactions = List<Map<String, dynamic>>.from(
                orchestratorData["data"]["recent_transactions"]);

            // Store recent transactions in shared preferences for UI updates
            await SharedPreferencesService.saveRecentTransactions(
                recentTransactions);
          }
        }
      }

      // Fallback: Check for recent transactions in the main response data
      if (e.data["recent_transactions"] != null) {
        final recentTransactions =
            List<Map<String, dynamic>>.from(e.data["recent_transactions"]);
        await SharedPreferencesService.saveRecentTransactions(
            recentTransactions);
      }

      if (originalMessage != null) {
        // Translate the message to user's language
        Map<String, dynamic> context = {};

        // Add context based on intent type
        if (intentName == "check_balance" && orchestratorData["data"] != null) {
          final balance = orchestratorData["data"]["balance"];
          if (balance != null) {
            final balanceValue = double.tryParse(balance.toString()) ?? 0.0;
            context['amount'] = balanceValue.toStringAsFixed(2);
          }
        } else if (intentName == "transfer_money" &&
            orchestratorData["data"] != null) {
          final amount = orchestratorData["data"]["amount"];
          final recipient = orchestratorData["data"]["recipient"];
          if (amount != null) {
            context['amount'] = amount.toString();
          }
          if (recipient != null) {
            context['recipient'] = recipient.toString();
          }
        }

        String translatedMessage = TranslationService.translateApiResponse(
            originalMessage, _currentLocale, context);

        if (myRequestId != _activeRequestId) return;
        try {
          await tts.speak(translatedMessage, langCode: ttsLanguage);
        } catch (e) {
          print("TTS Error: $e");
        }
        if (myRequestId != _activeRequestId) return;

        // Determine intent type for execution state
        VoiceIntentType intentType = VoiceIntentType.unknown;
        switch (intentName) {
          case "transfer_money":
            intentType = VoiceIntentType.transferMoney;
            break;
          case "check_balance":
            intentType = VoiceIntentType.checkBalance;
            break;
          case "recent_txn":
            intentType = VoiceIntentType.recentTransactions;
            break;
          default:
            intentType = VoiceIntentType.unknown;
        }

        emit(Executing(translatedMessage, VoiceIntent(intentType)));
        // After TTS completes, restart listening for continuous conversation
        add(StartListening(locale: _currentLocale, sessionId: sessionId));
        return;
      }

      // NO FALLBACKS - JUST RESET
      print("Voice Bloc Debug - No handlers matched, resetting to idle");
      add(Reset());
    });
  }
}
