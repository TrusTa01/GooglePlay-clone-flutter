import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class ProductSliderSkeleton extends StatelessWidget {
  const ProductSliderSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: ShimmerBox(width: 150, height: 20),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Иконка
                  ShimmerBox(width: 140, height: 140),
                  const SizedBox(height: 8),
                  // Первая строка текста
                  ShimmerBox(width: 100, height: 12, borderRadius: 4),
                  const SizedBox(height: 4),
                  // Вторая строка текста
                  ShimmerBox(width: 60, height: 12, borderRadius: 4),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}