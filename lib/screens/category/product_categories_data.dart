import 'package:flutter/material.dart';

class ProductCategoriesData {
  final String title;
  final IconData? icon;
  final Color color;

  const ProductCategoriesData({
    required this.title,
    this.icon,
    this.color = Colors.black,
  });
}

final List<ProductCategoriesData> gamesCategoriesData = const [
  ProductCategoriesData(title: 'Все категории', icon: Icons.category_outlined),
  ProductCategoriesData(title: 'Аркады', icon: Icons.videogame_asset_outlined),
  ProductCategoriesData(title: 'Викторины', icon: Icons.quiz_outlined),
  ProductCategoriesData(title: 'Головоломки', icon: Icons.extension_outlined),
  ProductCategoriesData(title: 'Гонки', icon: Icons.directions_car_filled_outlined),
  ProductCategoriesData(title: 'Казино', icon: Icons.casino_outlined),
  ProductCategoriesData(title: 'Казуальные', icon: Icons.ads_click_outlined),
  ProductCategoriesData(title: 'Карточные', icon: Icons.style_outlined),
  ProductCategoriesData(title: 'Музыкальные', icon: Icons.music_note_outlined),
  ProductCategoriesData(title: 'Настольные', icon: Icons.table_rows_outlined),
  ProductCategoriesData(title: 'Обучающие', icon: Icons.school_outlined),
  ProductCategoriesData(title: 'Приключения', icon: Icons.landscape_outlined),
  ProductCategoriesData(title: 'Ролевые', icon: Icons.theater_comedy_outlined),
  ProductCategoriesData(title: 'Симуляторы', icon: Icons.airplanemode_active_outlined),
  ProductCategoriesData(title: 'Словесные', icon: Icons.text_fields_outlined),
  ProductCategoriesData(title: 'Спортивные', icon: Icons.sports_soccer_outlined),
  ProductCategoriesData(title: 'Стратегии', icon: Icons.grid_view_outlined),
  ProductCategoriesData(title: 'Экшен', icon: Icons.bolt_outlined),
];

final List<ProductCategoriesData> appsCategoriesData = const [
  ProductCategoriesData(title: 'Все категории', icon: Icons.category_outlined),
  ProductCategoriesData(title: 'Автомобили и транспорт', icon: Icons.directions_bus_outlined),
  ProductCategoriesData(title: 'Бизнес', icon: Icons.business_center_outlined),
  ProductCategoriesData(title: 'Виеоплееры и редакторы', icon: Icons.video_camera_back_outlined),
  ProductCategoriesData(title: 'Детям', icon: Icons.child_care_outlined),
  ProductCategoriesData(title: 'Еда и напитки', icon: Icons.restaurant_outlined),
  ProductCategoriesData(title: 'Жилье и дом', icon: Icons.home_work_outlined),
  ProductCategoriesData(title: 'Здоровье и фитнес', icon: Icons.fitness_center_outlined),
  ProductCategoriesData(title: 'Знакомства', icon: Icons.favorite_border_outlined),
  ProductCategoriesData(title: 'Игры', icon: Icons.sports_esports_outlined),
  ProductCategoriesData(title: 'Инструменты', icon: Icons.build_outlined),
  ProductCategoriesData(title: 'Исскуство и дизайн', icon: Icons.palette_outlined),
  ProductCategoriesData(title: 'Карты и навигации', icon: Icons.map_outlined),
  ProductCategoriesData(title: 'Книги и справочники', icon: Icons.menu_book_outlined),
  ProductCategoriesData(title: 'Комиксы', icon: Icons.auto_stories_outlined),
  ProductCategoriesData(title: 'Красота', icon: Icons.face_retouching_natural_outlined),
  ProductCategoriesData(title: 'Материнство и детство', icon: Icons.family_restroom_outlined),
  ProductCategoriesData(title: 'Медицина', icon: Icons.medical_services_outlined),
  ProductCategoriesData(title: 'Мероприятия', icon: Icons.event_available_outlined),
  ProductCategoriesData(title: 'Музыка и аудио', icon: Icons.audiotrack_outlined),
  ProductCategoriesData(title: 'Новости и журналы', icon: Icons.newspaper_outlined),
  ProductCategoriesData(title: 'Образование', icon: Icons.history_edu_outlined),
  ProductCategoriesData(title: 'Персонализация', icon: Icons.wallpaper_outlined),
  ProductCategoriesData(title: 'Погода', icon: Icons.wb_sunny_outlined),
  ProductCategoriesData(title: 'Покупки', icon: Icons.shopping_bag_outlined),
  ProductCategoriesData(title: 'Приложения для часов', icon: Icons.watch_outlined),
  ProductCategoriesData(title: 'Путешествия', icon: Icons.flight_takeoff_outlined),
  ProductCategoriesData(title: 'Работа', icon: Icons.work_outline),
  ProductCategoriesData(title: 'Развлечения', icon: Icons.movie_filter_outlined),
  ProductCategoriesData(title: 'Разное', icon: Icons.category_outlined),
  ProductCategoriesData(title: 'Связь', icon: Icons.chat_bubble_outline),
  ProductCategoriesData(title: 'Социальные', icon: Icons.people_outline),
  ProductCategoriesData(title: 'Спорт', icon: Icons.sports_basketball_outlined),
  ProductCategoriesData(title: 'Стиль жизни', icon: Icons.self_improvement_outlined),
  ProductCategoriesData(title: 'Финансы', icon: Icons.account_balance_wallet_outlined),
  ProductCategoriesData(title: 'Фотография', icon: Icons.photo_camera_outlined),
  ProductCategoriesData(title: 'Циферблаты', icon: Icons.watch_later_outlined),
];

