import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  // Фильтры для разных категорий
  String _selectedGameCategory = 'Все категории';
  String _selectedAppCategory = 'Все категории';
  String _selectedBookGenre = 'Все';
  String _selectedTopFilter = 'Топ бесплатных';
  final String _selectedRecentFilter = 'Новое';
  String _selectedAgeFilter = 'Все';
  String _selectedRatingFilter = 'Все';
  String _selectedLanguageFilter = 'Все';
  String _selectedAbridgetVersionFilter = 'Все';
  final List<String> _selectedKidsFilters = [
    'До 5 лет',
    'От 6 до 8 лет',
    'От 9 до 12 лет',
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

  // Вспомогательный метод для конвертации возрастных меток (для игр/приложений)
  Map<String, int> getAgeRangeFromLabel(String ageLabel) {
    int minAge = 0;
    int maxAge = 999;

    switch (ageLabel) {
      case 'До 5 лет':
        minAge = 0;
        maxAge = 5;
        break;
      case 'От 6 до 8 лет':
        minAge = 6;
        maxAge = 8;
        break;
      case 'От 9 до 12 лет':
        minAge = 9;
        maxAge = 12;
        break;
      case 'От 13 лет':
      case '13+ лет':
        minAge = 13;
        maxAge = 999;
        break;
      default:
        minAge = 0;
        maxAge = 999;
    }
    return {'minAge': minAge, 'maxAge': maxAge};
  }

  // Вспомогательный метод для получения минимального рейтинга из фильтра
  double? getMinRatingFromFilter(String ratingFilter) {
    switch (ratingFilter) {
      case '4,5★ и выше':
        return 4.5;
      case '4,0★ и выше':
        return 4.0;
      default:
        return null; // 'Все' - без фильтрации по рейтингу
    }
  }

  void resetForGames() {
    _selectedGameCategory = 'Все категории';
    _selectedTopFilter = 'Топ бесплатных';
    _isFilterOnlyMode = false;
    notifyListeners();
  }

  void resetForApps() {
    _selectedAppCategory = 'Все категории';
    _selectedTopFilter = 'Топ бесплатных';
    _isFilterOnlyMode = false;
    notifyListeners();
  }

  void resetForBooks() {
    _selectedBookGenre = 'Все';
    _selectedTopFilter = 'Топ бесплатных';
    _selectedAgeFilter = 'Все';
    _selectedRatingFilter = 'Все';
    _selectedLanguageFilter = 'Все';
    _selectedAbridgetVersionFilter = 'Все';
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
