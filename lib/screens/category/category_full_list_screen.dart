import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import '../../models/models.dart';

class CategoryFullListScreen extends StatelessWidget {
  final String title;
  final List<Product> products;

  const CategoryFullListScreen({
    super.key,
    required this.title,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final bool isGame = products.first is Game;

    return Scaffold(
      appBar: AppBars(
        type: AppBarType.transparent,
        showBackButton: true,
        onLeadingPressed: () => Navigator.pop(context),
        title: AppBarTitle(title: title),
      ),
      body: isGame
          ? GamePreviewSection(games: products.whereType<Game>().toList())
          : CategoryDetailsSection(products: products),
    );
  }
}
