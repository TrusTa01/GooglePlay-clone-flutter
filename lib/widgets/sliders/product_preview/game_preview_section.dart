import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';
import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/widgets/widgets.dart';

class GamePreviewSection extends StatelessWidget {
  final List<Game> game;
  final bool nestedInScrollView;
  final bool showButton;
  final bool isSliver;

  const GamePreviewSection({
    super.key,
    required this.game,
    this.nestedInScrollView = false,
    this.showButton = false,
    this.isSliver = false,
  });

  static Widget asSliver({required List<Game> game}) {
    return GamePreviewSection(
      game: game,
      nestedInScrollView: false,
      isSliver: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (game.isEmpty) {
      debugPrint('Ошибка: products.isEmpty (game preview section)');
      return isSliver 
        ? const SliverToBoxAdapter(child: SizedBox.shrink()) 
        : const SizedBox.shrink();
    }

    if (isSliver) {
      return SliverPadding(
        padding: const EdgeInsets.only(left: 22),
        sliver: SliverList.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 35),
          itemCount: game.length,
          itemBuilder: (context, index) =>
              ProductPreviewCard(product: game[index]),
        ),
      );
    }

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: Constants.sliderMaxContentWidth),
        child: ListView.separated(
          shrinkWrap: nestedInScrollView,
          physics: nestedInScrollView ? const NeverScrollableScrollPhysics() : null,
          padding: const EdgeInsets.only(left: 22),
          separatorBuilder: (context, index) => const SizedBox(height: 35),
          itemCount: game.length,
          itemBuilder: (context, index) => ProductPreviewCard(product: game[index]),
        ),
      ),
    );
  }
}
