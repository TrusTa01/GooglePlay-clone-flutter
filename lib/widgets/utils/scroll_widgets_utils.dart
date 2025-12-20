import 'package:flutter/material.dart';

import '/models/models.dart';
import '/widgets/widgets.dart';

class ProductDataFormatter {
  final Product product;
  ProductDataFormatter(this.product);

  String get rating => product.rating.toString();
  String get size => '${product.technicalInfo.toString()} МБ';

  String get price => (product.price != null)
      ? '${product.price!.toStringAsFixed(2).replaceFirst('.', ',')} ₽'
      : '';
}

class ProductSectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final EdgeInsets padding;
  const ProductSectionTitle({
    super.key,
    required this.title,
    required this.onTap,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: Constants.defaultFontWeight,
            ),
          ),

          // Кнопка больше напротив заголовка
          Material(
            color: Constants.ratingBackgroungColor,
            borderRadius: BorderRadius.circular(23),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 30,
                height: 34,
                alignment: Alignment.center,
                child: const Center(child: Icon(Icons.arrow_forward, size: 18)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductRatingTag extends StatelessWidget {
  final String rating;
  const ProductRatingTag({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Constants.ratingBackgroungColor,
      ),
      height: 20,
      width: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            rating,
            style: const TextStyle(
              color: Constants.defautTextColor,
              fontSize: 12,
            ),
          ),
          SizedBox(width: 2),
          Image.asset(
            'assets/icons/star.png',
            height: 10,
            color: const Color.fromARGB(255, 28, 94, 207),
          ),
        ],
      ),
    );
  }
}

class ProductPriceTag extends StatelessWidget {
  final String price;
  const ProductPriceTag({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Constants.ratingBackgroungColor,
      ),
      height: 20,
      width: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              price,
              style: const TextStyle(
                color: Constants.defautTextColor,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductSize extends StatelessWidget {
  final String size;
  const ProductSize({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      size,
      style: const TextStyle(color: Constants.defautTextColor, fontSize: 12),
    );
  }
}
