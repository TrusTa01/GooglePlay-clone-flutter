import 'package:flutter/material.dart';

class GamesBestTab extends StatefulWidget {
  const GamesBestTab({super.key});

  @override
  State<GamesBestTab> createState() => _GamesBestTabState();
}

class _GamesBestTabState extends State<GamesBestTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Лучшее', style: TextStyle(fontSize: 24)),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
