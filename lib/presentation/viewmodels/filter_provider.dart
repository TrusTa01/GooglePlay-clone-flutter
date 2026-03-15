import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  // Filter values are l10n keys (e.g. categoryAll, filterTopFreeOption); selection/comparison by key.
  String _selectedGameCategory = 'categoryAll';
  String _selectedAppCategory = 'categoryAll';
  String _selectedBookGenre = 'categoryBooksAll';
  String _selectedTopFilter = 'filterTopFreeOption';
  final String _selectedRecentFilter = 'filterRecent';
  String _selectedAgeFilter = 'filterAll';
  String _selectedRatingFilter = 'ratingAll';
  String _selectedLanguageFilter = 'filterAll';
  String _selectedAbridgetVersionFilter = 'filterAll';
  final List<String> _selectedKidsFilters = [
    'ageUnder5',
    'age6to8',
    'age9to12',
    'age13plus',
  ];
  /// Режим «только этот фильтр»: когда true, учитывается только выбранный
  /// ToggleFilter (например «Новое»), остальные топ-фильтры не применяются.
  bool _isFilterOnlyMode = false;
  /// Режим обзора категории: только фильтр по категории/жанру, без «Топ бесплатных» и остальных.
  bool _isCategoryOverviewMode = false;

  // Конструктор по умолчанию
  FilterProvider();

  // Именованный конструктор для книг с настройками по умолчанию
  FilterProvider.forBooks({
    String? selectedTopFilter,
    bool? filterOnlyMode,
  }) {
    if (selectedTopFilter != null) {
      _selectedTopFilter = selectedTopFilter;
    }
    if (filterOnlyMode != null) {
      _isFilterOnlyMode = filterOnlyMode;
    }
  }

  // Режим обзора категории: только категория/жанр, топ-фильтр не активен и не применяется.
  FilterProvider.forCategoryOverview({
    String? initialBookGenre,
    String? initialGameCategory,
    String? initialAppCategory,
  }) {
    _isCategoryOverviewMode = true;
    _selectedTopFilter = ''; // чтобы getFilteredProducts не применял «Топ бесплатных» и т.п.
    if (initialBookGenre != null) _selectedBookGenre = initialBookGenre;
    if (initialGameCategory != null) _selectedGameCategory = initialGameCategory;
    if (initialAppCategory != null) _selectedAppCategory = initialAppCategory;
  }

  // Геттеры
  String get selectedGameCategory => _selectedGameCategory;
  String get selectedAppCategory => _selectedAppCategory;
  String get selectedBookGenre => _selectedBookGenre;
  String get selectedTopFilter => _selectedTopFilter;
  String get selectedRecentFilter => _selectedRecentFilter;
  String get selectedAgeFilter => _selectedAgeFilter;
  String get selectedRatingFilter => _selectedRatingFilter;
  String get selectedLanguageFilter => _selectedLanguageFilter;
  String get selectedAbridgetVersionFilter => _selectedAbridgetVersionFilter;
  List<String> get selectedKidsFilters => _selectedKidsFilters;
  bool get isFilterOnlyMode => _isFilterOnlyMode;
  bool get isCategoryOverviewMode => _isCategoryOverviewMode;

  // Методы для изменения фильтров
  void setTopFilter(String value) {
    _selectedTopFilter = value;
    notifyListeners();
  }

  void updateGameCategory(String value) {
    _selectedGameCategory = value;
    notifyListeners();
  }

  void updateAppCategory(String value) {
    _selectedAppCategory = value;
    notifyListeners();
  }

  void updateBookGenre(String value) {
    _selectedBookGenre = value;
    notifyListeners();
  }

  void setAgeFilter(String value) {
    _selectedAgeFilter = value;
    notifyListeners();
  }

  void setRatingFilter(String value) {
    _selectedRatingFilter = value;
    notifyListeners();
  }

  void setLanguageFilter(String value) {
    _selectedLanguageFilter = value;
    notifyListeners();
  }

  void setAbridgedVersionFilter(String value) {
    _selectedAbridgetVersionFilter = value;
    notifyListeners();
  }

  /// Переключает режим «только этот фильтр» (для ToggleFilter, например «Новое»).
  void toggleFilterOnly() {
    _isFilterOnlyMode = !_isFilterOnlyMode;
    notifyListeners();
  }

  /// [ageLabel] is l10n key: ageUnder5, age6to8, age9to12, age13plus.
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

  /// [ratingFilter] is l10n key: rating45Up, rating40Up; ratingAll or unknown => null.
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

  void resetForGames() {
    _selectedGameCategory = 'categoryAll';
    _selectedTopFilter = 'filterTopFreeOption';
    _isFilterOnlyMode = false;
    notifyListeners();
  }

  void resetForApps() {
    _selectedAppCategory = 'categoryAll';
    _selectedTopFilter = 'filterTopFreeOption';
    _isFilterOnlyMode = false;
    notifyListeners();
  }

  void resetForBooks() {
    _selectedBookGenre = 'categoryBooksAll';
    _selectedTopFilter = 'filterTopFreeOption';
    _selectedAgeFilter = 'filterAll';
    _selectedRatingFilter = 'ratingAll';
    _selectedLanguageFilter = 'filterAll';
    _selectedAbridgetVersionFilter = 'filterAll';
    _isFilterOnlyMode = false;
    notifyListeners();
  }
  
  // Универсальный метод сброса по индексу вкладки
  void resetForTabIndex(int tabIndex) {
    switch (tabIndex) {
      case 0: // Games
        resetForGames();
        break;
      case 1: // Apps
        resetForApps();
        break;
      case 3: // Books (индекс 3 т.к. Search на индексе 2)
        resetForBooks();
        break;
      default:
        break;
    }
  }
}
