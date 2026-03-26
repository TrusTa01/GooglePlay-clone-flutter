// ignore_for_file: avoid_print
// Генерация мок-данных приложений

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:faker/faker.dart';
import 'apps_text_data.dart';

late int count;

Map<String, String> _loc(String en, String ru) => {'en': en, 'ru': ru};

double _quantizeRating(double value) => (value * 10).roundToDouble() / 10.0;

double _genSkewedRating(Random r) {
  final x = r.nextDouble();
  late double rating;
  if (x < 0.05) {
    rating = 1.5 + r.nextDouble() * 1.4; // 1.5–2.9
  } else if (x < 0.20) {
    rating = 3.0 + r.nextDouble() * 0.7; // 3.0–3.7
  } else if (x < 0.70) {
    rating = 3.8 + r.nextDouble() * 0.6; // 3.8–4.4
  } else if (x < 0.95) {
    rating = 4.5 + r.nextDouble() * 0.3; // 4.5–4.8
  } else {
    rating = 4.9 + r.nextDouble() * 0.1; // 4.9–5.0
  }
  return _quantizeRating(rating);
}

int _genPowerLawDownloads(Random r, double rating) {
  // Pareto-ish heavy tail: xm / u^(1/alpha)
  final u = max(1e-6, r.nextDouble());
  const alpha = 1.25;
  const xm = 1000.0;
  final base = xm / pow(u, 1 / alpha);
  final multiplier =
      0.7 + ((rating - 3.0) / 2.0).clamp(0.0, 1.0) * 2.2; // ~0.7..2.9
  final downloads = (base * multiplier).round();
  return downloads.clamp(1000, 1000000000);
}

int _genReviewsFromDownloads(Random r, int downloads, double rating) {
  // Review rate grows slightly with rating; include noise.
  final q = ((rating - 2.0) / 3.0).clamp(0.0, 1.0);
  final rate =
      (0.0018 + q * 0.0075) * (0.7 + r.nextDouble() * 0.6); // ~0.001..0.01
  final reviews = (downloads * rate).round();
  return reviews.clamp(50, 15000000);
}

double _genDiscountPrice(Random r, double price) {
  // discount factor in (0.65..0.90)
  final factor = 0.65 + r.nextDouble() * 0.25;
  final discounted = price * factor;
  return max(0.01, discounted).roundToDouble();
}

List<String> _pickAgeRatingReasonsByAge(Random random, int ageRating) {
  if (ageRating <= 6) {
    const kidsSafe = [
      'Страх',
      'Внутриигровые покупки',
      'Взаимодействие пользователей',
    ];
    final count = random.nextInt(2) + 1;
    return (List<String>.from(kidsSafe)..shuffle()).take(count).toList();
  }
  if (ageRating <= 9) {
    const mild = [
      'Страх',
      'Сквернословие',
      'Внутриигровые покупки',
      'Взаимодействие пользователей',
    ];
    final count = random.nextInt(2) + 1;
    return (List<String>.from(mild)..shuffle()).take(count).toList();
  }
  if (ageRating <= 12) {
    const moderate = [
      'Насилие',
      'Страх',
      'Сквернословие',
      'Дискриминация',
      'Внутриигровые покупки',
      'Взаимодействие пользователей',
    ];
    final count = random.nextInt(2) + 1;
    return (List<String>.from(moderate)..shuffle()).take(count).toList();
  }
  if (ageRating <= 16) {
    const teen = [
      'Насилие',
      'Сцены сексуального характера',
      'Сквернословие',
      'Дискриминация',
      'Азартные игры',
      'Внутриигровые покупки',
      'Взаимодействие пользователей',
    ];
    final count = random.nextInt(3) + 1;
    return (List<String>.from(teen)..shuffle()).take(count).toList();
  }

  const adult = [
    'Насилие',
    'Страх',
    'Сцены сексуального характера',
    'Наркотики',
    'Сквернословие',
    'Азартные игры',
    'Дискриминация',
    'Внутриигровые покупки',
    'Взаимодействие пользователей',
  ];
  final count = random.nextInt(3) + 1;
  return (List<String>.from(adult)..shuffle()).take(count).toList();
}

