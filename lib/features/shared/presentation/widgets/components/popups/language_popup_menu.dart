import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:google_play/core/l10n/gen/app_localizations.dart';
import 'package:google_play/features/shared/presentation/providers/locale_provider.dart';
import 'package:google_play/features/shared/presentation/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Меню для смены языка (удобная обёртка над [CustomPopupMenu])
class LanguagePopupMenu extends ConsumerWidget {
  const LanguagePopupMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supportedLanguages = AppLocalizations.supportedLocales;
    final localeNames = LocaleNames.of(context);

    return CustomPopupMenu<Locale>(
      icon: const Icon(Icons.language, color: Colors.black),
      items: supportedLanguages
          .map(
            (locale) => PopupMenuEntryItem<Locale>(
              title:
                  localeNames?.nameOf(locale.toString()) ??
                  locale.languageCode.toUpperCase(),
              icon: Icons.translate,
              value: locale,
              onSelected: () =>
                  ref.read(localeProvider.notifier).setLocale(locale),
            ),
          )
          .toList(),
    );
  }
}
