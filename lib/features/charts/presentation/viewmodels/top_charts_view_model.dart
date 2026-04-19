import 'package:flutter/widgets.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/l10n/gen/app_localizations.dart';
import 'package:google_play/core/presentation/providers/locale_provider.dart';
import 'package:google_play/features/filters/presentation/widgets/filter_factory.dart';
import 'package:google_play/features/product/di/di.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_mappers/action_row_ui_mapper.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_mappers/product_state_mapper.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_models/action_row_ui_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'top_charts_view_model.g.dart';

@riverpod
Future<List<ActionRowUiModel>> topChartsItems(Ref ref, FilterType type) async {
  final locale =
      ref.watch(localeProvider) ??
      WidgetsBinding.instance.platformDispatcher.locale;
  final l10n = lookupAppLocalizations(locale);
  final loadProducts = ref.read(loadProductsUseCaseProvider);
  final products = await loadProducts(
    type: _mapFilterTypeToProductKind(type),
    locale: locale.languageCode,
  );

  const stateMapper = ProductStateMapper();
  const actionRowMapper = ActionRowUiMapper();

  return products
      .map((product) => stateMapper.fromEntity(product, l10n, locale))
      .map(actionRowMapper.fromStateGrid)
      .toList(growable: false);
}

ProductKind _mapFilterTypeToProductKind(FilterType type) {
  return switch (type) {
    FilterType.games => ProductKind.game,
    FilterType.apps => ProductKind.app,
    FilterType.books => ProductKind.book,
    FilterType.kidsAge => ProductKind.game,
  };
}
