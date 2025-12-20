import 'package:flutter/material.dart';

import '/widgets/widgets.dart';

class BannerItem extends StatelessWidget {
  final BannerData data;
  final VoidCallback? onTap;

  const BannerItem({super.key, required this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            BannerImage(assetPath: data.imageAssetPath),

            const _BannerGradientOverlay(),

            // Тултип сверху
            if (data.topToolTip != null) _BannerToolTip(text: data.topToolTip!),

            // Текстовый контент снизу
            _BannerTextContent(
              title: data.title,
              description: data.description,
            ),
          ],
        ),
      ),
    );
  }
}

// Приватный виджет текстого контента
class _BannerTextContent extends StatelessWidget {
  final String? title;
  final String? description;

  const _BannerTextContent({this.title, this.description});

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

// Приватный виджет для тултипа (белая плашка в углу)
class _BannerToolTip extends StatelessWidget {
  final String text;
  const _BannerToolTip({required this.text});

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

// Приватный виджет для градиента
class _BannerGradientOverlay extends StatelessWidget {
  const _BannerGradientOverlay();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black.withValues(alpha: 0.4)],
          ),
        ),
      ),
    );
  }
}
