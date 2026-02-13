import 'package:flutter/material.dart';
import 'package:google_play/models/models.dart';
import 'package:google_play/widgets/widgets.dart';

class BannerItem extends StatelessWidget {
  final AppBanner banner;
  final BannerType type;
  final VoidCallback? onTap;
  final double horizontalPadding;

  const BannerItem({
    super.key,
    required this.banner,
    this.onTap,
    required this.type,
    this.horizontalPadding = 6,
  });

  @override
  Widget build(BuildContext context) {
    // Проверяем, какой это тип баннера, чтобы понять, рисовать ли нижнюю плашку (ActionRow)
    final bool isAction = banner is ActionBanner;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    BannerImage(assetPath: banner.imageAssetPath),
                    if (banner.topToolTipText != null) ...[
                      BannerToolTip(text: banner.topToolTipText!),
                    ],
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
