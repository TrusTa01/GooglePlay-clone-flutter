import 'package:flutter/material.dart';

import '../../../../models/product_models/product_interface.dart';
import '../../../widgets.dart';

class ProductCarousel extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Product> products;

  const ProductCarousel({
    super.key,
    required this.title,
    this.subtitle = '',
    required this.products,
  });
  
  @override
  Widget build(BuildContext context) {
    // Размер слайдера 
    const double sliderHeight = 180;

    if (products.isEmpty) {
      debugPrint('Ошибка: products.isEmpty (product carousel)');
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Заголовок и кнопка больше
        ProductSectionHeader(
          title: title,
          subtitle: subtitle,
          padding: EdgeInsets.fromLTRB(22, 10, 22, 20),
          onTap: () {},
          showButton: true,
        ),

        // Слайдер
        SizedBox(
          height: sliderHeight,
          child: ListView.builder(
            key: PageStorageKey('carousel_$title'),
            // Отступ слева для первого элемента
            padding: const EdgeInsets.only(left: 22),
            scrollDirection: Axis.horizontal,
            physics: const PageScrollPhysics(),
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
