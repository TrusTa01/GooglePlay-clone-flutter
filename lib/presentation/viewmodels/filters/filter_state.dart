import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_state.freezed.dart';

@freezed
abstract class FilterState with _$FilterState {
  const factory FilterState({
    @Default('categoryAll') String selectedGameCategory,
    @Default('categoryAll') String selectedAppCategory,
    @Default('categoryBooksAll') String selectedBookGenre,
    @Default('filterTopFreeOption') String selectedTopFilter,
    @Default('filterRecent') String selectedRecentFilter,
    @Default('filterAll') String selectedAgeFilter,
    @Default('ratingAll') String selectedRatingFilter,
    @Default('filterAll') String selectedLanguageFilter,
    @Default('filterAll') String selectedAbridgetVersionFilter,
    @Default(['ageUnder5', 'age6to8', 'age9to12', 'age13plus'])
    List<String> selectedKidsFilters,
    @Default(false) bool isFilterOnlyMode,
    @Default(false) bool isCategoryOverviewMode,
  }) = _FilterState;

  const FilterState._();

  Map<String, int> getAgeRangeFromLabel(String ageLabel) {
    int minAge = 0;
    int maxAge = 999;
    switch (ageLabel) {
      case 'ageUnder5':
        minAge = 0;
        maxAge = 5;
        break;
      case 'age6to8':
        minAge = 6;
        maxAge = 8;
        break;
      case 'age9to12':
        minAge = 9;
        maxAge = 12;
        break;
      case 'age13plus':
        minAge = 13;
        maxAge = 999;
        break;
      default:
        minAge = 0;
        maxAge = 999;
    }
    return {'minAge': minAge, 'maxAge': maxAge};
  }

  double? getMinRatingFromFilter(String ratingFilter) {
    switch (ratingFilter) {
      case 'rating45Up':
        return 4.5;
      case 'rating40Up':
        return 4.0;
      default:
        return null;
    }
  }

  factory FilterState.initial() => const FilterState();
}
