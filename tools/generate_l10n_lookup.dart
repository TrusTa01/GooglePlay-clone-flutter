// ignore_for_file: avoid_print
//
// Генерирует lookup по ключу для AppLocalizations, чтобы по строке из JSON
// (например "for_you_title") получать готовый локализованный текст из .arb.
//
// Запуск: dart run tools/generate_l10n_lookup.dart
// Запускайте после flutter gen-l10n, чтобы в .arb уже были все ключи.
//
// В .arb добавляйте ключи в том же виде, в каком они приходят из конфига
// (snake_case). gen-l10n создаст геттер в camelCase (for_you_title -> forYouTitle).

import 'dart:convert';
import 'dart:io';

void main() async {
  final arbPath = 'lib/core/l10n/app_en.arb';
  final outPath = 'lib/core/l10n/gen/l10n_lookup.dart';

  final file = File(arbPath);
  if (!file.existsSync()) {
    print('Error: $arbPath not found');
    exit(1);
  }

  final map = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
  final keys = map.keys
      .where((k) => !k.startsWith('@'))
      .where((k) => k != '@@locale')
      .toList()
    ..sort();

  final buffer = StringBuffer();
  buffer.writeln('// GENERATED CODE - DO NOT EDIT.');
  buffer.writeln('// Run: dart run tools/generate_l10n_lookup.dart');
  buffer.writeln('');
  buffer.writeln("import 'app_localizations.dart';");
  buffer.writeln('');
  buffer.writeln('/// Возвращает локализованную строку по ключу из конфига (например title_key секции).');
  buffer.writeln('/// Если ключа нет в .arb, возвращает сам ключ.');
  buffer.writeln('String lookupL10n(AppLocalizations l10n, String key) {');
  buffer.writeln('  switch (key) {');

  for (final key in keys) {
    final getterName = key.contains('_') ? _snakeToCamel(key) : _firstCharLower(key);
    buffer.writeln("    case '$key': return l10n.$getterName;");
  }

  buffer.writeln('    default: return key;');
  buffer.writeln('  }');
  buffer.writeln('}');

  await File(outPath).writeAsString(buffer.toString());
  print('Wrote $outPath (${keys.length} keys).');
}

/// snake_case -> camelCase (for_you_title -> forYouTitle).
String _snakeToCamel(String s) {
  final parts = s.split('_');
  if (parts.isEmpty) return s;
  final first = parts.first.toLowerCase();
  final rest = parts.skip(1).map((p) {
    if (p.isEmpty) return p;
    return p[0].toUpperCase() + p.substring(1).toLowerCase();
  });
  return first + rest.join();
}

/// Первая буква в нижний регистр (AppTitle -> appTitle). Остальное не трогаем — в .arb уже camelCase.
String _firstCharLower(String s) {
  if (s.isEmpty) return s;
  return s[0].toLowerCase() + s.substring(1);
}
