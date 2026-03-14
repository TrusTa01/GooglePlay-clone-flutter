import 'package:google_play/di/usecase_providers.dart';
import 'package:google_play/presentation/viewmodels/home/home_state.dart';
import 'package:google_play/presentation/viewmodels/home/home_view_model.dart';
import 'package:google_play/presentation/viewmodels/home/store_tab_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeViewModelProvider =
    StateNotifierProvider.family<HomeViewModel, HomeState, StoreType>((
      ref,
      storeType,
    ) {
      final loadProductsUseCase = ref.watch(loadProductsUseCaseProvider);
      final getTabSectionsUseCase =
          ref.watch(getTabSectionsUseCaseProvider);

      return HomeViewModel(
        storeType: storeType,
        loadProductsUseCase: loadProductsUseCase,
        getTabSectionsUseCase: getTabSectionsUseCase,
      );
    });
