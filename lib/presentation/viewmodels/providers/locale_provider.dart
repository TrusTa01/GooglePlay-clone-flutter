import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_provider.g.dart';

// TODO: добавить SharedPreferences, чтобы язык не слетал после перезагрузки
@riverpod
class LocaleNotifier extends _$LocaleNotifier {
  @override
  Locale? build() => null;

  // TODO: добавить сохранение в память
  void setLocale(Locale locale) => state = locale;

  void clearLoclae() => state = null;
}
