import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:google_play/core/constants/global_constants.dart';
import 'package:google_play/core/extensions/l10n_ext.dart';
import 'package:google_play/core/l10n/gen/app_localizations.dart';
import 'package:google_play/core/routes/app_router.dart';
import 'package:google_play/features/shared/presentation/providers/locale_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
  debugRepaintRainbowEnabled = false;
  runApp(const ProviderScope(child: GooglePlay()));
}

class GooglePlay extends ConsumerWidget {
  const GooglePlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseTheme = ThemeData.light();
    final currentLocale = ref.watch(localeProvider);
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      onGenerateTitle: (context) => context.l10n.appTitle,
      routerConfig: router,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        LocaleNamesLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: currentLocale,

      theme: baseTheme.copyWith(
        primaryColor: Constants.googleBlue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Constants.googleBlue),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
