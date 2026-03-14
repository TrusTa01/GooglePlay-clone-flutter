import 'package:google_play/domain/entities/sections/tab_config_entity.dart';
import 'package:google_play/domain/usecases/products/load_products_usecase.dart';
import 'package:google_play/domain/usecases/sections/get_tab_sections_usecase.dart';
import 'package:google_play/presentation/viewmodels/home/home_state.dart';
import 'package:google_play/presentation/viewmodels/home/store_tab_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  final StoreType storeType;
  final LoadProductsUseCase loadProductsUseCase;
  final GetTabSectionsUseCase getTabSectionsUseCase;

  HomeViewModel({
    required this.storeType,
    required this.loadProductsUseCase,
    required this.getTabSectionsUseCase,
  }) : super(const HomeState());

  Future<void> loadProducts() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final type = switch (storeType) {
        StoreType.apps => 'app',
        StoreType.games => 'game',
        StoreType.books => 'book',
      };

      final products = await loadProductsUseCase(type: type);
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
        tabKey: const AsyncValue<List<SectionEntity>>.loading(),
      },
    );

    try {
      final sections = await getTabSectionsUseCase(
        storeType: storeType,
        tabKey: tabKey,
      );

      state = state.copyWith(
        sectionsByTab: {
          ...state.sectionsByTab,
          tabKey: AsyncValue<List<SectionEntity>>.data(sections),
        },
      );
    } catch (e, st) {
      state = state.copyWith(
        sectionsByTab: {
          ...state.sectionsByTab,
          tabKey: AsyncValue<List<SectionEntity>>.error(e, st),
        },
      );
    }
  }
}
