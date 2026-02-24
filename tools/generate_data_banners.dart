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
    'Новое обновление',
    'Событие недели',
    'Эксклюзивно у нас',
    'Попробуйте сейчас',
    'Лидеры чартов',
    'Выбор редакции',
  ];

  final eventTitles = [
    'Лучшие экшен-игры в Google Play',
    'Топ приключений месяца',
    'Головоломки для всех',
    'Стратегии года',
    'Ролевые игры: эпические приключения',
    'Казуальные игры для отдыха',
    'Спортивные игры 2026',
    'Гонки: адреналин и скорость',
    'Файтинг: жаркие поединки',
    'Симуляторы: почувствуйте себя профи',
    'Игры на выживание',
    'Фэнтези миры ждут вас',
    'Открытый мир: бесконечные возможности',
    'Многопользовательские хиты',
    'Хоррор: проверьте свои нервы',
    'Зомби-апокалипсис',
    'Инди-жемчужины',
  ];

  // Категории должны совпадать с genres и tags в generate_data_games.dart
  final eventCategories = [
    'Экшен',
    'Приключения',
    'Головоломки',
    'Стратегии',
    'Ролевые',
    'Казуальные',
    'Спортивные',
    'Гонки',
    'Файтинг',
    'Симуляторы',
    'Выживание',
    'Фэнтези',
    'Открытый мир',
    'Многопользовательская',
    'Хоррор',
    'Зомби',
    'Инди',
  ];

  final eventDescriptions = [
    'Если казуальные головоломки вас не увлекают, возможно, стоит присмотреться к чему-то более динамичному. Представляем подборку лучших игр: вас ждут жаркие сражения и незабываемые приключения.',
    'Погрузитесь в захватывающий мир приключений и откройте для себя новые горизонты. Исследуйте неизведанные земли, решайте головоломки и преодолевайте препятствия.',
    'Проверьте свою логику и смекалку! Мы собрали лучшие головоломки, которые заставят ваш мозг работать на полную мощность.',
    'Продумывайте каждый ход и разрабатывайте идеальную стратегию. Эти игры требуют тактического мышления и долгосрочного планирования.',
    'Отправьтесь в эпическое путешествие по фантастическим мирам. Прокачивайте персонажей, сражайтесь с боссами и станьте легендой.',
  ];

  final bannerImages = List.generate(
    8,
    (i) => 'assets/images/banners/banner${i + 1}.webp',
  );

  int eventCounter = 1;

  for (int i = 1; i <= 100; i++) {
    final String id = 'b_$i';
    final int bannerTypeRoll = random.nextInt(100);

    // 60% ActionBanner, 30% EventBanner, 10% SimpleBanner
    final bool isAction = bannerTypeRoll < 60;
    final bool isEvent = !isAction && bannerTypeRoll < 90;

    final bannerData = {
      "id": id,
      "type": isAction ? 'action' : 'simple',
      "title": isEvent
          ? faker.randomGenerator.element(eventTitles)
          : faker.randomGenerator.element(bannerTitles),
      "description": faker.lorem.sentence(),
      "imageAssetPath": faker.randomGenerator.element(bannerImages),
    };
    if (random.nextDouble() < 0.70) {
      bannerData["topToolTipText"] = random.nextBool()
          ? "Рекомендуем"
          : "Новинка";
    }

    if (isAction) {
      // 1. Рандомно решаем, это игра или приложение
      final bool isGame = random.nextBool();
      final String productType = isGame ? "game" : "app";
      final String prefix = isGame ? "g" : "a";

      // 2. Генерируем ID с нужным префиксом (g_... или a_...)
      final int randomProductId = random.nextInt(1000) + 1;
      bannerData["productId"] = "${prefix}_$randomProductId";
      bannerData["productType"] = productType;
    } else if (isEvent) {
      // Event banner fields
      bannerData["eventId"] = "event_$eventCounter";
      bannerData["eventCategory"] = faker.randomGenerator.element(
        eventCategories,
      );
      bannerData["eventDescription"] = faker.randomGenerator.element(
        eventDescriptions,
      );
      eventCounter++;
    }

    bannersList.add(bannerData);
  }

  final file = File('assets/data/banners.json');
  await file.parent.create(recursive: true);
  await file.writeAsString(jsonEncode(bannersList));

  final actionCount = bannersList.where((b) => b['type'] == 'action').length;
  final eventCount = bannersList.where((b) => b['eventId'] != null).length;
  final simpleCount = bannersList.length - actionCount - eventCount;

  print('Generated ${bannersList.length} banners to ${file.path}');
  print('  - Action banners: $actionCount');
  print('  - Event banners: $eventCount');
  print('  - Simple banners: $simpleCount');
}
