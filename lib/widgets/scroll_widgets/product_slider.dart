import 'package:flutter/material.dart';

import '/models/product_interface.dart';
import '/widgets/widgets.dart';

class ProductSlider extends StatelessWidget {
  const ProductSlider({super.key, required this.title, required this.items});
  final String title;
  final List<Product> items;

  @override
  Widget build(BuildContext context) {
    // Высота слайдера должна включать высоту карточки и отступы
    const double sliderHeight = 220; 

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Заголовок слайдера
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        
        const SizedBox(height: 12),

        SizedBox(
          height: sliderHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            // Отступ слева для первого элемента
            padding: const EdgeInsets.only(left: 16.0), 
            
            itemBuilder: (context, index) {
              final item = items[index];
              
              // Используем универсальную карточку
              return ProductCard(item: item);
            },
          ),
        ),
      ],
    );
  }
}
