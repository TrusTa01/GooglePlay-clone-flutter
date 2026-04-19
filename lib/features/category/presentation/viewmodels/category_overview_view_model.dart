import 'package:flutter/widgets.dart';
import 'package:google_play/core/l10n/gen/app_localizations.dart';
import 'package:google_play/features/product/di/di.dart';
import 'package:google_play/features/product/domain/entities/game_entity.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/features/category/data/product_categories_data.dart';
import 'package:google_play/features/category/presentation/viewmodels/category_overview_state.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_mappers/category_item_mapper.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_mappers/product_state_mapper.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_models/category_item_ui_model.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_models/product_preview_section_ui_model.dart';
import 'package:google_play/core/presentation/providers/locale_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_overview_view_model.g.dart';

class CategoryOverviewArgs {
  final String categoryKey;
  final ProductKind productKind;

  const CategoryOverviewArgs({
    required this.categoryKey,
    required this.productKind,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryOverviewArgs &&
          runtimeType == other.runtimeType &&
          categoryKey == other.categoryKey &&
          productKind == other.productKind;

  @override
  int get hashCode => categoryKey.hashCode ^ productKind.hashCode;
}

@riverpod
Future<CategoryOverviewState> categoryOverviewViewModel(
  Ref ref,
  CategoryOverviewArgs args,
) async {
  final locale =
      ref.watch(localeProvider) ??
      WidgetsBinding.instance.platformDispatcher.locale;
  final loadProducts = ref.read(loadProductsUseCaseProvider);
  final allProducts = await loadProducts(
    type: args.productKind,
    locale: locale.languageCode,
  );

  final filtered = _filterProducts(allProducts, args.categoryKey);
  final l10n = lookupAppLocalizations(locale);

  final title = _getCategoryTitle(args.categoryKey, args.productKind, l10n);

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
    categoryKey: args.categoryKey,
    isEmpty: isEmpty,
    isGame: isGame,
    previewModel: previewModel,
    items: items,
  );
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
