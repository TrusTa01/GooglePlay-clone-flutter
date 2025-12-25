// ignore_for_file: avoid_print
// Генерация Мок-данных баннеров

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:faker/faker.dart';

void main() async {
  final faker = Faker();
  final random = Random();
  final List<Map<String, dynamic>> bannersList = [];

  final bannerTitles = [
    'Новое обновление', 'Событие недели', 'Эксклюзивно у нас', 
    'Попробуйте сейчас', 'Лидеры чартов', 'Выбор редакции'
  ];

  final bannerImages = List.generate(8, (i) => 'assets/images/banners/banner${i + 1}.webp');

  for (int i = 1; i <= 100; i++) {
    final bool isAction = random.nextBool(); 
    final String id = 'b_$i'; 
    
    final bannerData = {
      "id": id,
      "type": isAction ? 'action' : 'simple',
      "title": faker.randomGenerator.element(bannerTitles),
      "description": faker.lorem.sentence(),
      "imageAssetPath": faker.randomGenerator.element(bannerImages),
      "hasTopToolTip": random.nextBool(),
      "topToolTipText": random.nextBool() ? "Рекомендуем" : "Новинка",
    };

    if (isAction) {
      // 1. Рандомно решаем, это игра или приложение
      final bool isGame = random.nextBool();
      final String productType = isGame ? "game" : "app";
      final String prefix = isGame ? "g" : "a";
      
      // 2. Генерируем ID с нужным префиксом (g_... или a_...)
      final int randomProductId = random.nextInt(1000) + 1;
      bannerData["productId"] = "${prefix}_$randomProductId"; 
      bannerData["productType"] = productType;
    }

    bannersList.add(bannerData);
  }

  final file = File('assets/data/banners.json');
  await file.parent.create(recursive: true);
  await file.writeAsString(jsonEncode(bannersList));

  print('Generated ${bannersList.length} banners with G_ and A_ ids to ${file.path}');
}