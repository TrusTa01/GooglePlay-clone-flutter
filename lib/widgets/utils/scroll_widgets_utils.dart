import 'package:flutter/material.dart';

import '/models/models.dart';
import '/widgets/widgets.dart';

class ScrollWidgetsUtils {
  const ScrollWidgetsUtils({required this.product});

  final Product product;
  String get _rating => product.rating.toString();
  String get _size => product.technicalInfo.toString();

  String get _price => (product.price != null)
      ? '${product.price!.toStringAsFixed(2).replaceFirst('.', ',')} ₽'
      : '';

  static Widget buildTitleButton({
    required String title,
    required VoidCallback onTap,
    required EdgeInsets padding,
  }) {
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

  Widget buildRatingTag() {
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

  Widget buildSize() {
    return Text(
      '$_size МБ',
      style: const TextStyle(color: Constants.defautTextColor, fontSize: 12),
    );
  }

  Widget buildPriceTag() {
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
