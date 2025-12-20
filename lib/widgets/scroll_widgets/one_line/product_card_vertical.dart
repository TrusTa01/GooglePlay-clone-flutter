import 'package:flutter/material.dart';

import '/screens/details/product_detail_screen.dart';
import '/models/product_interface.dart';
import '/widgets/widgets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  bool get showPrice => product.isPaid && product.price != null;

  @override
  Widget build(BuildContext context) {
    final formatter = ProductDataFormatter(product);

    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(product: product),
              ),
            );
          },
          onLongPress: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Карточка
              _buildCard(),
              const SizedBox(height: 6),
              // Название
              _buildTitle(),
              const SizedBox(height: 4),
              // Рейтинг
              Align(
                alignment: Alignment.centerLeft,
                child: showPrice
                    ? ProductPriceTag(price: formatter.price)
                    : ProductRatingTag(rating: formatter.rating),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard() {
   return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        product.iconUrl,
        width: 115,
        height: 115,
        cacheWidth: 300,
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
    return SizedBox(
      width: 115,
      child: Text(
        product.title,
        maxLines: 3,
        style: const TextStyle(fontSize: 13),
      ),
    );
  }
}
