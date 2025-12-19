import 'package:flutter/material.dart';

import '/models/models.dart';
import '/widgets/widgets.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key, required this.product});

  final Product product;

  bool get showPrice => product.isPaid && product.price != null;

  @override
  Widget build(BuildContext context) {
    final utils = ScrollWidgetsUtils(product: product);

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {},
      child: Container(
        // Контейнер для контроля высоты
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: <Widget>[
            _buildIcon(),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(), // Название
                  const SizedBox(height: 2),
                  _buildDescription(), // Описание
                  const Spacer(),
                  _buildBottomRow(utils), // Нижняя строка
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        product.iconUrl,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      product.title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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

  Widget _buildBottomRow(ScrollWidgetsUtils utils) {
    return Row(
      children: <Widget>[
        utils.buildRatingTag(), // Рейтинг
        SizedBox(width: 10,),
        utils.buildSize(), // Размер
        const SizedBox(width: 10,),
        showPrice ? utils.buildPriceTag() : const SizedBox.shrink(), // Цена (если есть)
      ],
    );
  }
}
