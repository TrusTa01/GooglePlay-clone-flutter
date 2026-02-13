import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:google_play/core/routes/routes.dart';
import 'package:google_play/layouts/main_layout.dart';
import 'package:google_play/providers/filter_provider.dart';
import 'package:google_play/providers/products_provider.dart';
import 'package:google_play/providers/tabs_provider.dart';
import 'package:google_play/screens/screens.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
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
        ChangeNotifierProvider(create: (context) => ProductsProvider()),
      ], 
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Google Play',
        theme: baseTheme.copyWith(
          textTheme: GoogleFonts.nunitoTextTheme(baseTheme.textTheme),
          primaryColor: const Color(0xFF0B57CE),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0B57CE)),
        ),
        routes: {
          AppRoutesName.notificationsScreen: (context) => const NotificationsScreen()
        },
        home: const MainLayout(),   
      ),
    );
  }
}
