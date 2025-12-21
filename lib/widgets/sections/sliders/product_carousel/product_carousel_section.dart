import 'package:flutter/material.dart';

import '../../../../models/product_interface.dart';
import '../../../widgets.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({super.key, required this.title, required this.products});
  final String title;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    const double sliderHeight = 190;

    if (products.isEmpty) {
      debugPrint('Ошибка: products.isEmpty');
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Заголовок и кнопка больше
        ProductSectionTitle(
          title: title,
          padding: EdgeInsets.fromLTRB(22, 0, 22, 20),
          onTap: () {},
        ),

        // Слайдер
        SizedBox(
          height: sliderHeight,
          child: ListView.builder(
            // Отступ слева для первого элемента
            padding: const EdgeInsets.only(left: 22),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final item = products[index];
              return ProductCarouselCard(product: item);
            },
          ),
        ),
      ],
    );
  }
}
