import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// TODO: добавить SharedPreferences, чтобы язык не слетал после перезагрузки

class LocaleNotifier extends Notifier<Locale?> {
  @override
  Locale? build() => null;

  // TODO: добавить сохранение в память
  void setLocale(Locale locale) => state = locale;

  void clearLoclae() => state = null;
}

final localeProvider = NotifierProvider<LocaleNotifier, Locale?>(
  () => LocaleNotifier(),
);
