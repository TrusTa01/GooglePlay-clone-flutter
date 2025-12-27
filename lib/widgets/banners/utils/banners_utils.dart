import 'package:flutter/material.dart';

import '/models/models.dart';
import '../../widgets.dart';

class BannerImage extends StatelessWidget {
  final String assetPath;

  const BannerImage({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Constants.boxShadow,
            offset: const Offset(0, 2),
            blurRadius: 4.0,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          assetPath,
          cacheWidth: 800,
          cacheHeight: 800,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const SizedBox(
            height: 180,
            child: Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

// Виджет для тултипа (белая плашка в углу)
class BannerToolTip extends StatelessWidget {
  final String text;
  const BannerToolTip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(12),
            topLeft: Radius.circular(9),
          ),
          color: Colors.white70,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: Constants.defaultFontWeight,
          ),
        ),
      ),
    );
  }
}

// Виджет текстого контента
class BannerTextContent extends StatelessWidget {
  final String? title;
  final String? description;

  const BannerTextContent({super.key, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      left: 15,
      right: 15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Text(
              title!,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: Constants.defaultFontWeight,
              ),
            ),
          if (description != null)
            Text(
              description!,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: Constants.defaultFontWeight,
              ),
            ),
        ],
      ),
    );
  }
}

// Виджет для градиента
// class BannerGradientOverlay extends StatelessWidget {
//   const BannerGradientOverlay({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Positioned.fill(
//       child: DecoratedBox(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Colors.transparent, Colors.black.withValues(alpha: 0.4)],
//           ),
//         ),
//       ),
//     );
//   }
// }

class ProductCreatorText extends StatelessWidget {
  final String creator;
  const ProductCreatorText({super.key, required this.creator});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: Text(
          creator,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}

class AgeBadge extends StatelessWidget {
  final int age;
  const AgeBadge({super.key, required this.age});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.8),
      ),
      child: Text(
        '$age+',
        style: const TextStyle(fontSize: 7, fontWeight: FontWeight.w900),
      ),
    );
  }
}

class GameGenre extends StatelessWidget {
  final Game game;

  const GameGenre({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Text(
      (game).gameGenre,
      style: const TextStyle(fontSize: 12, color: Colors.grey),
    );
  }
}

class ActionRowButton extends StatelessWidget {
  final bool isPaid;
  final double? price;
  final bool containsPaidContent;
  final VoidCallback? onPressed;

  const ActionRowButton({
    super.key,
    required this.isPaid,
    required this.price,
    this.onPressed,
    required this.containsPaidContent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Constants.googleBlue,
            foregroundColor: Colors.white,
            elevation: 0,
            minimumSize: const Size(0, 32),
            padding: const EdgeInsets.symmetric(horizontal: 18),
            tapTargetSize: MaterialTapTargetSize
                .shrinkWrap, // Убирает лишние пустые зоны вокруг кнопки
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () {},
          child: Text(
            !isPaid ? 'Установить' : '${price.toString()} ₽',
            style: TextStyle(
              fontWeight: Constants.defaultFontWeight,
              fontSize: 13,
            ),
          ),
        ),
        if (containsPaidContent)
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Text(
              'Есть платный контент',
              style: TextStyle(fontSize: 8, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}
