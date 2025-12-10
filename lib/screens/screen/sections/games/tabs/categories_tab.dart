import 'package:flutter/material.dart';

class GamesCategoriesTab extends StatefulWidget {
  const GamesCategoriesTab({super.key});

  @override
  State<GamesCategoriesTab> createState() => _GamesCategoriesTabState();
}

class _GamesCategoriesTabState extends State<GamesCategoriesTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Категории', style: TextStyle(fontSize: 24)),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
