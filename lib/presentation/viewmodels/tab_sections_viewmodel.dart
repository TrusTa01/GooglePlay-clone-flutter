import 'package:google_play/presentation/state/tab_view_state.dart';

class TabSectionsViewmodel extends StateNotifier<TabViewState> {
  final GetTabSectionsWithContentUseCase _getSectionsUseCase;
  final String _tabKey;

  TabSectionsViewmodel({
    required GetTabSectionsWithContentUseCase getSectionsUseCase,
    required String tabKey,
  }) : _getSectionsUseCase = getSectionsUseCase,
       _tabKey = tabKey;

  Future<void> loadTab() async {
    state = const TabViewState.loading();
    try {
      final sections = await _getSectionsUseCase(_tabKey);
      state = TabViewState.content(sections: sections);
    } catch (e) {
      state = TabViewState.error(e.toString());
    }
  }
}
