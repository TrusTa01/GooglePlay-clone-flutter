import 'package:flutter/material.dart';

import '/widgets/widgets.dart';

class BannerImage extends StatelessWidget {
  final String assetPath;
  
  const BannerImage({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Constants.boxShadow,
            offset: const Offset(0, 2),
            blurRadius: 4.0,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          assetPath,
          cacheWidth: 800,
          fit: BoxFit.cover, // Важно: cover заполнит всё пространство
          errorBuilder: (context, error, stackTrace) => const SizedBox(
            height: 180, // Задай дефолтную высоту для ошибки
            child: Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}