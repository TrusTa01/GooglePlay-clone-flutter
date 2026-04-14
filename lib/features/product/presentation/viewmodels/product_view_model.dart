import 'package:flutter/material.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/features/product/di/di.dart';
import 'package:google_play/features/product/domain/use_cases/get_product_by_id_use_case.dart';
import 'package:google_play/features/product/domain/use_cases/get_similar_products_use_case.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_mappers/entity_to_card_mapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:google_play/core/l10n/gen/app_localizations.dart';
import 'package:google_play/core/presentation/providers/locale_provider.dart';
import 'package:google_play/features/product/presentation/viewmodels/product_state.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_mappers/product_state_mapper.dart';

part 'product_view_model.g.dart';

@riverpod
class ProductViewModel extends _$ProductViewModel {
  @override
  ProductState build((String productId, ProductKind productType) arg) {
    final locale = ref.watch(localeProvider);
    final (id, type) = arg;

    Future.microtask(() => loadById(id, type, locale: locale));

    return const ProductState(isLoading: true);
  }

  Future<void> loadById(
    String id,
    ProductKind type, {
    Locale? locale,
    bool forceRefresh = false,
  }) async {
    final effectiveLocale =
        locale ??
        ref.read(localeProvider) ??
        WidgetsBinding.instance.platformDispatcher.locale;
    final l10n = lookupAppLocalizations(effectiveLocale);
    final GetProductByIdUseCase getProductById = getProductByIdUseCase(ref);
    final GetSimilarProductsUseCase getSimilarProducts =
        getSimilarProductsUseCase(ref);

    state = state.copyWith(isLoading: true, id: id, errorMessage: null);

    final product = await getProductById(
      id: id,
      type: type,
      locale: effectiveLocale.languageCode,
      forceRefresh: forceRefresh,
    );

    if (product == null) {
      state = state.copyWith(isLoading: false, errorMessage: l10n.emptyNoData);
      return;
    }

    final similarProduct = await getSimilarProducts(
      product: product,
      type: type,
      locale: effectiveLocale.languageCode,
      pageSize: 10,
    );

    final baseState = const ProductStateMapper().fromEntity(
      product,
      l10n,
      effectiveLocale,
    );
    final cards = similarProduct
        .map((e) => mapEntityToCard(e, l10n, effectiveLocale))
        .toList();

    state = baseState.copyWith(isLoading: false, similarProducts: cards);
  }

  void clear() => state = const ProductState();
}
