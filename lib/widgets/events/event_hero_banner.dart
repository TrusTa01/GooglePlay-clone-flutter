import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../widgets.dart';

class EventHeroBanner extends StatelessWidget {
  final SimpleBanner banner;

  const EventHeroBanner({
    super.key,
    required this.banner,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final bannerHeight = screenHeight * 0.4;

    return SizedBox(
      height: bannerHeight,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            banner.imageAssetPath,
            fit: BoxFit.cover,
            cacheHeight: (bannerHeight * MediaQuery.of(context).devicePixelRatio).toInt(),
          ),

          // Gradient overlay for text readability
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: bannerHeight * 0.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.7),
                  ],
                ),
              ),
            ),
          ),

          // Title at the bottom
          Positioned(
            bottom: 20,
            left: 22,
            right: 22,
            child: Text(
              banner.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                shadows: [
                  Shadow(
                    offset: Offset(0, 1),
                    blurRadius: 3,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),

          // Top tooltip if available
          if (banner.hasTopToolTip && banner.topToolTipText != null)
            Positioned(
              top: 16,
              left: 22,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Constants.ratingBackgroungColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  banner.topToolTipText!,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
