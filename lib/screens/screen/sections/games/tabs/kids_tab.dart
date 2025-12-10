import 'package:flutter/material.dart';

class GamesKidsTab extends StatefulWidget {
  const GamesKidsTab({super.key});

  @override
  State<GamesKidsTab> createState() => _GamesKidsTabState();
}

class _GamesKidsTabState extends State<GamesKidsTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Детям', style: TextStyle(fontSize: 24)),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
