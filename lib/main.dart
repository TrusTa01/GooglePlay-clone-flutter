import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'providers/tabs_provider.dart';
import 'layouts/main_layout.dart';

void main() => runApp(GooglePlay());

class GooglePlay extends StatelessWidget {
  const GooglePlay({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TabsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Google Play',
        theme: ThemeData( 
          // nunito как основной шрифт для всего
          fontFamily: GoogleFonts.nunito().fontFamily,
          primaryColor: const Color(0xFF0B57CE),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          useMaterial3: true,
          
        ),
        home: const MainLayout(),
      ),
    );
  }
}