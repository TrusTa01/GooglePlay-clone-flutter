import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show SliverConstraints;
import 'package:google_play/presentation/viewmodels/product/ui_models/category_item_ui_model.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

class CategoryDetailsSection extends StatelessWidget {
  final List<CategoryItemUiModel> items;
  final bool isSliver;
  final ValueChanged<CategoryItemUiModel>? onProductTap;

  const CategoryDetailsSection({
    super.key,
    required this.items,
    this.isSliver = false,
    this.onProductTap,
  });

  static Widget asSliver({
    required List<CategoryItemUiModel> items,
    ValueChanged<CategoryItemUiModel>? onProductTap,
  }) {
    return CategoryDetailsSection(
      items: items,
      isSliver: true,
      onProductTap: onProductTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      debugPrint('Ошибка: items.isEmpty (category details section)');
      return isSliver
          ? const SliverToBoxAdapter(child: SizedBox.shrink())
          : const SizedBox.shrink();
    }

    final bool isBook = items.first.isBook;
    final double minItemWidth = isBook ? 110 : 125;
    final double aspectRatio = isBook ? 0.48 : 0.6;

    if (isSliver) {
      return SliverLayoutBuilder(
        builder: (BuildContext context, SliverConstraints constraints) {
          final double width = constraints.crossAxisExtent;
          final int crossAxisCount = ((width - 32) / minItemWidth)
              .floor()
              .clamp(2, 8);

          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: aspectRatio,
                mainAxisSpacing: 10,
                crossAxisSpacing: 15,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                final item = items[index];
                return KeyedSubtree(
                  key: ValueKey(item.id),
                  child: _buildItem(item),
                );
              }, childCount: items.length),
            ),
          );
        },
      );
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final int crossAxisCount = ((width - 32) / minItemWidth).floor().clamp(
          2,
          8,
        );

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: aspectRatio,
            mainAxisSpacing: 20,
            crossAxisSpacing: 15,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return KeyedSubtree(
              key: ValueKey(item.id),
              child: _buildItem(item),
            );
          },
        );
      },
    );
  }

  Widget _buildItem(CategoryItemUiModel item) {
    return GestureDetector(
      onTap: onProductTap != null ? () => onProductTap!(item) : null,
      child: ProductCardContent(model: item.card),
    );
  }
}
