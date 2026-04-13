import 'dart:ui';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/presentation/providers/locale_provider.dart';
import 'package:google_play/features/sections/domain/use_cases/get_sections_use_case.dart';
import 'package:google_play/features/store/presentation/viewmodels/home_state.dart';
import 'package:google_play/features/product/domain/use_cases/load_products_use_case.dart';
import 'package:google_play/features/tabs/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  late final _loadProductsUseCase = ref.watch(loadProductsUseCaseProvider);
  late final _getTabSectionsUseCase = ref.watch(getTabsUsecaseProvider);

  @override
  HomeState build(ProductKind productKind) {
    ref.listen(localeProvider, (_, _) {
      loadProducts();
      final tabs = state.sectionsByTab.keys.toList(growable: false);
      for (final tabKey in tabs) {
        loadTabSections(tabKey);
      }
    });
    return const HomeState();
  }

  Future<void> loadProducts() async {
    state = state.copyWith(isLoading: true, error: null);
    final locale =
        ref.read(localeProvider) ?? PlatformDispatcher.instance.locale;

    try {
      final products = await _loadProductsUseCase(
        type: productKind.name,
        locale: locale.languageCode,
      );
      state = state.copyWith(isLoading: false, products: products);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e);
    }
  }

  Future<void> loadTabSections(String tabKey) async {
    final current = state.sectionsByTab[tabKey];
    if (current is AsyncLoading) return;

    state = state.copyWith(
      sectionsByTab: {
        ...state.sectionsByTab,
        tabKey: const AsyncValue<List<ResolvedSection>>.loading(),
      },
    );

    try {
      final locale =
          ref.read(localeProvider) ?? PlatformDispatcher.instance.locale;
      final sections = await _getTabSectionsUseCase(
        productKind: productKind,
        tabKey: tabKey,
      );

      final resolvedSections = await Future.wait(
        sections.map(
          (s) => _resolveSectionUsecase(s, productKind.name, locale.languageCode),
        ),
      );

      state = state.copyWith(
        sectionsByTab: {
          ...state.sectionsByTab,
          tabKey: AsyncValue<List<ResolvedSection>>.data(resolvedSections),
        },
      );
    } catch (e, st) {
      state = state.copyWith(
        sectionsByTab: {
          ...state.sectionsByTab,
          tabKey: AsyncValue<List<ResolvedSection>>.error(e, st),
        },
      );
    }
  }
}
