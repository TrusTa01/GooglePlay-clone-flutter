import 'package:flutter/material.dart';
import 'package:google_play/core/constants/constants.dart';
import 'package:google_play/core/extensions/l10n_extension.dart';
import 'package:google_play/domain/entities/products/game_entity.dart';
import 'package:google_play/domain/entities/products/product_entity.dart';
import 'package:google_play/presentation/viewmodels/category/category_overview_view_model.dart';
import 'package:google_play/presentation/viewmodels/product/ui_mappers/category_item_mapper.dart';
import 'package:google_play/presentation/viewmodels/product/ui_mappers/product_state_mapper.dart';
import 'package:google_play/presentation/viewmodels/product/ui_models/product_preview_section_ui_model.dart';
import 'package:google_play/presentation/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryOverviewScreen extends ConsumerWidget {
  final String title;
  final String categoryKey;
  final List<ProductEntity> products;

  const CategoryOverviewScreen({
    super.key,
    required this.title,
    required this.categoryKey,
    required this.products,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      categoryOverviewViewModelProvider(
        CategoryOverviewArgs(
          title: title,
          categoryKey: categoryKey,
          products: products,
        ),
      ),
    );

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
                  showBackButton: true,
                  showLogo: false,
                  onLeadingPressed: () => Navigator.pop(context),
                  title: AppBarTitle(title: state.title),
                ),
                if (state.products.isEmpty)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(child: Text('No products')),
                  )
                else if (state.products.first is GameEntity)
                  () {
                    final previewModel =
                        ProductPreviewSectionUiModel.fromProducts(
                          state.products,
                        );
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
                    final l10n = context.l10n;
                    final locale = Localizations.localeOf(context);
                    final items = state.products
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
