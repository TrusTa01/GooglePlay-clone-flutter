import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:google_play/core/l10n/gen/app_localizations.dart';

abstract final class AppLocalizationSetup {
  static const List<LocalizationsDelegate<dynamic>> delegates = [
    AppLocalizations.delegate,
    LocaleNamesLocalizationsDelegate(),
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales =
      AppLocalizations.supportedLocales;
}
