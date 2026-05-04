// ignore_for_file: avoid_print
// Генерация мок-данных книг

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:faker/faker.dart';

import 'books_text_data.dart';

late int count;

Map<String, String> _loc(String en, String ru) => {'en': en, 'ru': ru};

double _genDiscountPrice2(double price) {
  // Ровно 25% скидки и без дробной части.
  final discounted = price * 0.75;
  return discounted.roundToDouble();
}

double _pickPrice(Random r, String currencyCode, List<double> tiers) {
  final int idx = (pow(r.nextDouble(), 2.1) * tiers.length)
      .floor()
      .clamp(0, tiers.length - 1)
      .toInt();
  return tiers[idx];
}

int _pageCountFromGenre(Random r, String genreRu) {
  final g = genreRu.toLowerCase();
  late int minPages;
  late int maxPages;
  if (g.contains('дет') || g.contains('молод')) {
    minPages = 40;
    maxPages = 260;
  } else if (g.contains('поэз') || g.contains('мемуар')) {
    minPages = 80;
    maxPages = 420;
  } else if (g.contains('роман') ||
      g.contains('фэнтез') ||
      g.contains('науч') ||
      g.contains('кибер') ||
      g.contains('постапокалип')) {
    minPages = 250;
    maxPages = 1200;
  } else if (g.contains('бизнес') ||
      g.contains('здоров') ||
      g.contains('истор') ||
      g.contains('компьют') ||
      g.contains('кулин')) {
    minPages = 180;
    maxPages = 850;
  } else {
    minPages = 140;
    maxPages = 700;
  }

  // Log-normal-ish: skew towards the middle with a heavy tail.
  final u = max(1e-6, r.nextDouble());
  final skew = pow(u, 0.18); // small u => smaller pages more often
  final pages = minPages + (maxPages - minPages) * (1 - skew);
  return pages.round().clamp(minPages, maxPages);
}

