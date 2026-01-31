import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../widgets.dart';

class GamePreviewSection extends StatelessWidget {
  final List<Game> game;
  final bool nestedInScrollView;

  const GamePreviewSection({
    super.key,
    required this.game,
    this.nestedInScrollView = false,
  });

  @override
  Widget build(BuildContext context) {
    if (game.isEmpty) {
      debugPrint('Ошибка: products.isEmpty (game preview section)');
      return const SizedBox.shrink();
    }

    return ListView.separated(
      shrinkWrap: nestedInScrollView,
      physics: nestedInScrollView ? const NeverScrollableScrollPhysics() : null,
      clipBehavior:
          Clip.none, // Элементы будут визуально выезжать за пределы контейнера
      separatorBuilder: (context, index) => const SizedBox(height: 35),
      itemCount: game.length,
      itemBuilder: (context, index) {
        return ProductPreviewCard(product: game[index]);
      },
    );
  }
}
