import 'package:flutter/material.dart';

import '/screens/details/product_detail_screen.dart';
import '/models/product_interface.dart';
import '/widgets/widgets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.item});

  final Product item;
  String get _rating => item.rating.toStringAsFixed(1);
  String get _price => (item.price != null)
      ? '${item.price!.toStringAsFixed(2).replaceFirst('.', ',')} ₽'
      : '';

  bool get showPrice => item.isPaid && item.price != null;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(product: item),
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
                child: showPrice ? _buildPriceTag() : _buildRatingTag(),
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
          image: AssetImage(item.iconUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return SizedBox(
      width: 110,
      child: Text(
        item.title,
        maxLines: 3,
        style: const TextStyle(fontSize: 13),
      ),
    );
  }

  Widget _buildRatingTag() {
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
            _rating,
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

  Widget _buildPriceTag() {
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
              _price,
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
