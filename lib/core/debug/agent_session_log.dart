import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/// Debug-mode NDJSON to the Cursor ingest (session 211540). No-op in release.
Future<void> agentSessionLog({
  required String hypothesisId,
  required String location,
  required String message,
  Map<String, Object?> data = const {},
  String runId = 'pre-fix',
}) async {
  if (kReleaseMode) return;
  try {
    const sessionId = '211540';
    final host = defaultTargetPlatform == TargetPlatform.android
        ? '10.0.2.2'
        : '127.0.0.1';
    final uri = Uri.parse(
      'http://$host:7524/ingest/51b596c6-c4f0-4a0d-9968-5cb11d9eeb41',
    );
    await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'X-Debug-Session-Id': sessionId,
      },
      body: jsonEncode({
        'sessionId': sessionId,
        'hypothesisId': hypothesisId,
        'location': location,
        'message': message,
        'data': data,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
        'runId': runId,
      }),
    );
  } catch (_) {}
}