Future<void> runBooks(int count) async {
  final faker = Faker();
  final Random random = Random();

  if (icons.isEmpty) {
    throw StateError(
      'Список icons пуст в books_text_data.dart.\n'
      'Запустите сначала: dart run tools/generators/sync_storage_media_lists.dart',
    );
  }

  final List<Map<String, dynamic>> booksList = [];

  // Основной цикл генерации
  // Для равномерного распределения по жанрам и языкам используем циклические индексы
  int genreIndex = 0;

  for (int i = 1; i <= count; i++) {
    // Генерируем ID с префиксом 'b' (book)
    final String id = 'b_$i';

    final String prefix = faker.randomGenerator.element(prefixWords);
    final String suffix = faker.randomGenerator.element(suffixWords);
    final int randomSuffix = faker.randomGenerator.integer(5, min: 1);

    final String generatedTitle = randomSuffix > 3
        ? '$prefix $suffix'
        : '$prefix $suffix $randomSuffix';

    // Логика цены (~70% шанс платной книги), но цены по реальным ценовым точкам
    final bool isPaid = faker.randomGenerator.integer(100) < 70;
    final String currencyCode = faker.randomGenerator.element([
      'USD',
      'EUR',
      'RUB',
    ]);

    double? price;
    if (isPaid) {
      if (currencyCode == 'RUB') {
        final rubTiers = [
          49,
          99,
          149,
          199,
          299,
          399,
          499,
          599,
          799,
          999,
        ].map((v) => v.toDouble()).toList();
        price = _pickPrice(random, currencyCode, rubTiers);
      } else {
        final usdTiers = [
          0.99,
          1.49,
          1.99,
          2.99,
          3.99,
          4.99,
          6.99,
          9.99,
          14.99,
        ];
        price = _pickPrice(random, currencyCode, usdTiers);
      }
    }

    double? discountPrice;
    if (isPaid && price != null && random.nextInt(100) < 30) {
      final dp = _genDiscountPrice2(price);
      discountPrice = dp < price ? dp : null;
    }

    // После sync_storage_media_lists.dart список icons содержит готовые публичные URL
    final String localIcon = faker.randomGenerator.element(icons);

    // Логика дат
    final DateTime publicationDate = faker.date.dateTime(
      minYear: 2000,
      maxYear: 2024,
    );
    final DateTime releaseDate = faker.date.dateTime(
      minYear: publicationDate.year,
      maxYear: 2024,
    );

    // Логика жанров - равномерное распределение
    // Каждая книга получает 1-2 жанра, причем первый жанр распределяется циклически
    final int genreCount = faker.randomGenerator.integer(2, min: 1);
    final List<String> selectedGenres = [];

    // Первый жанр - циклическое распределение для гарантии равномерности
    selectedGenres.add(genres[genreIndex % genres.length]);
    genreIndex++;

    // Второй жанр (если нужен) - случайный, но не должен совпадать с первым
    if (genreCount > 1) {
      String secondGenre;
      do {
        secondGenre = faker.randomGenerator.element(genres);
      } while (secondGenre == selectedGenres[0]);
      selectedGenres.add(secondGenre);
    }

    // Теги (от 2 до 6)
    final int tagCount = random.nextInt(5) + 2;
    final List<String> selectedTags = (List<String>.from(
      bookTags,
    )..shuffle()).take(tagCount).toList();

    // Для детских книг добавляем специальный тег, чтобы фильтр по возрасту работал
    final bool isChildrenBook = selectedGenres.contains('Для детей');
    if (isChildrenBook &&
        !selectedTags.any((t) => t.toLowerCase().contains('детск'))) {
      selectedTags.add('Детская литература');
    }

    // Количество страниц (зависит от жанра)
    final int pageCount = _pageCountFromGenre(random, selectedGenres.first);

    // Язык
    final String language = faker.randomGenerator.element(languages);

    // Автор
    final String authorName =
        '${faker.person.firstName()} ${faker.person.lastName()}';

    // Издательство
    final String publisher = faker.randomGenerator.element(publishers);

    // Формат книги
    final String format = faker.randomGenerator.element(formats);

    // Аудиоверсия (30% шанс)
    final bool hasAudioVersion = faker.randomGenerator.integer(100) < 30;
    int? audioDuration;
    String? narrator;

    if (hasAudioVersion) {
      final int hours = random.nextInt(18) + 3; // От 3 до 20 часов
      final int minutes = random.nextInt(60);
      audioDuration = Duration(hours: hours, minutes: minutes).inSeconds;
      narrator = faker.randomGenerator.element(narrators);
    }

    // Серия (20% шанс)
    final bool isSeries = faker.randomGenerator.integer(100) < 20;
    String? seriesName;
    int? seriesNumber;

    if (isSeries) {
      seriesName = faker.randomGenerator.element(seriesNames);
      seriesNumber = random.nextInt(10) + 1;
    }

    // Награды (30% шанс получить от 1 до 3 наград)
    final List<String> bookAwards = [];
    if (faker.randomGenerator.integer(100) < 30) {
      final int awardCount = random.nextInt(3) + 1;
      bookAwards.addAll(
        (List<String>.from(awards)..shuffle()).take(awardCount),
      );
    }

    // Сокращенное издание (20% шанс)
    final bool isAbridged = faker.randomGenerator.integer(100) < 20;

    // Описание издательства (в БД — publishers.description)
    final int publisherParagraphCount = random.nextInt(4) + 1; // 1-4 абзаца
    final List<String> publisherParagraphs = List.generate(
      publisherParagraphCount,
      (index) {
        final int sentenceCount = random.nextInt(5) + 3;
        return faker.lorem.sentences(sentenceCount).join(' ');
      },
    );
    final String publisherDescriptionRu =
        '$publisher — ${publisherParagraphs.join('\n\n')}';
    final String publisherDescriptionEn =
        '$publisher — ${publisherParagraphs.join('\n\n')}';

    final String titleRu = generatedTitle;
    final String titleEn = faker.lorem.words(2).join(' ');

    final String shortDescriptionRu = faker.lorem.sentences(2).join(' ');
    final String shortDescriptionEn = faker.lorem.sentences(2).join(' ');

    final String descriptionRu = List.generate(
      6,
      (_) => faker.lorem.sentences(5).join(' '),
    ).join('\n\n');
    final String descriptionEn = List.generate(
      6,
      (_) => faker.lorem.sentences(5).join(' '),
    ).join('\n\n');

    final bookData = {
      "type": "book",
      "id": id,
      "url": "https://play.google.com/store/books/details?id=$id",
      "title": _loc(titleEn, titleRu),
      "author": _loc(authorName, authorName),
      "publisherDescription": _loc(
        publisherDescriptionEn,
        publisherDescriptionRu,
      ),
      "ratingAvg": null,
      "ratingCount": 0,
      "ratingDistribution": {"1": 0, "2": 0, "3": 0, "4": 0, "5": 0},
      "iconUrl": localIcon,
      "isPaid": isPaid,
      "price": price,
      "currencyCode": currencyCode,
      "discountPrice": discountPrice,
      "shortDescription": _loc(shortDescriptionEn, shortDescriptionRu),
      "description": _loc(descriptionEn, descriptionRu),
      "releaseDate": releaseDate.toIso8601String(),
      "publisher": _loc(publisher, publisher),
      "pageCount": pageCount,
      "language": language,
      "format": format,
      "publicationDate": publicationDate.toIso8601String(),
      "genre": selectedGenres
          .map((gRu) => _loc(genresEnByRu[gRu] ?? gRu, gRu))
          .toList(),
      "tags": selectedTags
          .map((tRu) => _loc(bookTagsEnByRu[tRu] ?? tRu, tRu))
          .toList(),
      "hasAudioVersion": hasAudioVersion,
      "audioDuration": audioDuration,
      "narrator": narrator,
      "isSeries": isSeries,
      "seriesName": seriesName,
      "seriesNumber": seriesNumber,
      "sampleAvailable": faker.randomGenerator.boolean(),
      "isAbridged": isAbridged,
      "awards": bookAwards,
    };

    booksList.add(bookData);
  }

  // Запись в файл
  final file = File('assets/data/books.json');
  if (!await file.parent.exists()) {
    await file.parent.create(recursive: true);
  }
  await file.writeAsString(jsonEncode(booksList));

  print(
    'Successfully generated ${booksList.length} book objects to ${file.path}\n',
  );
}

void main() => runBooks(count);
