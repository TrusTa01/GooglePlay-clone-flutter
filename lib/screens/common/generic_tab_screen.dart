import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';


class GenericTabScreen extends StatelessWidget {
  // Передаем сюда тип контента или уже готовый список секций
  final List<dynamic> sections; 

  const GenericTabScreen({super.key, required this.sections});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sections.length,
      itemBuilder: (context, index) {
        final section = sections[index];
        
        // Здесь логика: какой виджет секции рисовать
        if (section.type == 'carousel') {
          return ProductCarousel(title: section.title, products: section.products);
        } else if (section.type == 'grid') {
          return ProductGrid(title: section.title, products: section.products);
        }
        return const SizedBox.shrink();
      },
    );
  }
}