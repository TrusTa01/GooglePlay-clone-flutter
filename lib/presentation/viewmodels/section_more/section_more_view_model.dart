import 'package:flutter/widgets.dart';
import 'package:google_play/core/l10n/gen/app_localizations.dart';
import 'package:google_play/core/l10n/gen/l10n_lookup.dart';
import 'package:google_play/di/usecase_providers.dart';
import 'package:google_play/features/product/domain/entities/game_entity.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/domain/entities/store/store_type.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_mappers/category_item_mapper.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_mappers/product_state_mapper.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_models/category_item_ui_model.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_models/product_preview_section_ui_model.dart';
import 'package:google_play/presentation/viewmodels/providers/locale_provider.dart';
import 'package:google_play/presentation/viewmodels/section_more/section_more_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'section_more_view_model.g.dart';

class SectionMoreArgs {
  final StoreType storeType;
  final String categoryKey;
  final String titleKey;

  const SectionMoreArgs({
    required this.storeType,
    required this.categoryKey,
    required this.titleKey,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SectionMoreArgs &&
          runtimeType == other.runtimeType &&
          storeType == other.storeType &&
          categoryKey == other.categoryKey &&
          titleKey == other.titleKey;

  @override
  int get hashCode =>
      storeType.hashCode ^ categoryKey.hashCode ^ titleKey.hashCode;
}

@riverpod
Future<SectionMoreState> sectionMoreViewModel(
  Ref ref,
  SectionMoreArgs args,
) async {
  final loadProducts = ref.read(loadProductsUseCaseProvider);
  final allProducts = await loadProducts(type: args.storeType.categoryKey);

  final filtered = _filterProducts(allProducts, args.categoryKey);

  final locale =
      ref.read(localeProvider) ??
      WidgetsBinding.instance.platformDispatcher.locale;
  final AppLocalizations l10n = lookupAppLocalizations(locale);

  final title = lookupL10n(l10n, args.titleKey);

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

  return SectionMoreState(
    title: title,
    isLoading: false,
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
