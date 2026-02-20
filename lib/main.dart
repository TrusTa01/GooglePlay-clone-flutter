import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_play/core/constants/global_constants.dart';
import 'package:google_play/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_play/core/routes/routes.dart';
import 'package:google_play/layouts/main_layout.dart';
import 'package:google_play/screens/screens.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(GooglePlay());
}

class GooglePlay extends StatelessWidget {
  const GooglePlay({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData.light();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TabsProvider()),
        ChangeNotifierProvider(create: (context) => FilterProvider()),
        ChangeNotifierProvider(create: (context) => BannersProvider()),
        ChangeNotifierProvider(create: (context) => GamesProvider()),
        ChangeNotifierProvider(create: (context) => AppsProvider()),
        ChangeNotifierProvider(create: (context) => BooksProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Google Play',
        theme: baseTheme.copyWith(
          textTheme: GoogleFonts.nunitoTextTheme(baseTheme.textTheme),
          primaryColor: Constants.googleBlue,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Constants.googleBlue),
        ),
        routes: {
          AppRoutesName.notificationsScreen: (context) =>
              const NotificationsScreen(),
        },
        home: const MainLayout(),
      ),
    );
  }
}
