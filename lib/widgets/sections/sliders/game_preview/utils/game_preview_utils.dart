import 'package:flutter/material.dart';

import '../../../../widgets.dart';

class GameScreenshotImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double borderRadius;

  const GameScreenshotImage({
    super.key,
    required this.imageUrl,
    this.height = 180,
    this.borderRadius = 6,
  });

  @override
  Widget build(BuildContext context) {
    final bool isHorizontal = imageUrl.contains('horiz');
    final double currentWidth = isHorizontal ? 300 : 120;

    final int cacheWidth = (currentWidth * 3).toInt();
    final int cacheHeight = (height * 3).toInt();

    return GestureDetector(
      onTap: () {
        showGeneralDialog( // Cоздается в отдельном слое (Overlay), который находится над всеми Stack и навбарами.
          context: context,
          barrierDismissible: true,
          barrierLabel: "Close",
          barrierColor: Colors.black, // Цвет фона за картинкой
          pageBuilder: (context, anim1, anim2) {
            return FullScreenImage(imageUrl: imageUrl);
          },
        );
      },
      child: Hero(
        tag: imageUrl, // Уникальный тег для анимации перехода
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Image.asset(
            imageUrl,
            width: currentWidth,
            height: height,
            cacheWidth: cacheWidth,
            cacheHeight: cacheHeight,
            fit: BoxFit.cover,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded) return child;
              return frame != null
                  ? child
                  : ShimmerBox(
                      width: currentWidth,
                      height: height,
                      borderRadius: borderRadius,
                    );
            },
            errorBuilder: (context, error, stackTrace) => Container(
              width: currentWidth,
              height: height,
              color: Colors.grey[300],
              child: const Icon(Icons.broken_image, color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
