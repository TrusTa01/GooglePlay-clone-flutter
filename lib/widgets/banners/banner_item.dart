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

    // Логика: если продукт — это Game или App, берем их поле. Иначе (книги) — false.
    bool containsPaidContent = false;
    if (product is Game) {
      containsPaidContent = product.containsPaidContent;
    } else if (product is App) {
      containsPaidContent = product.containsPaidContent;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          ProductCardIcon(
            borderRadius: BorderRadius.circular(12),
            iconUrl: product.iconUrl,
            iconWidth: 45,
            iconHeight: 45,
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
                    ProductCreatorText(creator: product.creator),
                    const Text(' • ', style: TextStyle(fontSize: 10)),
                    AgeBadge(age: product.ageRating),
                    const SizedBox(width: 5),
                    ProductRatingTag(rating: product.rating.toString()),
                  ],
                ),
              ],
            ),
          ),
          // Кнопка
          ActionRowButton(
            isPaid: product.isPaid,
            price: product.price,
            containsPaidContent: containsPaidContent,
          ),
        ],
      ),
    );
  }
}
