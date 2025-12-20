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
                  _buildBottomRow(formatter), // Нижняя строка
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
        cacheWidth: 180,
        fit: BoxFit.cover,
        // TODO: сделать универсальный еррор билдер
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey[200], // Серый фон вместо дырки
            child: const Center(
              child: Icon(Icons.broken_image, color: Colors.grey),
            ),
          );
        },
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

  Widget _buildBottomRow(ProductDataFormatter formatter) {
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
