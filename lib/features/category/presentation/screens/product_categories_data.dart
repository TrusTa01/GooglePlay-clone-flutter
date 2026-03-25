import 'package:flutter/material.dart';

class ProductCategoriesData {
  final String? titleL10nKey;
  final String? title;
  final IconData? icon;
  final Color color;

  const ProductCategoriesData({
    this.titleL10nKey,
    this.title,
    this.icon,
    this.color = Colors.black,
  });

  String get value => titleL10nKey ?? title ?? '';
}

final List<ProductCategoriesData> gamesCategoriesData = const [
  ProductCategoriesData(titleL10nKey: 'categoryAll', icon: Icons.category_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryGamesArcade', icon: Icons.videogame_asset_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryGamesTrivia', icon: Icons.quiz_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryGamesPuzzle', icon: Icons.extension_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryGamesRacing', icon: Icons.directions_car_filled_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryGamesCasino', icon: Icons.casino_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryGamesCasual', icon: Icons.ads_click_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryGamesCard', icon: Icons.style_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryGamesMusic', icon: Icons.music_note_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryGamesBoard', icon: Icons.table_rows_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryGamesEducational', icon: Icons.school_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryGamesAdventure', icon: Icons.landscape_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryGamesRolePlaying', icon: Icons.theater_comedy_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryGamesSimulation', icon: Icons.airplanemode_active_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryGamesWord', icon: Icons.text_fields_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryGamesSports', icon: Icons.sports_soccer_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryGamesStrategy', icon: Icons.grid_view_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryGamesAction', icon: Icons.bolt_outlined),
];

final List<ProductCategoriesData> appsCategoriesData = const [
  ProductCategoriesData(titleL10nKey: 'categoryAll', icon: Icons.category_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsCars', icon: Icons.directions_bus_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsBusiness', icon: Icons.business_center_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsVideo', icon: Icons.video_camera_back_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsFood', icon: Icons.restaurant_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsHouse', icon: Icons.home_work_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsHealth', icon: Icons.fitness_center_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsDating', icon: Icons.favorite_border_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsTools', icon: Icons.build_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsArt', icon: Icons.palette_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsMaps', icon: Icons.map_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsBooks', icon: Icons.menu_book_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsComics', icon: Icons.auto_stories_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsBeauty', icon: Icons.face_retouching_natural_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsParenting', icon: Icons.family_restroom_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsMedical', icon: Icons.medical_services_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsEvents', icon: Icons.event_available_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsMusicAudio', icon: Icons.audiotrack_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsNews', icon: Icons.newspaper_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsEducation', icon: Icons.history_edu_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsPersonalization', icon: Icons.wallpaper_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsWeather', icon: Icons.wb_sunny_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsShopping', icon: Icons.shopping_bag_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsWatch', icon: Icons.watch_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsTravel', icon: Icons.flight_takeoff_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsWork', icon: Icons.work_outline),
  ProductCategoriesData(titleL10nKey: 'categoryAppsEntertainment', icon: Icons.movie_filter_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsOther', icon: Icons.category_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsCommunication', icon: Icons.chat_bubble_outline),
  ProductCategoriesData(titleL10nKey: 'categoryAppsSocial', icon: Icons.people_outline),
  ProductCategoriesData(titleL10nKey: 'categoryAppsSports', icon: Icons.sports_basketball_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsLifestyle', icon: Icons.self_improvement_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsFinance', icon: Icons.account_balance_wallet_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsPhoto', icon: Icons.photo_camera_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryAppsWatchFaces', icon: Icons.watch_later_outlined),
];

final List<ProductCategoriesData> booksGenresData = const [
  ProductCategoriesData(titleL10nKey: 'categoryBooksAll', icon: Icons.category_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryBooksBusiness', icon: Icons.trending_up_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryBooksBiography', icon: Icons.person_search_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryBooksDetective', icon: Icons.fingerprint_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryBooksChildren', icon: Icons.toys_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryBooksMindBody', icon: Icons.spa_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryBooksHealthSports', icon: Icons.monitor_weight_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryBooksHistory', icon: Icons.castle_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryBooksComputers', icon: Icons.terminal_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryBooksCooking', icon: Icons.soup_kitchen_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryBooksRomance', icon: Icons.volunteer_activism_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryBooksSelfHelp', icon: Icons.psychology_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryBooksFantasy', icon: Icons.auto_fix_high_outlined),
  ProductCategoriesData(titleL10nKey: 'categoryBooksFiction', icon: Icons.edit_note_outlined),
];

final List<ProductCategoriesData> topFilterOptions = const [
  ProductCategoriesData(titleL10nKey: 'filterTopFreeOption'),
  ProductCategoriesData(titleL10nKey: 'filterBestsellers'),
  ProductCategoriesData(titleL10nKey: 'filterTopPaid'),
];

final List<ProductCategoriesData> ageFilterData = const [
  ProductCategoriesData(titleL10nKey: 'filterAll'),
  ProductCategoriesData(titleL10nKey: 'ageUnder5'),
  ProductCategoriesData(titleL10nKey: 'age6to8'),
  ProductCategoriesData(titleL10nKey: 'age9to12'),
  ProductCategoriesData(titleL10nKey: 'age13plus'),
];

final List<ProductCategoriesData> byRating = const [
  ProductCategoriesData(titleL10nKey: 'ratingAll'),
  ProductCategoriesData(titleL10nKey: 'rating45Up'),
  ProductCategoriesData(titleL10nKey: 'rating40Up'),
];

final List<ProductCategoriesData> languagesData = const [
  ProductCategoriesData(titleL10nKey: 'filterAll'),
  ProductCategoriesData(title: 'Čeština'),
  ProductCategoriesData(title: 'Dansk'),
  ProductCategoriesData(title: 'Deutsch'),
  ProductCategoriesData(title: 'English'),
  ProductCategoriesData(title: 'Español'),
  ProductCategoriesData(title: 'Français'),
  ProductCategoriesData(title: 'Indonesia'),
  ProductCategoriesData(title: 'Italiano'),
  ProductCategoriesData(title: 'Magyar'),
  ProductCategoriesData(title: 'Melayu'),
  ProductCategoriesData(title: 'Nederlands'),
  ProductCategoriesData(title: 'Norsk bokmål'),
  ProductCategoriesData(title: 'Polski'),
  ProductCategoriesData(title: 'Português'),
  ProductCategoriesData(title: 'Română'),
  ProductCategoriesData(title: 'Slovenčina'),
  ProductCategoriesData(title: 'Suomi'),
  ProductCategoriesData(title: 'Svenska'),
  ProductCategoriesData(title: 'Tiếng Việt'),
  ProductCategoriesData(title: 'Türkçe'),
  ProductCategoriesData(title: 'Ελληνικά'),
  ProductCategoriesData(title: 'Русский'),
  ProductCategoriesData(title: 'українська'),
  ProductCategoriesData(title: 'עברית'),
  ProductCategoriesData(title: 'العربية'),
  ProductCategoriesData(title: 'मराठी'),
  ProductCategoriesData(title: 'हिंदी'),
  ProductCategoriesData(title: 'বাংলা'),
  ProductCategoriesData(title: 'தமிழ்'),
  ProductCategoriesData(title: 'ไทย'),
  ProductCategoriesData(title: '한국어'),
  ProductCategoriesData(title: '日本語'),
  ProductCategoriesData(title: '中文'),
];

final List<ProductCategoriesData> abridgetVersion = const [
  ProductCategoriesData(titleL10nKey: 'filterAll'),
  ProductCategoriesData(titleL10nKey: 'versionAbridged'),
  ProductCategoriesData(titleL10nKey: 'versionFull'),
];
