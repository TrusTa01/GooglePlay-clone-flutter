import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  // Фильтры для разных категорий
  String _selectedGameCategory = 'Все категории';
  String _selectedAppCategory = 'Все категории';
  String _selectedBookCategory = 'Жанр';
  String _selectedTopFilter = 'Топ бесплатных';
  final String _selectedRecentFilter = 'Новое';
  final String _selectedAgeFilter = 'Возраст';
  final String _selectedRatingFilter = 'По рейтингу';
  final String _selectedLanguageFilter = 'Язык';
  final String _selectedAbridgetVersionFilter = 'Сокращенное издание';
  final List<String> _selectedKidsFilters = [
    'До 5 лет',
    'От 6 до 8 лет',
    'От 9 до 12 лет',
  ];
  bool _isRecentFilterActive = false;

  // Геттеры
  String get selectedGameCategory => _selectedGameCategory;
  String get selectedAppCategory => _selectedAppCategory;
  String get selectedBookCategory => _selectedBookCategory;
  String get selectedTopFilter => _selectedTopFilter;
  String get selectedRecentFilter => _selectedRecentFilter;
  String get selectedAgeFilter => _selectedAgeFilter;
  String get selectedRatingFilter => _selectedRatingFilter;
  String get selectedLanguageFilter => _selectedLanguageFilter;
  String get selectedAbridgetVersionFilter => _selectedAbridgetVersionFilter;
  List<String> get selectedKidsFilters => _selectedKidsFilters;
  bool get isRecentFilterActive => _isRecentFilterActive;

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

  void updateBookCategory(String value) {
    _selectedBookCategory = value;
    notifyListeners();
  }

  void toggleRecentOnly() {
    _isRecentFilterActive = !_isRecentFilterActive;
    notifyListeners();
  }

  // Вспомогательный метод для конвертации возрастных меток
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
}
