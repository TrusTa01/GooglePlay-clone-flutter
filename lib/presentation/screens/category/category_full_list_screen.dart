import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';
import 'package:google_play/domain/entities/products/product_entity.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

class CategoryFullListScreen extends StatelessWidget {
  final String title;
  final List<ProductEntity> products;

  const CategoryFullListScreen({
    super.key,
    required this.title,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final bool isGame = products.first is Game;

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Constants.sliderMaxContentWidth,
          ),
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                SimpleSliverAppBar(
                  showLogo: false,
                  showBackButton: true,
                  onLeadingPressed: () => Navigator.pop(context),
                  title: AppBarTitle(title: title),
                ),
                isGame
                    ? ProductPreviewSection.asSliver(
                        item: products.whereType<Game>().toList(),
                      )
                    : CategoryDetailsSection.asSliver(products: products),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
