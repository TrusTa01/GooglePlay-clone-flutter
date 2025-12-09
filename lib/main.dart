import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          primaryColor: const Color(0xFF0B57CE),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
          ),
        ),
        home: const MainLayout(),
      ),
    );
  }
}