final List<ProductCategoriesData> booksGenresData = const [
  ProductCategoriesData(title: 'Все категории', icon: Icons.category_outlined),
  ProductCategoriesData(title: 'Бизнес и инвестиции', icon: Icons.trending_up_outlined),
  ProductCategoriesData(title: 'Биографии и мемуары', icon: Icons.person_search_outlined),
  ProductCategoriesData(title: 'Детективы и триллеры', icon: Icons.fingerprint_outlined),
  ProductCategoriesData(title: 'Для детей', icon: Icons.toys_outlined),
  ProductCategoriesData(title: 'Для души и тела', icon: Icons.spa_outlined),
  ProductCategoriesData(title: 'Здоровье и спорт', icon: Icons.monitor_weight_outlined),
  ProductCategoriesData(title: 'История', icon: Icons.castle_outlined),
  ProductCategoriesData(title: 'Компьютеры и технологии', icon: Icons.terminal_outlined),
  ProductCategoriesData(title: 'Кулинария и домашнее хозяйство', icon: Icons.soup_kitchen_outlined),
  ProductCategoriesData(title: 'Любовные романы', icon: Icons.volunteer_activism_outlined),
  ProductCategoriesData(title: 'Саморазвитие', icon: Icons.psychology_outlined),
  ProductCategoriesData(title: 'Фантастика и фэнтези', icon: Icons.auto_fix_high_outlined),
  ProductCategoriesData(title: 'Художественная литература', icon: Icons.edit_note_outlined),
];

 final List<ProductCategoriesData> topFilterOptions = const [
  ProductCategoriesData(title: 'Топ бесплатных'),
  ProductCategoriesData(title: 'Бестселлеры'),
  ProductCategoriesData(title: 'Топ платных'),
];

final List<ProductCategoriesData> ageFilterData = const [
  ProductCategoriesData(title: 'Все'),
  ProductCategoriesData(title: 'До 5 лет'),
  ProductCategoriesData(title: 'От 6 до 8 лет'),
  ProductCategoriesData(title: 'От 9 до 12 лет'),
  ProductCategoriesData(title: 'От 13 лет'),
];

final List<ProductCategoriesData> byRating = const [
  ProductCategoriesData(title: 'Все'),
  ProductCategoriesData(title: '4,5★ и выше'),
  ProductCategoriesData(title: '4,0★ и выше'),
];

final List<ProductCategoriesData> languagesData = const [
  ProductCategoriesData(title: 'Все'),
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
  ProductCategoriesData(title: 'Все'),
  ProductCategoriesData(title: 'Сокращенная версия'),
  ProductCategoriesData(title: 'Полная версия'),
];