// ignore_for_file: avoid_print
// Генерация мок-данных приложений

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:faker/faker.dart';

void main() async {
  final faker = Faker();
  final Random random = Random();
  final List<Map<String, dynamic>> appsList = [];

  final prefixWords = [
    'Smart',
    'Quick',
    'Easy',
    'Pro',
    'Plus',
    'Master',
    'Super',
    'Mega',
    'Ultra',
    'Prime',
    'Cloud',
    'Digital',
    'My',
    'Social',
    'Best',
    'Top',
    'Fast',
    'Secure',
    'Safe',
    'Power',
    'Boost',
    'Max',
    'Elite',
    'Premium',
    'Daily',
    'Instant',
    'Auto',
    'Simple',
    'Perfect',
    'Pure',
    'Bright',
    'Smart',
    'Next',
    'Future',
    'Modern',
    'Advanced',
    'Expert',
    'Universal',
    'Global',
    'Local',
    'Personal',
    'Private',
    'Express',
    'Direct',
    'True',
    'Real',
    'Active',
    'Live',
    'Dynamic',
    'Flex',
  ];

  final suffixWords = [
    'Chat',
    'Talk',
    'Connect',
    'Link',
    'Share',
    'Post',
    'Feed',
    'Stream',
    'Play',
    'Music',
    'Video',
    'Photo',
    'Pic',
    'Snap',
    'Edit',
    'Studio',
    'Creator',
    'Maker',
    'Builder',
    'Manager',
    'Tracker',
    'Monitor',
    'Scanner',
    'Reader',
    'Viewer',
    'Player',
    'Browser',
    'Explorer',
    'Finder',
    'Search',
    'Shop',
    'Store',
    'Market',
    'Cart',
    'Pay',
    'Wallet',
    'Bank',
    'Money',
    'Budget',
    'Finance',
    'Health',
    'Fitness',
    'Diet',
    'Workout',
    'Coach',
    'Guide',
    'Learn',
    'Teach',
    'Study',
    'Book',
    'Note',
    'Task',
    'Planner',
    'Organizer',
    'Calendar',
    'Reminder',
    'Timer',
    'Clock',
    'Weather',
    'News',
    'Map',
    'Travel',
    'Trip',
    'Hotel',
    'Flight',
    'Food',
    'Recipe',
    'Cook',
    'Delivery',
    'Ride',
    'Drive',
    'Parking',
  ];

  final appTags = [
    'Облачное хранилище',
    'Видеозвонки',
    'Редактор фото',
    'Доставка еды',
    'Стриминг',
    'Офлайн режим',
    'Синхронизация',
    'Уведомления в реальном времени',
    'Мессенджер',
    'Социальная сеть',
    'Фильтры',
    'Коллажи',
    'Анимация',
    'Музыка',
    'Подкасты',
    'Видеоредактор',
    'Шопинг',
    'Скидки',
    'Доставка',
    'Отслеживание заказов',
    'Онлайн-оплата',
    'Безопасность',
    'Шифрование',
    'Конфиденциальность',
    'Резервное копирование',
    'Виджеты',
    'Темная тема',
    'Персонализация',
    'Мультиязычность',
    'GPS',
    'Карты',
    'Навигация',
    'AR технологии',
    'Сканер QR',
    'Календарь',
    'Напоминания',
    'Заметки',
    'Списки дел',
    'Продуктивность',
    'Тайм-менеджмент',
    'Работа',
    'Списки',
    'Утилиты',
    'Развлечения',
  ];

  final icons = [
    'assets/icons/apps_icons/aliexpress.webp',
    'assets/icons/apps_icons/amazon_shopping.webp',
    'assets/icons/apps_icons/best_buy.webp',
    'assets/icons/apps_icons/burger_king.webp',
    'assets/icons/apps_icons/canva.webp',
    'assets/icons/apps_icons/capcut.webp',
    'assets/icons/apps_icons/chatgpt.webp',
    'assets/icons/apps_icons/cookpad.webp',
    'assets/icons/apps_icons/crumbl.webp',
    'assets/icons/apps_icons/crunchyroll.webp',
    'assets/icons/apps_icons/dick_s_sportimg_goods.webp',
    'assets/icons/apps_icons/discord.webp',
    'assets/icons/apps_icons/disney.webp',
    'assets/icons/apps_icons/duolingowebp.webp',
    'assets/icons/apps_icons/ebay.webp',
    'assets/icons/apps_icons/etsy.webp',
    'assets/icons/apps_icons/facebook.webp',
    'assets/icons/apps_icons/firefox.webp',
    'assets/icons/apps_icons/gap.webp',
    'assets/icons/apps_icons/google_chrome.webp',
    'assets/icons/apps_icons/google_gemini.webp',
    'assets/icons/apps_icons/grok.webp',
    'assets/icons/apps_icons/hbo_max.webp',
    'assets/icons/apps_icons/hulu.webp',
    'assets/icons/apps_icons/ikea.webp',
    'assets/icons/apps_icons/instagram.webp',
    'assets/icons/apps_icons/joom.webp',
    'assets/icons/apps_icons/kfc.webp',
    'assets/icons/apps_icons/krita.webp',
    'assets/icons/apps_icons/lightroom_photo.webp',
    'assets/icons/apps_icons/likee.webp',
    'assets/icons/apps_icons/locket_widget.webp',
    'assets/icons/apps_icons/mcdonald_s.webp',
    'assets/icons/apps_icons/microsoft_edge.webp',
    'assets/icons/apps_icons/microsoft_powerpoint.webp',
    'assets/icons/apps_icons/miro.webp',
    'assets/icons/apps_icons/netflix.webp',
    'assets/icons/apps_icons/nike.webp',
    'assets/icons/apps_icons/opera.webp',
    'assets/icons/apps_icons/paramount.webp',
    'assets/icons/apps_icons/paypal.webp',
    'assets/icons/apps_icons/photoshop.webp',
    'assets/icons/apps_icons/picsart.webp',
    'assets/icons/apps_icons/pinterest.webp',
    'assets/icons/apps_icons/pizza_hut.webp',
    'assets/icons/apps_icons/sephora.webp',
    'assets/icons/apps_icons/shein.webp',
    'assets/icons/apps_icons/sketchbook.webp',
    'assets/icons/apps_icons/smule.webp',
    'assets/icons/apps_icons/snapchat.webp',
    'assets/icons/apps_icons/spotify.webp',
    'assets/icons/apps_icons/taco_bell_fast_food.webp',
    'assets/icons/apps_icons/target.webp',
    'assets/icons/apps_icons/telegram.webp',
    'assets/icons/apps_icons/temu.webp',
    'assets/icons/apps_icons/threads.webp',
    'assets/icons/apps_icons/tiktok.webp',
    'assets/icons/apps_icons/uber.webp',
    'assets/icons/apps_icons/uber_eats.webp',
    'assets/icons/apps_icons/venmo.webp',
    'assets/icons/apps_icons/viber.webp',
    'assets/icons/apps_icons/walmart.webp',
    'assets/icons/apps_icons/wattpad.webp',
    'assets/icons/apps_icons/wechat.webp',
    'assets/icons/apps_icons/wendy_s.webp',
    'assets/icons/apps_icons/whatsapp_messenger.webp',
    'assets/icons/apps_icons/widgetable.webp',
    'assets/icons/apps_icons/wikipedia.webp',
    'assets/icons/apps_icons/xbox.webp',
    'assets/icons/apps_icons/yahoo_mail.webp',
    'assets/icons/apps_icons/youtube.webp',
    'assets/icons/apps_icons/zip.webp',
  ];

  final screenshots = [
    'assets/images/apps_screenshots/app_screenshot_vert1.webp',
    'assets/images/apps_screenshots/app_screenshot_vert2.webp',
    'assets/images/apps_screenshots/app_screenshot_vert3.webp',
    'assets/images/apps_screenshots/app_screenshot_vert4.webp',
    'assets/images/apps_screenshots/app_screenshot_vert5.webp',
  ];

  final List<int> ageRatings = [3, 5, 6, 8, 9, 12, 16, 18];

  final permissions = [
    'Камера',
    'Микрофон',
    'Геолокация',
    'Контакты',
    'Хранилище',
    'Уведомления',
    'Календарь',
    'Фото',
    'Видео',
    'Bluetooth',
  ];

  final languages = ['RU', 'EN', 'ES', 'FR', 'DE', 'IT', 'PT', 'ZH', 'JA', 'KO'];

  final appCategories = [
    'Автомобили и транспорт',
    'Бизнес',
    'Виеоплееры и редакторы',
    'Детям',
    'Еда и напитки',
    'Жилье и дом',
    'Здоровье и фитнес',
    'Знакомства',
    'Игры',
    'Инструменты',
    'Исскуство и дизайн',
    'Карты и навигации',
    'Книги и справочники',
    'Комиксы',
    'Красота',
    'Материнство и детство',
    'Медицина',
    'Мероприятия',
    'Музыка и аудио',
    'Новости и журналы',
    'Образование',
    'Персонализация',
    'Погода',
    'Покупки',
    'Приложения для часов',
    'Путешествия',
    'Работа',
    'Развлечения',
    'Разное',
    'Связь',
    'Социальные',
    'Спорт',
    'Стиль жизни',
    'Финансы',
    'Фотография',
    'Циферблаты',
  ];

  final companies = [
    'google',
    'microsoft',
    'meta',
    'apple',
    'amazon',
    'netflix',
    'spotify',
    'adobe',
    'telegram',
    'discord',
    'zoom',
    'slack',
    'dropbox',
    'evernote',
    'notion',
    'trello',
    'asana',
    'canva',
    'figma',
    'unity',
  ];

  // Основной цикл генерации
  for (int i = 1; i <= 300; i++) {
    // Генерируем ID с префиксом 'a' (app)
    final String id = 'a_$i';

    final String prefix = faker.randomGenerator.element(prefixWords);
    final String suffix = faker.randomGenerator.element(suffixWords);
    final int randomSuffix = faker.randomGenerator.integer(9, min: 1);

    final String generatedTitle = '$prefix $suffix $randomSuffix';

    // Логика цены (10% шанс, что isPaid будет true)
    final bool isPaid = faker.randomGenerator.integer(100) < 10;
    double? price;

    if (isPaid) {
      final int wholeAmount = faker.randomGenerator.integer(1500, min: 50);
      price = wholeAmount.toDouble();
    }

    // Логика иконок
    final String localIcon = faker.randomGenerator.element(icons);

    // Логика скриншотов (5 случайных вертикальных)
    final List<String> selectedScreenshots = List.generate(
      5,
      (_) => faker.randomGenerator.element(screenshots),
    );

    // Логика дат
    final DateTime releaseDate = faker.date.dateTime(
      minYear: 2015,
      maxYear: 2024,
    );
    final DateTime lastUpdated = faker.date.dateTime(
      minYear: releaseDate.year,
      maxYear: 2025,
    );

    // Логика размера и версии
    final String version =
        '${random.nextInt(10)}.${random.nextInt(20)}.${random.nextInt(50)}';
    final String size = (random.nextDouble() * 200 + 5).toStringAsFixed(1);

    // Логика разрешений (от 1 до 6)
    final int permCount = random.nextInt(6) + 1;
    final List<String> selectedPermissions = List.generate(
      permCount,
      (_) => faker.randomGenerator.element(permissions),
    ).toSet().toList();

    // Теги (от 3 до 8)
    final int tagCount = random.nextInt(6) + 3;
    final List<String> selectedTags = (List<String>.from(
      appTags,
    )..shuffle()).take(tagCount).toList();

    // Категории (от 1 до 3)
    final int categoryCount = random.nextInt(3) + 1;
    final List<String> selectedCategories = (List<String>.from(
      appCategories,
    )..shuffle()).take(categoryCount).toList();

    // Поддерживаемые языки (от 2 до 10)
    final int langCount = random.nextInt(9) + 2;
    final List<String> supportedLanguages = (List<String>.from(
      languages,
    )..shuffle()).take(langCount).toList();

    // Package name
    final String company = faker.randomGenerator.element(companies);
    final String appName = suffix.toLowerCase().replaceAll(' ', '');
    final String packageName = 'com.$company.$appName';

    // Creator name
    final String creatorName =
        '${faker.person.firstName()} ${faker.person.lastName()}';

    // isEditorChoice (5% шанс)
    final bool isEditorChoice = faker.randomGenerator.integer(100) < 5;

    // eventText (10% шанс)
    String? generateEventText(Random random) {
      if (random.nextInt(100) >= 10) return null;

      final variations = [
        'Новая версия',
        'Обновление',
        'Специальное предложение',
        'Скидка',
        'Выбор редакции',
      ];

      return variations[random.nextInt(variations.length)];
    }

    final appData = {
      "type": "app",
      "id": id,
      "title": generatedTitle,
      "creator": creatorName,
      "rating": faker.randomGenerator.integer(50) / 10.0,
      "iconUrl": localIcon,
      "isPaid": isPaid,
      "price": price,
      "containsAds": faker.randomGenerator.boolean(),
      "containsPaidContent": faker.randomGenerator.boolean(),
      "description": faker.lorem.sentences(2).join(' '),
      "version": version,
      "size": size,
      "downloadCount": faker.randomGenerator
          .integer(500000000, min: 1000)
          .toInt(),
      "permissions": selectedPermissions,
      "releaseDate": releaseDate.toIso8601String(),
      "lastUpdated": lastUpdated.toIso8601String(),
      "websiteUrl": faker.internet.httpsUrl(),
      "emailSupport": faker.internet.email(),
      "privacyPolicyUrl": faker.internet.httpsUrl(),
      "creatorDescription": faker.lorem.sentences(2).join(' '),
      "eventText": generateEventText(random),
      "ageRating": faker.randomGenerator.element(ageRatings),
      "screenshots": selectedScreenshots,
      "tags": selectedTags,
      "appCategory": selectedCategories,
      "packageName": packageName,
      "supportedLanguages": supportedLanguages,
      "isEditorChoice": isEditorChoice,
    };

    appsList.add(appData);
  }

  // Запись в файл
  final file = File('assets/data/apps.json');
  if (!await file.parent.exists()) {
    await file.parent.create(recursive: true);
  }
  await file.writeAsString(jsonEncode(appsList));

  print(
    'Successfully generated ${appsList.length} app objects to ${file.path}',
  );
}


// flutter pub run tools/generate_data_games.dart
// flutter pub run tools/generate_data_apps.dart
// flutter pub run tools/generate_data_books.dart