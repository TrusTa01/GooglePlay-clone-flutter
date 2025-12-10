import 'package:flutter/material.dart';
import 'package:google_play/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'providers/tabs_provider.dart';
import './screens/screens.dart';
import 'layouts/main_layout.dart';

void main() => runApp(GooglePlay());

class GooglePlay extends StatelessWidget {
  const GooglePlay({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData.light();
    return ChangeNotifierProvider(
      create: (context) => TabsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Google Play',
        theme: baseTheme.copyWith(
          textTheme: GoogleFonts.nunitoTextTheme(baseTheme.textTheme),
          primaryColor: const Color(0xFF0B57CE),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
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
