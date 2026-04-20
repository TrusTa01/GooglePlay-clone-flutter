import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_play/core/constants/global_constants.dart';
import 'package:google_play/core/presentation/widgets/widgets.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_models/category_item_ui_model.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_models/product_preview_section_ui_model.dart';

/// Общая разметка списка продуктов категории (превью игр или сетка приложений/книг)
class CategoryOverviewSliverScroll extends StatelessWidget {
  final String appBarTitle;
  final bool isEmpty;
  final bool isGame;
  final ProductPreviewSectionUiModel? previewModel;
  final List<CategoryItemUiModel> items;
  final ValueChanged<String>? onProductTap;

  const CategoryOverviewSliverScroll({
    super.key,
    required this.appBarTitle,
    required this.isEmpty,
    required this.isGame,
    this.previewModel,
    this.items = const <CategoryItemUiModel>[],
    this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: Constants.sliderMaxContentWidth),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SimpleSliverAppBar(
                showLogo: false,
                showBackButton: true,
                onLeadingPressed: () => context.pop(),
                title: AppBarTitle(title: appBarTitle),
              ),
              if (isEmpty)
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: Text('No products')),
                )
              else if (isGame)
                ProductPreviewSection.asSliver(
                  productIds: previewModel!.productIds,
                  screenshotsByProductId: previewModel!.screenshotsByProductId,
                  actionRowsByProductId: previewModel!.actionRowsByProductId,
                  onProductTap: onProductTap,
                )
              else
                CategoryDetailsSection.asSliver(
                  items: items,
                  onProductTap: onProductTap != null
                      ? (item) => onProductTap!(item.id)
                      : null,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
