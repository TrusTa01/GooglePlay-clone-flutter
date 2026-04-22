import 'package:flutter/material.dart';
import 'package:google_play/core/bootstrap/app_startup_gate.dart';
import 'package:google_play/core/di/di.dart';
import 'package:google_play/core/presentation/providers/shared_preferences_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final talker = TalkerFlutter.init();
  runApp(
    ProviderScope(
      observers: [TalkerRiverpodObserver(talker: talker)],
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        talkerProvider.overrideWithValue(talker),
      ],
      child: const AppStartupGate(),
    ),
  );
}
