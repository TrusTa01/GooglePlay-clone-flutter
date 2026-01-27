import 'package:flutter/material.dart';

import '../../../models/product_models/book_model.dart';
import '../../../models/product_models/product_interface.dart';
import '../../../screens/category/category_full_list_screen.dart';
import '../../widgets.dart';

class ProductCarousel extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Product> products;
  final bool isBookCarousel;
  final int? maxItems;

  const ProductCarousel({
    super.key,
    required this.title,
    this.subtitle = '',
    required this.products,
    this.isBookCarousel = false,
    this.maxItems,
  });

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      debugPrint('Ошибка: products.isEmpty (product carousel)');
      return const SizedBox.shrink();
    }

    // Размер слайдера
    final double sliderHeight = products.first is Book ? 230 : 180;

    // Ограничиваем количество продуктов, если задан maxItems
    final displayProducts = maxItems != null && maxItems! < products.length
        ? products.sublist(0, maxItems!)
        : products;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Заголовок и кнопка больше
        ProductSectionHeader(
          title: title,
          subtitle: subtitle,
          padding: EdgeInsets.fromLTRB(22, 10, 22, 20),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryFullListScreen(
                title: title,
                products: products,
              ),
            ),
          ),
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
            itemCount: displayProducts.length,
            itemBuilder: (context, index) {
              final item = displayProducts[index];
              return ProductCarouselCard(product: item);
            },
          ),
        ),
      ],
    );
  }
}
