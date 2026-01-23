import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../widgets.dart';

class GamePreviewSection extends StatelessWidget {
  final List<Game> games;

  const GamePreviewSection({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    if (games.isEmpty) {
      debugPrint('Ошибка: products.isEmpty (game preview section)');
      return const SizedBox.shrink();
    }

    return ListView.separated(
      shrinkWrap: true, // Чтобы не было конфликта с основным скроллом
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 35,), 
      itemCount: games.length,
      itemBuilder: (context, index) {
        return GamePreviewCard(game: games[index]);
      }, 
    );
  }
}