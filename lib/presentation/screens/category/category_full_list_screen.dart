import 'package:flutter/material.dart';
import 'package:google_play/core/constants/constants.dart';
import 'package:google_play/core/extensions/l10n_extension.dart';
import 'package:google_play/domain/entities/products/game_entity.dart';
import 'package:google_play/domain/entities/products/product_entity.dart';
import 'package:google_play/presentation/viewmodels/product/ui_mappers/category_item_mapper.dart';
import 'package:google_play/presentation/viewmodels/product/ui_mappers/product_state_mapper.dart';
import 'package:google_play/presentation/viewmodels/product/ui_models/product_preview_section_ui_model.dart';
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
    if (products.isEmpty) {
      return Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SimpleSliverAppBar(
                showLogo: false,
                showBackButton: true,
                onLeadingPressed: () => Navigator.pop(context),
                title: AppBarTitle(title: title),
              ),
              const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(child: Text('No products')),
              ),
            ],
          ),
        ),
      );
    }

    final bool isGame = products.first is GameEntity;
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context);

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
                if (isGame)
                  () {
                    final previewModel =
                        ProductPreviewSectionUiModel.fromProducts(products);
                    return ProductPreviewSection.asSliver(
                      productIds: previewModel.productIds,
                      screenshotsByProductId:
                          previewModel.screenshotsByProductId,
                      actionRowsByProductId: previewModel.actionRowsByProductId,
                    );
                  }()
                else
                  () {
                    final stateMapper = ProductStateMapper();
                    final itemMapper = CategoryItemMapper();
                    final items = products
                        .map(
                          (product) =>
                              stateMapper.fromEntity(product, l10n, locale),
                        )
                        .map(itemMapper.fromState)
                        .toList(growable: false);
                    return CategoryDetailsSection.asSliver(items: items);
                  }(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
