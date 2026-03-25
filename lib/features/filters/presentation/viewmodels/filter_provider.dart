import 'package:google_play/features/filters/presentation/viewmodels/filter_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_provider.g.dart';

@riverpod
class Filter extends _$Filter {
  @override
  FilterState build() => FilterState.initial();

  void setTopFilter(String value) =>
      state = state.copyWith(selectedTopFilter: value);

  void updateGameCategory(String value) =>
      state = state.copyWith(selectedGameCategory: value);

  void updateAppCategory(String value) =>
      state = state.copyWith(selectedAppCategory: value);

  void updateBookGenre(String value) =>
      state = state.copyWith(selectedBookGenre: value);

  void setAgeFilter(String value) =>
      state = state.copyWith(selectedAgeFilter: value);

  void setRatingFilter(String value) =>
      state = state.copyWith(selectedRatingFilter: value);

  void setLanguageFilter(String value) =>
      state = state.copyWith(selectedLanguageFilter: value);

  void setAbridgedVersionFilter(String value) =>
      state = state.copyWith(selectedAbridgetVersionFilter: value);

  void toggleFilterOnly() =>
      state = state.copyWith(isFilterOnlyMode: !state.isFilterOnlyMode);

  void resetForGames() {
    state = state.copyWith(
      selectedGameCategory: 'categoryAll',
      selectedTopFilter: 'filterTopFreeOption',
      isFilterOnlyMode: false,
    );
  }

  void resetForApps() {
    state = state.copyWith(
      selectedAppCategory: 'categoryAll',
      selectedTopFilter: 'filterTopFreeOption',
      isFilterOnlyMode: false,
    );
  }

  void resetForBooks() {
    state = state.copyWith(
      selectedBookGenre: 'categoryBooksAll',
      selectedTopFilter: 'filterTopFreeOption',
      selectedAgeFilter: 'filterAll',
      selectedRatingFilter: 'ratingAll',
      selectedLanguageFilter: 'filterAll',
      selectedAbridgetVersionFilter: 'filterAll',
      isFilterOnlyMode: false,
    );
  }

  void resetForTabIndex(int tabIndex) {
    switch (tabIndex) {
      case 0:
        resetForGames();
        break;
      case 1:
        resetForApps();
        break;
      case 3:
        resetForBooks();
        break;
      default:
        break;
    }
  }

  // режим обзора категории
  void enableCategoryOverview({
    String? initialBookGenre,
    String? initialGameCategory,
    String? initialAppCategory,
  }) {
    state = state.copyWith(
      isCategoryOverviewMode: true,
      selectedTopFilter: '',
      selectedBookGenre: initialBookGenre ?? state.selectedBookGenre,
      selectedGameCategory: initialGameCategory ?? state.selectedGameCategory,
      selectedAppCategory: initialAppCategory ?? state.selectedAppCategory,
    );
  }
}
