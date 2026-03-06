import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

class ProductPreviewSection extends StatelessWidget {
  final List<Product> item;
  final bool nestedInScrollView;
  final bool showButton;
  final bool isSliver;

  const ProductPreviewSection({
    super.key,
    required this.item,
    this.nestedInScrollView = false,
    this.showButton = false,
    this.isSliver = false,
  });

  static Widget asSliver({required List<Product> item}) {
    return ProductPreviewSection(
      item: item,
      nestedInScrollView: false,
      isSliver: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (item.isEmpty) {
      debugPrint('Ошибка: products.isEmpty (game preview section)');
      return isSliver
          ? const SliverToBoxAdapter(child: SizedBox.shrink())
          : const SizedBox.shrink();
    }

    if (isSliver) {
      return SliverPadding(
        padding: const EdgeInsets.only(left: 22),
        sliver: SliverList.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 35),
          itemCount: item.length,
          itemBuilder: (context, index) => ProductPreviewCard(
            key: ValueKey(item[index].id),
            product: item[index],
          ),
        ),
      );
    }

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: Constants.sliderMaxContentWidth),
        child: ListView.separated(
          shrinkWrap: nestedInScrollView,
          physics: nestedInScrollView
              ? const NeverScrollableScrollPhysics()
              : null,
          padding: const EdgeInsets.only(left: 22),
          separatorBuilder: (context, index) => const SizedBox(height: 35),
          itemCount: item.length,
          itemBuilder: (context, index) => ProductPreviewCard(
            key: ValueKey(item[index].id),
            product: item[index],
          ),
        ),
      ),
    );
  }
}
