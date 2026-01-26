import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'providers/tabs_provider.dart';
import 'providers/filter_provider.dart';
import './screens/screens.dart';
import 'layouts/main_layout.dart';
import '/providers/products_provider.dart';
import '/core/routes/routes.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

void main() {
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
          highlightColor: Colors.transparent,
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
