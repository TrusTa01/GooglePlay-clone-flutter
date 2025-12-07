import 'package:flutter/material.dart';

import 'layouts/main_layout.dart';

void main() => runApp(GooglePlay());

class GooglePlay extends StatelessWidget {
  const GooglePlay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Play',
      theme: ThemeData(
        primaryColor: const Color(0xFF4285F4), // Google Blue
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: const MainLayout(),
    );
  }
}
