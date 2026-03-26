// ignore_for_file: avoid_print
// Генерация мок-данных игр

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:faker/faker.dart';
import 'games_text_data.dart';

late int count;

Map<String, String> _loc(String en, String ru) => {'en': en, 'ru': ru};

Future<void> runGames(int count) async {
  final faker = Faker();
  final Random random = Random();
  final List<Map<String, dynamic>> gamesList = [];

  // Основной цикл генерации
  for (int i = 1; i <= count; i++) {
    // Генерируем ID с префиксом 'g' (game)
    final String id = 'g_$i'.toString();

    final int adjIdx = random.nextInt(titleWords.length);
    final int nounIdx = random.nextInt(suffixWords.length);
    final int randomSuffix = faker.randomGenerator.integer(9, min: 1);

    final String generatedTitleRu =
        '${titleWords[adjIdx]} ${suffixWords[nounIdx]} $randomSuffix';
    final String generatedTitleEn =
        '${titleWordsEn[adjIdx]} ${suffixWordsEn[nounIdx]} $randomSuffix';

    // Логика ивентов
    Map<String, String>? generateEventText(Random random) {
      // Шанс 10%
      if (random.nextInt(100) >= 10) return null;

      final int endsInDays = random.nextInt(9) + 1;
      final int endsOnDay = random.nextInt(28) + 1;
      final int idx = random.nextInt(8);

      final variationsRu = [
        'Крупное обновление',
        'Событие',
        'Распродажа',
        'Одобрено преподавателями',
        'Скоро выйдет',
        'Закончится через $endsInDays дня',
        'Завершится $endsOnDay.02.2026',
        'Специальное предложение',
      ];

      final variationsEn = [
        'Big update',
        'Event',
        'Sale',
        'Approved by teachers',
        'Coming soon',
        'Ends in $endsInDays day(s)',
        'Ends on $endsOnDay.02.2026',
        'Special offer',
      ];

      return _loc(variationsEn[idx], variationsRu[idx]);
    }

    final Map<String, String>? eventText = generateEventText(random);

    // Возрастной рейтинг определяется раньше, чтобы влиять на жанры
    final int ageRating = faker.randomGenerator.element(ageRatings);
    final bool isKidsFriendly = ageRating <= 7;

    // Логика жанров (от 1 до 3)
    // Для детских игр: 70% шанс взять жанр из kidsGenres
    int genreCount = faker.randomGenerator.integer(4, min: 1);
    List<String> selectedGenres;
    if (isKidsFriendly) {
      final allGenresForKids = [
        ...kidsGenres,
        ...kidsGenres, // дублируем для повышения вероятности
        ...genres.where((g) => g != 'Все категории'),
      ]..shuffle();
      selectedGenres = allGenresForKids
          .toSet()
          .toList()
          .take(genreCount)
          .toList();
    } else {
      selectedGenres = (List<String>.from(
        genres,
      )..shuffle()).take(genreCount).toList();
    }

    final String creatorName =
        '${faker.person.firstName()} ${faker.person.lastName()}';

    // Логика цены (10% шанс, что isPaid будет true)
    // Генерируем число от 0 до 99. Если оно < 10, то это 10% шанс.
    final bool isPaid = faker.randomGenerator.integer(100) < 10;
    double? price;

    if (isPaid) {
      final int wholeAmount = faker.randomGenerator.integer(500, min: 1);
      price = wholeAmount.toDouble();
    }

    final String currencyCode = faker.randomGenerator.element([
      'USD',
      'EUR',
      'RUB',
    ]);
    double? discountPrice;
    if (isPaid && price != null && faker.randomGenerator.integer(100) < 25) {
      final double discountPercent = 0.6 + random.nextDouble() * 0.35;
      discountPrice = (price * discountPercent).roundToDouble();
    }

    // Логика иконок
    final String localIcon = faker.randomGenerator.element(icons);

    // Логика скриншотов
    List<String> selectedScreenshots = [];

    // Шанс 50/50: либо только вертикальные, либо сначала горизонтальные
    if (random.nextBool()) {
      // Вариант 1: только вертикальные (часто для портретных игр)
      selectedScreenshots = List.generate(
        5,
        (_) => verticalScreenshots[random.nextInt(verticalScreenshots.length)],
      );
    } else {
      // Вариант 2: сначала 1-2 горизонтальных (трейлеры/промо), потом вертикальные
      selectedScreenshots.add(
        faker.randomGenerator.element(horizontalScreenshots),
      );
      selectedScreenshots.addAll(
        List.generate(
          6,
          (_) => faker.randomGenerator.element(verticalScreenshots),
        ),
      );
    }

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
        '${random.nextInt(5)}.${random.nextInt(10)}.${random.nextInt(10)}';
    final String size = (random.nextDouble() * 500 + 10).toStringAsFixed(1);

    // Логика разрешений (от 2 до 12)
    final int permCount = random.nextInt(11) + 2;
    final List<String> selectedPermissions = List.generate(
      permCount,
      (_) => faker.randomGenerator.element(permissions),
    ).toSet().toList();

    // Теги (от 3 до 7)
    final int tagCount = random.nextInt(5) + 3;
    List<String> selectedTags;

    // Для детских игр добавляем детские теги + жанр "Обучающие" тоже считается детским
    final bool isKidsGame =
        isKidsFriendly || selectedGenres.contains('educational');

    if (isKidsGame) {
      final int kidsTagCount = random.nextInt(2) + 2; // 2-3
      final int regularTagCount = random.nextInt(2) + 2; // 2-3

      selectedTags = [
        ...(List<String>.from(kidsTags)..shuffle()).take(kidsTagCount),
        ...(List<String>.from(gameTags)..shuffle()).take(regularTagCount),
      ];
    } else {
      selectedTags = (List<String>.from(
        gameTags,
      )..shuffle()).take(tagCount).toList();
    }

    // Ачивки (0..6, чтобы часть игр была без достижений)
    final int achievementCount = random.nextInt(7);
    final List<String> selectedAchievementsRu = (List<String>.from(
      achievementTitlesRu,
    )..shuffle()).take(achievementCount).toList();

    // Причины возрастного рейтинга (от 1 до 3)
    final int reasonCount = random.nextInt(3) + 1;
    final List<String> selectedAgeRatingReasons = (List<String>.from(
      ageRatingReasons,
    )..shuffle()).take(reasonCount).toList();

    // Выбираем случайный индекс разработчика (одинаковый для всех полей)
    final int devIndex = random.nextInt(developerCompanies.length);

    final gameData = {
      "type": "game",
      "id": id,
      "title": _loc(generatedTitleEn, generatedTitleRu),
      "creator": _loc(creatorName, creatorName),
      "rating": faker.randomGenerator.integer(50) / 10.0,
      "iconUrl": localIcon,
      "isPaid": isPaid,
      "price": price,
      "currencyCode": currencyCode,
      "discountPrice": discountPrice,
      "containsAds": faker.randomGenerator.boolean(),
      "containsPaidContent": faker.randomGenerator.boolean(),
      "shortDescription": _loc(
        faker.lorem.sentences(2).join(' '),
        faker.lorem.sentences(2).join(' '),
      ),
      "description": _loc(
        faker.lorem.sentences(5).join(' '),
        faker.lorem.sentences(5).join(' '),
      ),
      "version": version,
      "size": size,
      "eventText": eventText,
      "downloadCount": faker.randomGenerator
          .integer(100000000, min: 100)
          .toInt(),
      "reviewsCount": faker.randomGenerator.integer(10000000, min: 1000),
      "permissions": selectedPermissions
          .map((permRu) => _loc(permissionsEnByRu[permRu] ?? permRu, permRu))
          .toList(),
      "releaseDate": releaseDate.toIso8601String(),
      "lastUpdated": lastUpdated.toIso8601String(),
      "url": "https://play.google.com/store/apps/details?id=com.game.$id",
      "websiteUrl": faker.internet.httpsUrl(),
      "emailSupport": faker.internet.email(),
      "privacyPolicyUrl": faker.internet.httpsUrl(),
      "creatorDescription": _loc(
        faker.lorem.sentences(2).join(' '),
        faker.lorem.sentences(2).join(' '),
      ),
      "whatsNewText": _loc(
        faker.lorem.sentences(3).join(' '),
        faker.lorem.sentences(3).join(' '),
      ),
      "ageRating": ageRating,
      "isKidsFriendly": isKidsFriendly,
      "ageRatingReasons": selectedAgeRatingReasons
          .map(
            (reasonRu) =>
                _loc(ageRatingReasonsEnByRu[reasonRu] ?? reasonRu, reasonRu),
          )
          .toList(),
      "gameGenre": selectedGenres
          .map((genreEn) => _loc(genreEn, genresRuByEn[genreEn] ?? genreEn))
          .toList(),
      "screenshots": selectedScreenshots,
      "tags": selectedTags.map((tag) {
        // kidsTags — ключи (math/drawing/...), gameTags — ключи (survival/fantasy/...)
        if (kidsTagsRuByKey.containsKey(tag)) {
          // kids: ru=перевод, en=ключ (как в исходных тегах)
          return _loc(tag, kidsTagsRuByKey[tag]!);
        }
        final String? ruTag = gameTagsRuByEn[tag];
        return _loc(tag, ruTag ?? tag);
      }).toList(),
      "isOnline": faker.randomGenerator.boolean(),
      "hasMultiplayer": faker.randomGenerator.boolean(),
      "achievements": selectedAchievementsRu
          .map(
            (achievementRu) => _loc(
              achievementTitlesEnByRu[achievementRu] ?? achievementRu,
              achievementRu,
            ),
          )
          .toList(),
      "gameModes": faker.randomGenerator.element(modes),
      "hasControllerSupport": faker.randomGenerator.boolean(),
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
        developerCitiesRu[devIndex],
      ),
      "developerCountry": _loc(
        developerCountries[devIndex],
        developerCountriesRu[devIndex],
      ),
      "developerPhone": _loc(
        developerPhones[devIndex],
        developerPhones[devIndex],
      ),
    };

    gamesList.add(gameData);
  }

  // Запись в файл
  final file = File('assets/data/games.json');
  if (!await file.parent.exists()) {
    await file.parent.create(recursive: true);
  }
  await file.writeAsString(jsonEncode(gamesList));

  print(
    'Successfully generated ${gamesList.length} game objects to ${file.path}\n',
  );
}

void main() => runGames(count);
