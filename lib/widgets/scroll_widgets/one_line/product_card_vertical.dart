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
              ProductCardIcon(
                iconUrl: product.iconUrl, 
                iconWidth: 115, 
                iconHeight: 115, 
                cacheWidth: 300,
                ),
              const SizedBox(height: 6),
              SizedBox(
                width: 115,
                child: ProductTitle( // Название
                      title: product.title,
                      maxLines: 2,
                      fontSize: 12,
                    ),
              ), 
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
}