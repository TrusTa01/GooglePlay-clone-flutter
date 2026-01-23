import 'package:flutter/material.dart';

import '/models/product_models/book_model.dart';
import '../../../screens/product_screens/product_screen.dart';
import '../../../models/product_models/product_interface.dart';
import '../../widgets.dart';

class ProductCarouselCard extends StatelessWidget {
  final Product product;

  const ProductCarouselCard({super.key, required this.product});

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
              MaterialPageRoute(builder: (context) => ProductPageScreen()),
            );
          },
          onLongPress: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Карточка
              ProductCardThumbnail(
                borderRadius: product is Book ? BorderRadius.circular(6) : BorderRadius.circular(20),
                iconUrl: product.iconUrl,
                iconWidth: product is Book ? 110 : 115,
                iconHeight: product is Book ? 165 : 115,
                cacheWidth: 300,
                cacheHeight: 350,
                fit: product is Book ? BoxFit.fill : BoxFit.cover,
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: 115,
                child: ProductTitle(
                  // Название
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
                    ? ProductInfoTag(text: formatter.price)
                    : ProductInfoTag(
                        text: formatter.rating,
                        iconPath: 'assets/icons/star.png',
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
