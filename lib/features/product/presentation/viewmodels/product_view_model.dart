import 'package:flutter/material.dart';
import 'package:google_play/core/l10n/gen/app_localizations.dart';
import 'package:google_play/di/usecase_providers.dart';
import 'package:google_play/features/product/domain/usecases/get_product_by_id_usecase.dart';
import 'package:google_play/features/shared/presentation/providers/locale_provider.dart';
import 'package:google_play/features/product/presentation/viewmodels/product_state.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_mappers/product_state_mapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_view_model.g.dart';

@Riverpod(keepAlive: true)
class ProductViewModel extends _$ProductViewModel {
  late final GetProductsByIdUseCase _getProductByIdUseCase;

  @override
  ProductState build(String productId) {
    final locale =
        ref.watch(localeProvider) ??
        WidgetsBinding.instance.platformDispatcher.locale;
    _getProductByIdUseCase = ref.read(getProductByIdUseCaseProvider);
    Future.microtask(() => loadById(productId, locale: locale));
    return const ProductState(isLoading: true);
  }

  Future<void> loadById(
    String id, {
    Locale? locale,
    bool forceRefresh = false,
  }) async {
    final effectiveLocale =
        locale ??
        ref.read(localeProvider) ??
        WidgetsBinding.instance.platformDispatcher.locale;
    final l10n = lookupAppLocalizations(effectiveLocale);

    state = state.copyWith(isLoading: true, productId: id, errorMessage: null);

    final product = await _getProductByIdUseCase(
      id: id,
      locale: effectiveLocale.languageCode,
      forceRefresh: forceRefresh,
    );

    if (product == null) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Product not found',
      );
      return;
    }

    state = const ProductStateMapper().fromEntity(
      product,
      l10n,
      effectiveLocale,
    );
  }

  // Сбрасывает состояние
  void clear() => state = const ProductState();
}
