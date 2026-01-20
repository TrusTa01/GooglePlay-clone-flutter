import 'package:flutter/material.dart';

import '../widgets.dart';
import '/models/models.dart';

class BannerItem extends StatelessWidget {
  final AppBanner banner;
  final BannerType type;
  final VoidCallback? onTap;

  const BannerItem({
    super.key,
    required this.banner,
    this.onTap,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    // Проверяем, какой это тип баннера, чтобы понять, рисовать ли нижнюю плашку (ActionRow)
    final bool isAction = banner is ActionBanner;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    BannerImage(assetPath: banner.imageAssetPath),
                    if (banner.topToolTipText != null)
                      BannerToolTip(text: banner.topToolTipText!),
                    BannerTextContent(
                      title: banner.title,
                      description: banner.description,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              if (isAction)
                ActionRow(banner: banner as ActionBanner, showButton: true),
            ],
          ),
        ),
      ),
    );
  }
}