Future<void> runApps(int count) async {
  final faker = Faker();
  final Random random = Random();
  final List<Map<String, dynamic>> appsList = [];

  // Основной цикл генерации
  for (int i = 1; i <= count; i++) {
    // Генерируем ID с префиксом 'a' (app)
    final String id = 'a_$i';

    final String prefixEn = faker.randomGenerator.element(prefixWords);
    final String suffixEn = faker.randomGenerator.element(suffixWords);
    final int randomSuffix = faker.randomGenerator.integer(9, min: 1);

    final List<String> ruPrefixes = [
      'Умный',
      'Быстрый',
      'Легкий',
      'Премиум',
      'Надежный',
      'Облачный',
      'Простой',
      'Безопасный',
      'Мощный',
    ];
    final List<String> ruSuffixes = [
      'Чат',
      'Связь',
      'Плеер',
      'Редактор',
      'Планировщик',
      'Трекер',
      'Календарь',
      'Заметки',
      'Шоп',
      'Карты',
    ];

    final String generatedTitleEn = '$prefixEn $suffixEn $randomSuffix'
        .replaceAll('  ', ' ');
    final String generatedTitleRu =
        '${faker.randomGenerator.element(ruPrefixes)} ${faker.randomGenerator.element(ruSuffixes)} $randomSuffix';

    // Логика цены: чаще freemium, платные — по типичным ценовым точкам
    final bool isPaid = faker.randomGenerator.integer(100) < 10; // ~10% платных
    double? price;
    final String currencyCode = faker.randomGenerator.element([
      'USD',
      'EUR',
      'RUB',
    ]);

    if (isPaid) {
      if (currencyCode == 'RUB') {
        final rubPrices = [
          59,
          99,
          149,
          199,
          299,
          399,
          499,
          599,
          799,
          999,
          1299,
        ];
        final idx = (pow(random.nextDouble(), 2.1) * rubPrices.length)
            .floor()
            .clamp(0, rubPrices.length - 1)
            .toInt();
        price = rubPrices[idx].toDouble();
      } else {
        final usdPrices = [
          0.99,
          1.49,
          1.99,
          2.99,
          3.99,
          4.99,
          6.99,
          7.99,
          9.99,
          14.99,
          19.99,
        ];
        final idx = (pow(random.nextDouble(), 2.1) * usdPrices.length).floor();
        final int safeIdx = idx.clamp(0, usdPrices.length - 1).toInt();
        price = usdPrices[safeIdx];
      }
    }

    double? discountPrice;
    if (isPaid && price != null && random.nextInt(100) < 30) {
      final dp = _genDiscountPrice(random, price);
      discountPrice = dp < price ? dp : null;
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

    // Версия: более реалистичная semver-подобная структура
    final double vroll = random.nextDouble();
    final int major = vroll < 0.65
        ? random.nextInt(2) + 1
        : (vroll < 0.93 ? random.nextInt(4) + 3 : random.nextInt(6) + 7);
    final int minor = random.nextInt(100);
    final int patch = random.nextInt(51);
    final String version = '$major.$minor.$patch';

    // Размер: базово зависит от версии, дальше дополнительно подгоним по категории
    String size = (random.nextDouble() * 200 + 5 + major * 6).toStringAsFixed(
      1,
    );

    // Логика разрешений (от 3 до 15)
    final int permCount = random.nextInt(13) + 3;
    final List<String> selectedPermissions = List.generate(
      permCount,
      (_) => faker.randomGenerator.element(permissions),
    ).toSet().toList();

    // Теги (от 3 до 8)
    final int tagCount = random.nextInt(6) + 3;
    final List<String> selectedTags = (List<String>.from(
      appTags,
    )..shuffle()).take(tagCount).toList();

    // Возрастной рейтинг и детский контент (как в играх)
    final int ageRating = faker.randomGenerator.element(ageRatings);
    final bool isKidsFriendly = ageRating <= 7;

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

    // Причины возрастного рейтинга зависят от возраста
    final List<String> selectedAgeRatingReasons = _pickAgeRatingReasonsByAge(
      random,
      ageRating,
    );

    // Package name
    final String company = faker.randomGenerator.element(companies);
    final String appName = suffixEn.toLowerCase().replaceAll(' ', '');
    final String packageName = 'com.$company.$appName';

    // Выбираем случайный индекс разработчика до использования в creator
    final int devIndex = random.nextInt(developerCompanies.length);

    // store-like rating + downloads + reviews
    final double rating = _genSkewedRating(random);
    final int downloadCount = _genPowerLawDownloads(random, rating);
    final int reviewsCount = _genReviewsFromDownloads(
      random,
      downloadCount,
      rating,
    );

    // monetization correlation
    final bool containsAds = isPaid
        ? random.nextDouble() < 0.10
        : random.nextDouble() < 0.72;
    final bool containsPaidContent = isPaid
        ? random.nextDouble() < 0.75
        : random.nextDouble() < 0.25;

    final String primaryCategoryRu = selectedCategories.isNotEmpty
        ? selectedCategories.first
        : appCategories.first;
    final String primaryCategoryEn =
        appCategoriesEnByRu[primaryCategoryRu] ?? primaryCategoryRu;

    // Подгоняем размер под категорию (упрощенно, но правдоподобно)
    final String catKey = primaryCategoryEn.toLowerCase();
    double sizeMin;
    double sizeMax;
    if (catKey.contains('games')) {
      sizeMin = 120;
      sizeMax = 520;
    } else if (catKey.contains('social')) {
      sizeMin = 70;
      sizeMax = 290;
    } else if (catKey.contains('music') || catKey.contains('video')) {
      sizeMin = 60;
      sizeMax = 260;
    } else if (catKey.contains('tools') ||
        catKey.contains('business') ||
        catKey.contains('education')) {
      sizeMin = 8;
      sizeMax = 130;
    } else {
      sizeMin = 20;
      sizeMax = 200;
    }
    size = (sizeMin + random.nextDouble() * (sizeMax - sizeMin) + major * 4)
        .toStringAsFixed(1);

    final shortDescTemplatesRu = [
      'Получите больше от {category}: новые функции и удобный интерфейс.',
      'Встречайте обновление для {category}: быстрее, стабильнее и интереснее.',
      'Улучшения для {category}: новые возможности и исправления.',
      'Ваш {category} стал лучше — добавили функции и оптимизацию.',
      'Обновлено для {category}: быстрее запуск и более удобные настройки.',
    ];
    final shortDescTemplatesEn = [
      'Get more from {category}: new features and an intuitive interface.',
      'Introducing an update for {category}: faster, smoother, and more fun.',
      'Improvements for {category}: new capabilities and fixes.',
      'Your {category} just got better — added features and optimization.',
      'Updated for {category}: faster launch and smarter settings.',
    ];

    final String shortDescriptionRu =
        shortDescTemplatesRu[random.nextInt(shortDescTemplatesRu.length)]
            .replaceAll('{category}', primaryCategoryRu);
    final String shortDescriptionEn =
        shortDescTemplatesEn[random.nextInt(shortDescTemplatesEn.length)]
            .replaceAll('{category}', primaryCategoryEn);

    final descTemplatesRu = [
      'Теперь в вашем приложении для {category} — новые инструменты, которые помогают быстрее справляться с задачами.',
      'Мы улучшили стабильность, добавили оптимизации и сделали интерфейс понятнее.',
      'Благодаря обновлению для {category} вы получаете более плавную работу и новые настройки под ваши привычки.',
    ];
    final descTemplatesEn = [
      'In your {category} app you now get new tools that help you move faster through daily tasks.',
      'We improved stability, added optimizations, and made the interface easier to understand.',
      'With this {category} update you get smoother performance and new settings tailored to your habits.',
    ];

    final String descriptionRu = List.generate(3, (_) {
      final t = descTemplatesRu[random.nextInt(descTemplatesRu.length)];
      return t.replaceAll('{category}', primaryCategoryRu);
    }).join('\n\n');

    final String descriptionEn = List.generate(3, (_) {
      final t = descTemplatesEn[random.nextInt(descTemplatesEn.length)];
      return t.replaceAll('{category}', primaryCategoryEn);
    }).join('\n\n');

    final creatorDescriptionRu =
        '${developerCompanies[devIndex]} — команда, которая постоянно улучшает {category} и делает приложение удобнее.';
    final creatorDescriptionEn =
        '${developerCompanies[devIndex]} — a team focused on improving {category} and delivering a better experience.';

    final String creatorDescriptionLocalizedRu = creatorDescriptionRu
        .replaceAll('{category}', primaryCategoryRu);
    final String creatorDescriptionLocalizedEn = creatorDescriptionEn
        .replaceAll('{category}', primaryCategoryEn);

    // eventText (10% chance)
    Map<String, String>? eventText;
    if (random.nextInt(100) < 10) {
      final endsInDays = random.nextInt(9) + 1;
      final variationsRu = [
        'Новая версия',
        'Обновление',
        'Скидка',
        'Выбор редакции',
        'Специальное предложение',
        'Закончится через $endsInDays дня',
      ];
      final variationsEn = [
        'New version',
        'Update',
        'Discount',
        "Editor's choice",
        'Special offer',
        'Ends in $endsInDays day(s)',
      ];
      final idx = random.nextInt(variationsRu.length);
      eventText = _loc(variationsEn[idx], variationsRu[idx]);
    }

    final whatsNewRuOptions = [
      'Исправлены ошибки и улучшена производительность.',
      'Добавлены новые функции и оптимизирован интерфейс.',
      'Обновлены настройки, исправлены проблемы со стабильностью.',
    ];
    final whatsNewEnOptions = [
      'Bug fixes and improved performance are now included.',
      'New features added, and the interface is better optimized.',
      'Updated settings and stability improvements throughout.',
    ];

    final Map<String, String> whatsNewText = _loc(
      whatsNewEnOptions[random.nextInt(whatsNewEnOptions.length)],
      whatsNewRuOptions[random.nextInt(whatsNewRuOptions.length)],
    );

    final appData = {
      "type": "app",
      "id": id,
      "title": _loc(generatedTitleEn, generatedTitleRu),
      "creator": _loc(
        developerCompanies[devIndex],
        developerCompanies[devIndex],
      ),
      "rating": rating,
      "iconUrl": localIcon,
      "isPaid": isPaid,
      "price": price,
      "currencyCode": currencyCode,
      "discountPrice": discountPrice,
      "containsAds": containsAds,
      "containsPaidContent": containsPaidContent,
      "shortDescription": _loc(shortDescriptionEn, shortDescriptionRu),
      "description": _loc(descriptionEn, descriptionRu),
      "version": version,
      "size": size,
      "downloadCount": downloadCount,
      "reviewsCount": reviewsCount,
      "permissions": selectedPermissions
          .map((pRu) => _loc(permissionsEnByRu[pRu] ?? pRu, pRu))
          .toList(),
      "releaseDate": releaseDate.toIso8601String(),
      "lastUpdated": lastUpdated.toIso8601String(),
      "url": "https://play.google.com/store/apps/details?id=$packageName",
      "websiteUrl": faker.internet.httpsUrl(),
      "emailSupport": faker.internet.email(),
      "privacyPolicyUrl": faker.internet.httpsUrl(),
      "creatorDescription": _loc(
        creatorDescriptionLocalizedEn,
        creatorDescriptionLocalizedRu,
      ),
      "whatsNewText": whatsNewText,
      "eventText": eventText,
      "ageRating": ageRating,
      "isKidsFriendly": isKidsFriendly,
      "ageRatingReasons": selectedAgeRatingReasons
          .map((rRu) => _loc(ageRatingReasonsEnByRu[rRu] ?? rRu, rRu))
          .toList(),
      "screenshots": selectedScreenshots,
      "tags": selectedTags
          .map((tRu) => _loc(appTagsEnByRu[tRu] ?? tRu, tRu))
          .toList(),
      "appCategory": selectedCategories
          .map((cRu) => _loc(appCategoriesEnByRu[cRu] ?? cRu, cRu))
          .toList(),
      "packageName": packageName,
      "supportedLanguages": supportedLanguages,
      // Информация о разработчике
      "developerCompany": _loc(
        developerCompanies[devIndex],
        developerCompanies[devIndex],
      ),
      "developerAddress": _loc(
        developerAddresses[devIndex],
        developerAddresses[devIndex],
      ),
      "developerCity": _loc(
        developerCities[devIndex],
        developerCities[devIndex],
      ),
      "developerCountry": _loc(
        developerCountries[devIndex],
        developerCountries[devIndex],
      ),
      "developerPhone": developerPhones[devIndex],
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
    'Successfully generated ${appsList.length} app objects to ${file.path}\n',
  );
}

void main() => runApps(count);
