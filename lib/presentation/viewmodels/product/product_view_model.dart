import 'package:flutter/material.dart';
import 'package:google_play/core/l10n/gen/app_localizations.dart';
import 'package:google_play/di/usecase_providers.dart';
import 'package:google_play/domain/usecases/products/get_product_by_id_usecase.dart';
import 'package:google_play/presentation/viewmodels/providers/locale_provider.dart';
import 'package:google_play/presentation/viewmodels/product/product_state.dart';
import 'package:google_play/presentation/viewmodels/product/ui_mappers/product_state_mapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_view_model.g.dart';

@Riverpod(keepAlive: true)
class ProductViewModel extends _$ProductViewModel {
  late final GetProductByIdUseCase _getProductByIdUseCase;

  @override
  ProductState build(String productId) {
    _getProductByIdUseCase = ref.read(getProductByIdUseCaseProvider);
    Future.microtask(() => loadById(productId));
    return const ProductState(isLoading: true);
  }

  Future<void> loadById(String id) async {
    final locale =
        ref.read(localeProvider) ?? WidgetsBinding.instance.platformDispatcher.locale;
    final l10n = lookupAppLocalizations(locale);

    state = state.copyWith(isLoading: true, productId: id, errorMessage: null);

    final product = await _getProductByIdUseCase(id);

    if (product == null) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Product not found',
      );
      return;
    }

    state = const ProductStateMapper().fromEntity(product, l10n, locale);
  }

  // Сбрасывает состояние
  void clear() => state = const ProductState();
}
