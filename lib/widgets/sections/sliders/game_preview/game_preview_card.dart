import 'package:flutter/material.dart';

import '/widgets/widgets.dart';
import '/models/models.dart';

class GamePreviewCard extends StatelessWidget {
  final Game game;

  const GamePreviewCard({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 180,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: game.screenshots.length,
            itemBuilder: (context, index) {

             return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GameScreenshotImage(
                imageUrl: game.screenshots[index],
                productId: game.id,
              ),
             );
            },
          ),
        ),

        const SizedBox(height: 10),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: ActionRow(game: game, showGenre: true, showButton: false,),
        ),
      ],
    );
  }
}
