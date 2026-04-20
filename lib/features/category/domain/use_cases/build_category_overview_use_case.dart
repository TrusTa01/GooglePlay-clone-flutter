import 'package:flutter/widgets.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/l10n/gen/app_localizations.dart';
import 'package:google_play/features/category/data/product_categories_data.dart';
import 'package:google_play/features/category/presentation/viewmodels/category_overview_state.dart';
import 'package:google_play/features/product/domain/entities/game_entity.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_mappers/category_item_mapper.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_mappers/product_state_mapper.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_models/category_item_ui_model.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_models/product_preview_section_ui_model.dart';

/// Собирает [CategoryOverviewState] из уже загруженного списка продуктов
final class BuildCategoryOverviewUseCase {
  const BuildCategoryOverviewUseCase();

  CategoryOverviewState call({
    required List<ProductEntity> allProducts,
    required String categoryKey,
    required ProductKind productKind,
    required Locale locale,
  }) {
    final filtered = _filterProducts(allProducts, categoryKey);
    final l10n = lookupAppLocalizations(locale);

    final title = _getCategoryTitle(categoryKey, productKind, l10n);

    final isEmpty = filtered.isEmpty;
    final isGame = !isEmpty && filtered.first is GameEntity;

    final previewModel = isGame
        ? ProductPreviewSectionUiModel.fromProducts(filtered)
        : null;

    final items = isGame
        ? const <CategoryItemUiModel>[]
        : filtered
              .map(
                (product) =>
                    ProductStateMapper().fromEntity(product, l10n, locale),
              )
              .map(CategoryItemMapper().fromState)
              .toList(growable: false);

    return CategoryOverviewState(
      title: title,
      categoryKey: categoryKey,
      isEmpty: isEmpty,
      isGame: isGame,
      previewModel: previewModel,
      items: items,
    );
  }
}

List<ProductEntity> _filterProducts(
  List<ProductEntity> products,
  String categoryKey,
) {
  if (_isAllCategory(categoryKey)) return List<ProductEntity>.from(products);
  return products.where((p) => p.categories.contains(categoryKey)).toList();
}

bool _isAllCategory(String key) =>
    key == 'categoryAll' || key == 'categoryBooksAll';

String _getCategoryTitle(
  String categoryKey,
  ProductKind type,
  AppLocalizations l10n,
) {
  final dataList = switch (type) {
    ProductKind.game => gamesCategoriesData,
    ProductKind.app => appsCategoriesData,
    ProductKind.book => booksGenresData,
  };

  final category = dataList
      .where((c) => c.titleL10nKey == categoryKey || c.title == categoryKey)
      .firstOrNull;
  if (category != null) {
    return resolveProductCategoryTitle(l10n, category);
  }
  return categoryKey;
}
