import 'package:flutter/material.dart';

class GamesPaidTab extends StatefulWidget {
  const GamesPaidTab({super.key});

  @override
  State<GamesPaidTab> createState() => _GamesPaidTabState();
}

class _GamesPaidTabState extends State<GamesPaidTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Платные', style: TextStyle(fontSize: 24)),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
