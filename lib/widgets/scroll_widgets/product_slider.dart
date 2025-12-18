import 'package:flutter/material.dart';

import '/models/product_interface.dart';
import '/widgets/widgets.dart';

class ProductSlider extends StatelessWidget {
  const ProductSlider({super.key, required this.title, required this.items});
  final String title;
  final List<Product> items;

  @override
  Widget build(BuildContext context) {
    const double sliderHeight = 190;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Заголовок слайдера
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 17),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: Constants.defaultFontWeight),
          ),
        ),

        SizedBox(
          height: sliderHeight,
          child: ListView.builder(
            // Отступ слева для первого элемента
            padding: const EdgeInsets.only(left: 22),
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ProductCard(item: item);
            },
          ),
        ),
      ],
    );
  }
}
