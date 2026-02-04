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

  // Константы размеров карточек
  static const double _bookCardWidth = 115;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      debugPrint('Ошибка: products.isEmpty (product carousel)');
      return const SizedBox.shrink();
    }

    final bool isBook = products.first is Book;
    
    // Фиксированные размеры карточек
    final double cardWidth = isBook ? _bookCardWidth : Constants.sliderCardWidth;
    final double cardHeight = isBook ? cardWidth * 1.5 : cardWidth;
    final double sliderHeight = cardHeight + 70; // +65 для текста и рейтинга

    // Ограничиваем количество продуктов, если задан maxItems
    final displayProducts = maxItems != null && maxItems! < products.length
        ? products.sublist(0, maxItems!)
        : products;

    // Рассчитываем максимальную ширину контента (8 карточек)
    final double maxContentWidth = Constants.sliderMaxContentWidth;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxContentWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок и кнопка больше
            ProductSectionHeader(
              title: title,
              subtitle: subtitle,
              padding: Constants.horizontalContentPadding.copyWith(
                top: 10,
                bottom: 20,
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CategoryFullListScreen(title: title, products: products),
                ),
              ),
              showButton: true,
            ),

            // Слайдер
            SizedBox(
              height: sliderHeight,
              child: ListView.builder(
                key: PageStorageKey('carousel_$title'),
                clipBehavior: Clip
                .none, // Элементы будут визуально выезжать за пределы контейнера
                padding: Constants.horizontalContentPadding,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: displayProducts.length,
                itemBuilder: (context, index) {
                  final item = displayProducts[index];
                  return ProductCarouselCard(product: item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
