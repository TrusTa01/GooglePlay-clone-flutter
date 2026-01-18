import 'package:flutter/material.dart';

import '../../../../models/models.dart';
import '../../../widgets.dart';

class ProductGridCard extends StatelessWidget {
  const ProductGridCard({super.key, required this.product});

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
        // child: ActionRow(
        //   showGenre: false,
        //   iconWidth: 60,
        //   iconHeight: 60,
        //   cacheWidth: 180,
        //   cacheHeight: 180,
        // ),
        child: Row(
          children: <Widget>[
            ProductCardIcon(
              // Карточка
              borderRadius: BorderRadius.circular(12),
              iconUrl: product.iconUrl,
              iconWidth: 60,
              iconHeight: 60,
              cacheWidth: 180,
              cacheHeight: 180,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitle(
                    // Название
                    title: product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14,
                  ),
                  const SizedBox(height: 2),
                  ProductDescription(
                    description: product.description,
                  ), // Описание
                  const Spacer(),
                  ProductBottomInfo(
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
}