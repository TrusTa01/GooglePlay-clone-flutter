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

  // После запуска sync_storage_media_lists.dart списки icons,
  // verticalScreenshots, horizontalScreenshots содержат готовые публичные URL.
  final List<String> iconUrls = List<String>.from(icons);
  final List<String> verticalScreenshotUrls = List<String>.from(
    verticalScreenshots,
  );
  final List<String> horizontalScreenshotUrls = List<String>.from(
    horizontalScreenshots,
  );

  if (iconUrls.isEmpty) {
    throw StateError(
      'Список icons пуст в games_text_data.dart.\n'
      'Запустите сначала: dart run tools/generators/sync_storage_media_lists.dart',
    );
  }

  final List<Map<String, dynamic>> gamesList = [];

  for (int i = 1; i <= count; i++) {
    final String id = 'g_$i';

    final int adjIdx = random.nextInt(titleWords.length);
    final int nounIdx = random.nextInt(suffixWords.length);
    final int randomSuffix = faker.randomGenerator.integer(9, min: 1);

    final String generatedTitleRu =
        '${titleWords[adjIdx]} ${suffixWords[nounIdx]} $randomSuffix';
    final String generatedTitleEn =
        '${titleWordsEn[adjIdx]} ${suffixWordsEn[nounIdx]} $randomSuffix';

    // Логика ивентов (шанс 10%)
    Map<String, String>? generateEventText(Random r) {
      if (r.nextInt(100) >= 10) return null;

      final int endsInDays = r.nextInt(9) + 1;
      final int endsOnDay = r.nextInt(28) + 1;
      final int idx = r.nextInt(8);

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
    final int genreCount = faker.randomGenerator.integer(4, min: 1);
    List<String> selectedGenres;
    if (isKidsFriendly) {
      final allGenresForKids = [
        ...kidsGenres,
        ...kidsGenres,
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

    final int devIndex = random.nextInt(developerCompanies.length);

    // Логика цены (~30% платных)
    final bool isPaid = faker.randomGenerator.integer(100) < 30;
    double? price;
    if (isPaid) {
      price = faker.randomGenerator.integer(500, min: 1).toDouble();
    }

    final String currencyCode = faker.randomGenerator.element([
      'USD',
      'EUR',
      'RUB',
    ]);

    double? discountPrice;
    if (isPaid && price != null && faker.randomGenerator.integer(100) < 30) {
      // Ровно 25% скидки и без дробной части.
      final dp = (price * 0.75).roundToDouble();
      discountPrice = dp < price ? dp : null; // скидка должна быть реальной
    }

    // Иконка
    final String localIcon = faker.randomGenerator.element(iconUrls);

    // Скриншоты (шанс 50/50: только вертикальные или горизонтальные + вертикальные)
    final List<String> selectedScreenshots = [];
    if (verticalScreenshotUrls.isNotEmpty &&
        horizontalScreenshotUrls.isNotEmpty) {
      if (random.nextBool()) {
        selectedScreenshots.addAll(
          List.generate(
            5,
            (_) =>
                verticalScreenshotUrls[random.nextInt(
                  verticalScreenshotUrls.length,
                )],
          ),
        );
      } else {
        selectedScreenshots.add(
          faker.randomGenerator.element(horizontalScreenshotUrls),
        );
        selectedScreenshots.addAll(
          List.generate(
            4,
            (_) =>
                verticalScreenshotUrls[random.nextInt(
                  verticalScreenshotUrls.length,
                )],
          ),
        );
      }
    } else if (verticalScreenshotUrls.isNotEmpty) {
      selectedScreenshots.addAll(
        List.generate(
          5,
          (_) =>
              verticalScreenshotUrls[random.nextInt(
                verticalScreenshotUrls.length,
              )],
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

    // Размер и версия
    final String version =
        '${random.nextInt(5)}.${random.nextInt(10)}.${random.nextInt(10)}';
    final String size = (random.nextDouble() * 500 + 10).toStringAsFixed(1);

    // Разрешения (от 2 до 12)
    final int permCount = random.nextInt(11) + 2;
    final List<String> selectedPermissions = List.generate(
      permCount,
      (_) => faker.randomGenerator.element(permissions),
    ).toSet().toList();

    // Теги (от 3 до 7)
    final int tagCount = random.nextInt(5) + 3;
    List<String> selectedTags;

    final bool isKidsGame =
        isKidsFriendly || selectedGenres.contains('educational');
    if (isKidsGame) {
      final int kidsTagCount = random.nextInt(2) + 2;
      final int regularTagCount = random.nextInt(2) + 2;
      selectedTags = [
        ...(List<String>.from(kidsTags)..shuffle()).take(kidsTagCount),
        ...(List<String>.from(gameTags)..shuffle()).take(regularTagCount),
      ];
    } else {
      selectedTags = (List<String>.from(
        gameTags,
      )..shuffle()).take(tagCount).toList();
    }

    // Ачивки (0..6)
    final int achievementCount = random.nextInt(7);
    final List<String> selectedAchievementsRu = (List<String>.from(
      achievementTitlesRu,
    )..shuffle()).take(achievementCount).toList();

    // Причины возрастного рейтинга (от 1 до 3)
    final int reasonCount = random.nextInt(3) + 1;
    final List<String> selectedAgeRatingReasons = (List<String>.from(
      ageRatingReasons,
    )..shuffle()).take(reasonCount).toList();

    // Поддерживаемые языки (от 2 до 8)
    final int langCount = random.nextInt(7) + 2;
    final List<String> supportedLanguages = (List<String>.from(
      languages,
    )..shuffle()).take(langCount).toList();

    final gameData = {
      "type": "game",
      "id": id,
      "title": _loc(generatedTitleEn, generatedTitleRu),
      "ratingAvg": null,
      "ratingCount": 0,
      "ratingDistribution": {"1": 0, "2": 0, "3": 0, "4": 0, "5": 0},
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
        if (kidsTagsRuByKey.containsKey(tag)) {
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
      "supportedLanguages": supportedLanguages,
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
      "developerPhone": developerPhones[devIndex],
    };

    gamesList.add(gameData);
  }

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
