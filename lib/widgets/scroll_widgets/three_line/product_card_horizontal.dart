import 'package:flutter/material.dart';

import '/models/models.dart';
import '/widgets/widgets.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key, required this.product});

  final Product product;

  bool get showPrice => product.isPaid && product.price != null;

  @override
  Widget build(BuildContext context) {
    final formatter = ProductDataFormatter(product);

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {},
      child: Container(
        // Контейнер для контроля высоты
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: <Widget>[
            ProductCardIcon(
              // Карточка
              iconUrl: product.iconUrl,
              iconWidth: 60,
              iconHeight: 60,
              cacheWidth: 180,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitle( // Название
                    title: product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14,
                  ), 
                  const SizedBox(height: 2),
                  _buildDescription(), // Описание
                  const Spacer(),
                  _ProductBottomInfo(
                    // Нижняя строка
                    formatter: formatter,
                    showPrice: showPrice,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      product.description,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 12),
    );
  }
}

class _ProductBottomInfo extends StatelessWidget {
  final ProductDataFormatter formatter;
  final bool showPrice;

  const _ProductBottomInfo({required this.formatter, required this.showPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ProductRatingTag(rating: formatter.rating), // Рейтинг
        SizedBox(width: 10),
        ProductSize(size: formatter.size), // Размер
        const SizedBox(width: 10),
        showPrice
            ? ProductPriceTag(price: formatter.price)
            : const SizedBox.shrink(), // Цена (если есть)
      ],
    );
  }
}
