import 'package:flutter/material.dart';

import '/models/product_interface.dart';
import '/widgets/widgets.dart';

class ProductSlider extends StatelessWidget {
  const ProductSlider({super.key, required this.title, required this.products});
  final String title;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    const double sliderHeight = 190;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Заголовок слайдера
        Padding(
          padding: const EdgeInsets.fromLTRB(22, 0, 22, 20),
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
            itemCount: products.length,
            itemBuilder: (context, index) {
              final item = products[index];
              return ProductCard(product: item);
            },
          ),
        ),
      ],
    );
  }
}
