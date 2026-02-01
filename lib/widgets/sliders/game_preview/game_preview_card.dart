import 'package:flutter/material.dart';

import '/widgets/widgets.dart';
import '/models/models.dart';

class GamePreviewCard extends StatelessWidget {
  final Game game;
  final bool showButton;

  const GamePreviewCard({
    super.key,
    required this.game,
    this.showButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 180,
          child: ListView.builder(
            padding: Constants.horizontalContentPadding,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: game.screenshots.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: GameScreenshotImage(
                  imageUrl: game.screenshots[index],
                  productId: game.id,
                  index: index,
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 10),
        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            return Padding(
              padding: EdgeInsets.only(left: 20, right: width > 1000 ? 0 : 22),
              child: ActionRow(product: game, showButton: showButton),
            );
          },
        ),
      ],
    );
  }
}
