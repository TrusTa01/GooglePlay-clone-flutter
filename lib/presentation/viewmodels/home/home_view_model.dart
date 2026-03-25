import 'package:google_play/di/usecase_providers.dart';
import 'package:google_play/domain/entities/store/store_type.dart';
import 'package:google_play/features/product/domain/usecases/load_products_usecase.dart';
import 'package:google_play/features/sections/domain/usecases/resolve_section_usecase.dart';
import 'package:google_play/features/tabs/domain/usecases/get_tab_sections_usecase.dart';
import 'package:google_play/presentation/viewmodels/home/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  late final LoadProductsUseCase _loadProductsUseCase = ref.watch(
    loadProductsUseCaseProvider,
  );
  late final GetTabSectionsUseCase _getTabSectionsUseCase = ref.watch(
    getTabSectionsUseCaseProvider,
  );
  late final ResolveSectionUsecase _resolveSectionUsecase = ref.watch(
    resolveSectionUseCaseProvider,
  );

  @override
  HomeState build(StoreType storeType) => const HomeState();

  Future<void> loadProducts() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final products = await _loadProductsUseCase(type: storeType.categoryKey);
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
      final sections = await _getTabSectionsUseCase(
        storeType: storeType,
        tabKey: tabKey,
      );

      final resolvedSections = await Future.wait(
        sections.map((s) => _resolveSectionUsecase(s, storeType.categoryKey)),
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
