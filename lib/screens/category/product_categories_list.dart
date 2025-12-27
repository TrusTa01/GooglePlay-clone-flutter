import 'package:flutter/material.dart';

class ProductCategories {
  final String title;
  final IconData icon;
  final Color color;

  ProductCategories({
    required this.title,
    required this.icon,
    this.color = Colors.black,
  });
}

final List<ProductCategories> gamesCategories = [
  ProductCategories(title: 'Аркады', icon: Icons.videogame_asset_outlined),
  ProductCategories(title: 'Викторины', icon: Icons.quiz_outlined),
  ProductCategories(title: 'Головоломки', icon: Icons.extension_outlined),
  ProductCategories(title: 'Гонки', icon: Icons.directions_car_filled_outlined),
  ProductCategories(title: 'Казино', icon: Icons.casino_outlined),
  ProductCategories(title: 'Казуальные', icon: Icons.ads_click_outlined),
  ProductCategories(title: 'Карточные', icon: Icons.style_outlined),
  ProductCategories(title: 'Музыкальные', icon: Icons.music_note_outlined),
  ProductCategories(title: 'Настольные', icon: Icons.table_rows_outlined),
  ProductCategories(title: 'Обучающие', icon: Icons.school_outlined),
  ProductCategories(title: 'Приключения', icon: Icons.landscape_outlined),
  ProductCategories(title: 'Ролевые', icon: Icons.theater_comedy_outlined),
  ProductCategories(title: 'Симуляторы', icon: Icons.airplanemode_active_outlined),
  ProductCategories(title: 'Словесные', icon: Icons.text_fields_outlined),
  ProductCategories(title: 'Спортивные', icon: Icons.sports_soccer_outlined),
  ProductCategories(title: 'Стратегии', icon: Icons.grid_view_outlined),
  ProductCategories(title: 'Экшен', icon: Icons.bolt_outlined),
];

final List<ProductCategories> appsCategories = [
  ProductCategories(title: 'Автомобили и транспорт', icon: Icons.directions_bus_outlined),
  ProductCategories(title: 'Бизнес', icon: Icons.business_center_outlined),
  ProductCategories(title: 'Виеоплееры и редакторы', icon: Icons.video_camera_back_outlined),
  ProductCategories(title: 'Детям', icon: Icons.child_care_outlined),
  ProductCategories(title: 'Еда и напитки', icon: Icons.restaurant_outlined),
  ProductCategories(title: 'Жилье и дом', icon: Icons.home_work_outlined),
  ProductCategories(title: 'Здоровье и фитнес', icon: Icons.fitness_center_outlined),
  ProductCategories(title: 'Знакомства', icon: Icons.favorite_border_outlined),
  ProductCategories(title: 'Игры', icon: Icons.sports_esports_outlined),
  ProductCategories(title: 'Инструменты', icon: Icons.build_outlined),
  ProductCategories(title: 'Исскуство и дизайн', icon: Icons.palette_outlined),
  ProductCategories(title: 'Карты и навигации', icon: Icons.map_outlined),
  ProductCategories(title: 'Книги и справочники', icon: Icons.menu_book_outlined),
  ProductCategories(title: 'Комиксы', icon: Icons.auto_stories_outlined),
  ProductCategories(title: 'Красота', icon: Icons.face_retouching_natural_outlined),
  ProductCategories(title: 'Материнство и детство', icon: Icons.family_restroom_outlined),
  ProductCategories(title: 'Медицина', icon: Icons.medical_services_outlined),
  ProductCategories(title: 'Мероприятия', icon: Icons.event_available_outlined),
  ProductCategories(title: 'Музыка и аудио', icon: Icons.audiotrack_outlined),
  ProductCategories(title: 'Новости и журналы', icon: Icons.newspaper_outlined),
  ProductCategories(title: 'Образование', icon: Icons.history_edu_outlined),
  ProductCategories(title: 'Персонализация', icon: Icons.wallpaper_outlined),
  ProductCategories(title: 'Погода', icon: Icons.wb_sunny_outlined),
  ProductCategories(title: 'Покупки', icon: Icons.shopping_bag_outlined),
  ProductCategories(title: 'Приложения для часов', icon: Icons.watch_outlined),
  ProductCategories(title: 'Путешествия', icon: Icons.flight_takeoff_outlined),
  ProductCategories(title: 'Работа', icon: Icons.work_outline),
  ProductCategories(title: 'Развлечения', icon: Icons.movie_filter_outlined),
  ProductCategories(title: 'Разное', icon: Icons.category_outlined),
  ProductCategories(title: 'Связь', icon: Icons.chat_bubble_outline),
  ProductCategories(title: 'Социальные', icon: Icons.people_outline),
  ProductCategories(title: 'Спорт', icon: Icons.sports_basketball_outlined),
  ProductCategories(title: 'Стиль жизни', icon: Icons.self_improvement_outlined),
  ProductCategories(title: 'Финансы', icon: Icons.account_balance_wallet_outlined),
  ProductCategories(title: 'Фотография', icon: Icons.photo_camera_outlined),
  ProductCategories(title: 'Циферблаты', icon: Icons.watch_later_outlined),
];

final List<ProductCategories> booksCategories = [
  ProductCategories(title: 'Бизнес и инвестиции', icon: Icons.trending_up_outlined),
  ProductCategories(title: 'Биографии и мемуары', icon: Icons.person_search_outlined),
  ProductCategories(title: 'Детективы и триллеры', icon: Icons.fingerprint_outlined),
  ProductCategories(title: 'Для детей', icon: Icons.toys_outlined),
  ProductCategories(title: 'Для души и тела', icon: Icons.spa_outlined),
  ProductCategories(title: 'Здоровье и спорт', icon: Icons.monitor_weight_outlined),
  ProductCategories(title: 'История', icon: Icons.castle_outlined),
  ProductCategories(title: 'Компьютеры и технологии', icon: Icons.terminal_outlined),
  ProductCategories(title: 'Кулинария и домашнее хозяйство', icon: Icons.soup_kitchen_outlined),
  ProductCategories(title: 'Любовные романы', icon: Icons.volunteer_activism_outlined),
  ProductCategories(title: 'Саморазвитие', icon: Icons.psychology_outlined),
  ProductCategories(title: 'Фантастика и фэнтези', icon: Icons.auto_fix_high_outlined),
  ProductCategories(title: 'Художественная литература', icon: Icons.edit_note_outlined),
];