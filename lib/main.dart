import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_play/core/bootstrap/app_startup_gate.dart';
import 'package:google_play/core/di/di.dart';
import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/core/presentation/providers/shared_preferences_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger_observer.dart';

Future<void> main() async {
  Talker? talkerRef;

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      final talker = TalkerFlutter.init();
      talkerRef = talker;
      FeatureTalker.init(talker);

      FlutterError.onError = (details) {
        talker.error(
          'FlutterError: ${details.exceptionAsString()}\n${details.stack ?? StackTrace.current}',
        );
        FlutterError.presentError(details);
      };

      PlatformDispatcher.instance.onError = (error, stackTrace) {
        talker.error('PlatformDispatcher error: $error\n$stackTrace');
        return true;
      };

      final prefs = await SharedPreferences.getInstance();
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
    },
    (error, stackTrace) {
      talkerRef?.error('runZonedGuarded uncaught error: $error\n$stackTrace');
    },
  );
}
