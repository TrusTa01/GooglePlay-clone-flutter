import 'package:flutter/foundation.dart';
import 'package:talker_flutter/talker_flutter.dart' hide LogLevel;
import 'package:google_play/core/logging/log_level_enum.dart';

abstract final class FeatureTalker {
  static Talker? _talker;

  static void init(Talker talker) => _talker = talker;

  static void mapper(
    String boundary,
    String message, {
    Map<String, Object?>? context,
  }) => _log('MAPPER', boundary, message, context: context);

  static void mapperIn(
    String boundary, {
    required String from,
    required String to,
    Map<String, Object?>? context,
  }) => mapper(boundary, 'map.in $from->$to', context: context);

  static void mapperOut(
    String boundary,
    String target, {
    Map<String, Object?>? context,
  }) => mapper(boundary, 'map.out $target', context: context);

  static void data(
    String boundary,
    String message, {
    Map<String, Object?>? context,
  }) => _log('DATA', boundary, message, context: context);

  static void dataStart(
    String boundary,
    String action, {
    Map<String, Object?>? context,
  }) => data(boundary, 'start $action', context: context);

  static void dataDone(
    String boundary,
    String action, {
    Map<String, Object?>? context,
  }) => data(boundary, 'done $action', context: context);

  static void domain(
    String boundary,
    String message, {
    Map<String, Object?>? context,
  }) => _log('DOMAIN', boundary, message, context: context);

  static void domainStart(
    String boundary,
    String action, {
    Map<String, Object?>? context,
  }) => domain(boundary, 'start $action', context: context);

  static void domainDone(
    String boundary,
    String action, {
    Map<String, Object?>? context,
  }) => domain(boundary, 'done $action', context: context);

  static void provider(
    String boundary,
    String message, {
    Map<String, Object?>? context,
  }) => _log('PROVIDER', boundary, message, context: context);

  static void providerStart(
    String boundary,
    String action, {
    Map<String, Object?>? context,
  }) => provider(boundary, 'start $action', context: context);

  static void providerDone(
    String boundary,
    String action, {
    Map<String, Object?>? context,
  }) => provider(boundary, 'done $action', context: context);

  static void warning(
    String boundary,
    String message, {
    Map<String, Object?>? context,
  }) => _log(
    'WARNING',
    boundary,
    message,
    context: context,
    level: LogLevel.warning,
  );

  static void error(
    String boundary,
    String message, {
    Map<String, Object?>? context,
  }) =>
      _log('ERROR', boundary, message, context: context, level: LogLevel.error);

  static void _log(
    String layer,
    String boundary,
    String message, {
    Map<String, Object?>? context,
    LogLevel? level,
  }) {
    final payload = _toPayload(context);
    final text = '[$layer][$boundary] $message$payload';
    final effectiveLevel = level ?? _resolveLevel(message);
    final talker = _talker;
    if (talker == null) {
      if (kDebugMode) debugPrint(text);
      return;
    }
    switch (effectiveLevel) {
      case LogLevel.debug:
        talker.debug(text);
      case LogLevel.info:
        talker.info(text);
      case LogLevel.warning:
        talker.warning(text);
      case LogLevel.error:
        talker.error(text);
    }
  }

  static LogLevel _resolveLevel(String message) {
    final normalized = message.toLowerCase();
    if (normalized.startsWith('fail ') ||
        normalized.contains(' failed') ||
        normalized.startsWith('error ')) {
      return LogLevel.error;
    }
    if (normalized.startsWith('warn ') || normalized.contains('defer')) {
      return LogLevel.warning;
    }
    if (normalized.startsWith('start ') ||
        normalized.startsWith('done ') ||
        normalized.startsWith('fetch ') ||
        normalized.startsWith('read ') ||
        normalized.startsWith('watch ') ||
        normalized.startsWith('refresh ') ||
        normalized.startsWith('upsert ') ||
        normalized.startsWith('get ') ||
        normalized.startsWith('map.') ||
        normalized.contains(' success')) {
      return LogLevel.info;
    }
    return LogLevel.debug;
  }

  static String _toPayload(Map<String, Object?>? context) {
    if (context == null || context.isEmpty) return '';
    final sortedEntries = context.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));
    final parts = sortedEntries
        .map((entry) {
          final value = entry.value;
          if (value is Iterable) {
            return '${entry.key}=len(${value.length})';
          }
          return '${entry.key}=$value';
        })
        .join(', ');
    return ' | $parts';
  }
}
