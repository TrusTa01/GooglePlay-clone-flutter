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
    final utils = ScrollWidgetsUtils(product: product);
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
                    ? utils.buildPriceTag()
                    : utils.buildRatingTag(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      height: 115,
      width: 115,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Constants.boxShadow,
            offset: const Offset(0, 2),
            blurRadius: 1.0,
            spreadRadius: 0,
          ),
        ],
        image: DecorationImage(
          image: AssetImage(product.iconUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return SizedBox(
      width: 110,
      child: Text(
        product.title,
        maxLines: 3,
        style: const TextStyle(fontSize: 13),
      ),
    );
  }
}
