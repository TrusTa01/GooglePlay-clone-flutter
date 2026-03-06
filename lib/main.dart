import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:google_play/core/constants/global_constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_play/layouts/main_layout.dart';

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

    return MaterialApp(
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
      home: const MainLayout(),
    );
  }
}
