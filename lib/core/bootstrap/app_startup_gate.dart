import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_play/core/bootstrap/app_bootstrap.dart';
import 'package:google_play/core/bootstrap/app_launch_state.dart';
import 'package:google_play/core/bootstrap/google_play_app.dart';
import 'package:google_play/core/constants/global_constants.dart';
import 'package:google_play/core/l10n/app_localization_setup.dart';
import 'package:google_play/core/presentation/screens/initialization_error_screen.dart';
import 'package:google_play/core/presentation/widgets/ui_kits/indicators/app_loading_indicator.dart';

/// Оболочка до успешного [AppBootstrap.init] - лоадер, ошибка или [GooglePlay]
class AppStartupGate extends StatefulWidget {
  const AppStartupGate({super.key});

  @override
  State<AppStartupGate> createState() => _AppStartupGateState();
}

class _AppStartupGateState extends State<AppStartupGate> {
  AppLaunchState _state = const AppLaunchBootstrapping();

  void _sendDebugLog({
    required String hypothesisId,
    required String location,
    required String message,
    required Map<String, Object?> data,
  }) {
    unawaited(() async {
      try {
        final client = HttpClient();
        final request = await client.postUrl(
          Uri.parse(
            'http://127.0.0.1:7524/ingest/51b596c6-c4f0-4a0d-9968-5cb11d9eeb41',
          ),
        );
        request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
        request.headers.set('X-Debug-Session-Id', '65c934');
        request.write(
          jsonEncode({
            'sessionId': '65c934',
            'runId': 'pre-fix',
            'hypothesisId': hypothesisId,
            'location': location,
            'message': message,
            'data': data,
            'timestamp': DateTime.now().millisecondsSinceEpoch,
          }),
        );
        await request.close();
        client.close(force: true);
      } catch (_) {}
    }());
  }

  @override
  void initState() {
    super.initState();
    _runBootstrap();
  }

  Future<void> _runBootstrap() async {
    // #region agent log
    _sendDebugLog(
      hypothesisId: 'H4',
      location: 'lib/core/bootstrap/app_startup_gate.dart:_runBootstrap:enter',
      message: 'bootstrap started',
      data: {'mounted': mounted, 'stateType': _state.runtimeType.toString()},
    );
    // #endregion
    if (!mounted) return;
    setState(() {
      _state = switch (_state) {
        AppLaunchFailed() => const AppLaunchFailed(isRetrying: true),
        _ => const AppLaunchBootstrapping(),
      };
    });
    try {
      await AppBootstrap.init();
      if (!mounted) return;
      setState(() => _state = const AppLaunchReady());
    } catch (e, stackTrace) {
      if (kDebugMode) debugPrint('AppBootstrap.init failed: $e\n$stackTrace');
      if (!mounted) return;
      setState(() => _state = const AppLaunchFailed());
    }
  }

  ThemeData get _shellTheme {
    final base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: Constants.googleBlue),
    );
  }

  @override
  Widget build(BuildContext context) {
    return switch (_state) {
      AppLaunchReady() => const GooglePlay(),
      AppLaunchFailed(:final isRetrying) => MaterialApp(
        theme: _shellTheme,
        localizationsDelegates: AppLocalizationSetup.delegates,
        supportedLocales: AppLocalizationSetup.supportedLocales,
        debugShowCheckedModeBanner: false,
        home: InitializationErrorScreen(
          isRetrying: isRetrying,
          onRetry: _runBootstrap,
        ),
      ),
      AppLaunchBootstrapping() => MaterialApp(
        theme: _shellTheme,
        localizationsDelegates: AppLocalizationSetup.delegates,
        supportedLocales: AppLocalizationSetup.supportedLocales,
        debugShowCheckedModeBanner: false,
        home: const Scaffold(body: Center(child: AppLoadingIndicator())),
      ),
    };
  }
}
