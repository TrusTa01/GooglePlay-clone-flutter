import 'package:flutter/material.dart';

class GameCategory {
  final String title;
  final IconData icon;
  final Color color;

  GameCategory({required this.title, required this.icon, this.color = Colors.blue});
}

final List<GameCategory> categories = [
  GameCategory(title: 'Аркады', icon: Icons.bolt),
  GameCategory(title: 'Викторины', icon: Icons.bolt),
  GameCategory(title: 'Головоломки', icon: Icons.bolt),
  GameCategory(title: 'Гонки', icon: Icons.bolt),
  GameCategory(title: 'Казино', icon: Icons.bolt),
  GameCategory(title: 'Казуальные', icon: Icons.bolt),
  GameCategory(title: 'Карточные', icon: Icons.bolt),
  GameCategory(title: 'Музыкальные', icon: Icons.bolt),
  GameCategory(title: 'Настольные', icon: Icons.bolt),
  GameCategory(title: 'Обучающие', icon: Icons.bolt),
  GameCategory(title: 'Приключения', icon: Icons.bolt),
  GameCategory(title: 'Ролевые', icon: Icons.bolt),
  GameCategory(title: 'Симуляторы', icon: Icons.bolt),
  GameCategory(title: 'Словесные', icon: Icons.bolt),
  GameCategory(title: 'Спортивные', icon: Icons.bolt),
  GameCategory(title: 'Стратегии', icon: Icons.bolt),
  GameCategory(title: 'Экшен', icon: Icons.bolt),
];