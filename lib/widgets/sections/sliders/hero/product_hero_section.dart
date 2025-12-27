import 'package:flutter/material.dart';
import 'package:google_play/widgets/banners/banner_item.dart';
import '/models/models.dart';

class ProductHeroSection extends StatelessWidget {
  final Game game;

  const ProductHeroSection({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 210,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: game.screenshots.length,
            itemBuilder: (context, index) {
              return Container(
                width: 300,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(game.screenshots[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 20,),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: ActionRow(game: game, showGenre: true,)
        ),
      ],
    );
  }
}
