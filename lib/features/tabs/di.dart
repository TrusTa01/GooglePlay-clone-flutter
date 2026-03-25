import 'package:google_play/features/sections/di.dart';
import 'package:google_play/features/tabs/domain/usecases/get_available_tabs_usecase.dart';
import 'package:google_play/features/tabs/domain/usecases/get_tab_sections_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'di.g.dart';

@Riverpod(keepAlive: true)
GetTabSectionsUseCase getTabSectionsUseCase(Ref ref) {
  final repo = ref.watch(configRepositoryProvider);
  return GetTabSectionsUseCaseImpl(repo);
}

@Riverpod(keepAlive: true)
GetAvailableTabsUseCase getAvailableTabsUseCase(Ref ref) {
  final repo = ref.watch(configRepositoryProvider);
  return GetAvailableTabsUseCaseImpl(repo);
}
