import 'package:flutter/widgets.dart';
import 'package:google_play/core/presentation/providers/locale_provider.dart';
import 'package:google_play/features/category/di/di.dart';
import 'package:google_play/features/product/di/di.dart';
import 'package:google_play/features/section_more/di/di.dart';
import 'package:google_play/features/section_more/presentation/viewmodels/section_more_args.dart';
import 'package:google_play/features/section_more/presentation/viewmodels/section_more_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'section_more_view_model.g.dart';

@riverpod
Future<SectionMoreState> sectionMoreViewModel(
  Ref ref,
  SectionMoreArgs args,
) async {
  final locale =
      ref.watch(localeProvider) ??
      WidgetsBinding.instance.platformDispatcher.locale;
  final loadProducts = ref.read(loadProductsUseCaseProvider);
  final allProducts = await loadProducts(
    type: args.productKind,
    locale: locale.languageCode,
  );

  final overview = ref.read(buildCategoryOverviewUseCaseProvider)(
    allProducts: allProducts,
    categoryKey: args.categoryKey,
    productKind: args.productKind,
    locale: locale,
  );

  return ref.read(buildSectionMoreStateUseCaseProvider)(
    overview: overview,
    barTitle: args.barTitle,
  );
}
