import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets.dart';
import '/providers/products_provider.dart';
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
                    const BannerGradientOverlay(),
                  ],
                ),
              ),
              if (isAction) ActionRow(banner: banner as ActionBanner),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionRow extends StatelessWidget {
  final ActionBanner banner;

  const ActionRow({required this.banner, super.key});

  @override
  Widget build(BuildContext context) {
    final product = context.read<ProductsProvider>().getProductById(
      banner.productId,
    );

    if (product == null) return const SizedBox.shrink();

    final game = product is Game ? product : null;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ProductCardIcon(
            iconUrl: product.iconUrl, // Берем путь из продукта
            iconWidth: 40,
            iconHeight: 40,
            cacheWidth: 150,
            cacheHeight: 150,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ProductTitle(
                  title: product.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(product.creator, style: const TextStyle(fontSize: 12)),
                    const Text(' • ', style: TextStyle(fontSize: 12)),
                    Text(
                      '${game?.ageRating ?? 0}+',
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(width: 5),
                    ProductRatingTag(rating: product.rating.toString()),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Colors.blue[700], // Замени на Constants.googleBlue
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            child: const Text('Установить'),
          ),
        ],
      ),
    );
  }
}
