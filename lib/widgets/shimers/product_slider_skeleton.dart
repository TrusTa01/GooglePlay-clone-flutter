import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductSliderSkeleton extends StatelessWidget {
  const ProductSliderSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Заголовок (серый прямоугольник)
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(width: 150, height: 20, color: Colors.white),
        ),
        // Горизонтальный список скелетов карточек
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 140,
                margin: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(width: 140, height: 140, decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    )),
                    const SizedBox(height: 8),
                    Container(width: 100, height: 12, color: Colors.white),
                    const SizedBox(height: 4),
                    Container(width: 60, height: 12, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}