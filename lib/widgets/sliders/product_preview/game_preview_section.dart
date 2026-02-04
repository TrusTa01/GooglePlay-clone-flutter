import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../widgets.dart';

class GamePreviewSection extends StatelessWidget {
  final List<Game> game;
  final bool nestedInScrollView;
  final bool showButton;

  const GamePreviewSection({
    super.key,
    required this.game,
    this.nestedInScrollView = false,
    this.showButton = false,
  });

  @override
  Widget build(BuildContext context) {
    if (game.isEmpty) {
      debugPrint('Ошибка: products.isEmpty (game preview section)');
      return const SizedBox.shrink();
    }

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: Constants.sliderMaxContentWidth),
        child: ListView.separated(
          padding: EdgeInsets.only(left: 22),
          shrinkWrap: nestedInScrollView,
          physics: nestedInScrollView
              ? const NeverScrollableScrollPhysics()
              : null,
          separatorBuilder: (context, index) => const SizedBox(height: 35),
          itemCount: game.length,
          itemBuilder: (context, index) {
            return ProductPreviewCard(product: game[index]);
          },
        ),
      ),
    );
  }
}
