// ignore_for_file: avoid_print
//
// Генерирует lookup по ключу для AppLocalizations, чтобы по строке из JSON
// (например "for_you_title") получать готовый локализованный текст из .arb.
//
// Запуск: dart run tools/generate_l10n_lookup.dart
// Запускайте после flutter gen-l10n, чтобы в app_localizations.dart уже были
// актуальные сигнатуры.

import 'dart:io';

void main() async {
  final appL10nPath = 'lib/core/l10n/gen/app_localizations.dart';
  final outPath = 'lib/core/l10n/gen/l10n_lookup.dart';

  final file = File(appL10nPath);
  if (!file.existsSync()) {
    print('Error: $appL10nPath not found');
    exit(1);
  }

  final content = await file.readAsString();
  final getterRegex = RegExp(r'^\s*String get ([A-Za-z0-9_]+);', multiLine: true);
  final keys = getterRegex
      .allMatches(content)
      .map((m) => m.group(1)!)
      // Только реальные l10n ключи; служебные геттеры исключаем.
      .where((k) => k != 'localeName')
      .toSet()
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
    buffer.writeln("    case '$key': return l10n.$key;");
  }

  buffer.writeln('    default: return key;');
  buffer.writeln('  }');
  buffer.writeln('}');

  await File(outPath).writeAsString(buffer.toString());
  print('Wrote $outPath (${keys.length} keys).');
}
