import 'package:flutter/material.dart';
import 'package:google_play/core/bootstrap/app_startup_gate.dart';
import 'package:google_play/core/presentation/providers/shared_preferences_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: const AppStartupGate(),
    ),
  );
}
