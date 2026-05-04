import 'package:flutter/widgets.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/features/category/di/di.dart';
import 'package:google_play/features/category/presentation/viewmodels/category_overview_state.dart';
import 'package:google_play/features/product/di/di.dart';
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

  return ref.read(buildCategoryOverviewUseCaseProvider)(
    allProducts: allProducts,
    categoryKey: args.categoryKey,
    productKind: args.productKind,
    locale: locale,
  );
}
