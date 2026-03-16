import 'package:flutter/material.dart';
import 'package:google_play/core/l10n/gen/app_localizations.dart';
import 'package:google_play/domain/entities/products/product_entity.dart';
import 'package:google_play/presentation/viewmodels/product/product_details_state.dart';
import 'package:google_play/presentation/viewmodels/product/product_details_state_mapper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ViewModel страницы продукта (детали, хедер, поддержка)
/// Состояние строится из [ProductEntity] через [ProductDetailsStateMapper];
/// виджеты читают только [state], без проверок типа и кастов
class ProductDetailsViewModel extends StateNotifier<ProductDetailsState> {
  final ProductDetailsStateMapper _mapper;

  ProductDetailsViewModel({ProductDetailsStateMapper? mapper})
      : _mapper = mapper ?? const ProductDetailsStateMapper(),
        super(const ProductDetailsState());

  /// Обновляет состояние по сущности продукта и текущей локали
  /// Вызывается из экрана, когда есть [product] и [BuildContext] (для l10n и locale)
  void updateFromProduct(
    ProductEntity product,
    AppLocalizations l10n,
    Locale locale,
  ) {
    state = _mapper.fromEntity(product, l10n, locale);
  }

  // Сбрасывает состояние
  void clear() {
    state = const ProductDetailsState();
  }
}
