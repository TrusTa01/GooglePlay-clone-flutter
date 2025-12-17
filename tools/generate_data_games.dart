// Генерация мок-данных игр (games_generator.dart)
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:faker/faker.dart';

void main() async {
  final faker = Faker();
  final Random random = Random();
  final List<Map<String, dynamic>> gamesList = [];

  final titleWords = [
    'Возвращенный',
    'Неведомый',
    'Затерянный',
    'Финальный',
    'Хронический',
    'Кровавый',
    'Призрачный',
    'Космический',
    'Мистический',
    'Древний',
    'Тайный',
    'Ледяной',
    'Огненный',
    'Темный',
    'Светлый',
    'Великий',
    'Магический',
    'Скрытый',
    'Цифровой',
    'Бесконечный',
    'Последний',
    'Железный',
    'Золотой',
    'Стеклянный',
    'Песчаный',
    'Морской',
    'Звездный',
    'Крипто',
    'Безумный',
    'Дикий',
    'Тихий',
    'Громкий',
    'Облачный',
    'Расколотый',
    'Забытый',
    'Вечный',
    'Глубокий',
    'Высокий',
    'Быстрый',
    'Запретный',
    'Ветхий',
    'Истинный',
    'Пророческий',
    'Зловещий',
    'Покинутый',
    'Роковой',
    'Королевский',
    'Механический',
    'Трофейный',
    'Яростный',
    'Солнечный',
    'Лунныый',
    'Торжественный',
    'Смертельный',
    'Утерянный',
    'Небесный',
    'Подземный',
    'Земной',
    'Алмазный',
    'Нефритовый',
    'Снежный',
    'Цветочный',
    'Греховный',
    'Священный',
    'Грядущий',
  ];

  final suffixWords = [
    'Меч',
    'Арена',
    'Наследие',
    'Исход',
    'Проект',
    'Война',
    'Вторжение',
    'Пустота',
    'Эхо',
    'Квест',
    'Сага',
    'Дрифт',
    'Убежище',
    'Мир',
    'Бастион',
    'Портал',
    'Крепость',
    'Лабиринт',
    'Трон',
    'Империя',
    'Флот',
    'Планета',
    'Корабль',
    'Клинок',
    'Щит',
    'Заклинание',
    'Руна',
    'Легенда',
    'Герой',
    'Рыцарь',
    'Вор',
    'Призрак',
    'Сон',
    'Замок',
    'Королевство',
    'Долина',
    'Гора',
    'Остров',
    'Маяк',
    'Руины',
    'Башня',
    'Скала',
    'Огонь',
    'Вода',
    'Земля',
    'Ветер',
    'Кровь',
    'Тень',
    'Свет',
    'Жизнь',
    'Смерть',
    'Судьба',
    'Аватар',
    'Феникс',
    'Дракон',
    'Грифон',
    'Минотавр',
    'Головоломка',
    'Код',
    'Матрица',
    'Протокол',
    'Терминал',
    'Звезда',
    'Орбита',
    'Галактика',
    'Сектор',
    'Побег',
    'Поиск',
    'Реликвия',
    'Артефакт',
    'Храм',
    'Гробница',
    'Трасса',
  ];

  final genres = [
    'Экшен',
    'Симуляторы',
    'Головоломки',
    'Приключения',
    'Гонки',
    'Ролевые',
    'Стратегии',
    'Спортивные',
    'Карточные',
    'Настольные',
    'Файтинг',
    'Выживание',
    'Песочница',
    'Визуальная новелла',
    'Ритм-игра',
  ];

  final gameTags = [
    'Выживание',
    'Фэнтези',
    'Средневековье',
    'Кооператив',
    'Открытый мир',
    'Инди',
    'Многопользовательская',
    'Сюжетная',
    'Киберпанк',
    'Зомби',
    'Научная фантастика',
    'Рогалик',
    '2D',
    '3D',
    'Пиксельная графика',
    'Ретро',
    'Хоррор',
    'Хардкор',
    'Казуальная',
    'Бесплатная',
    'Платная',
    'Крафтинг',
    'Пошаговая',
    'В реальном времени',
    'Экономика',
    'Строительство',
    'Война',
    'Исследование',
    'Аниме',
    'Фурри',
    'Steampunk',
    'VR',
    'PvP',
    'PvE',
    'Кинематографичная',
    'Сложная',
    'Расслабляющая',
    'Процедурная генерация',
    'Кроссплатформенность',
  ];

  final myIcons = [
    'assets/icons/games_icons/fruit_ninja.jpg',
    'assets/icons/games_icons/fruit_ninja.jpg',
  ];

  final myHorizontalScreenshots = [
    'assets/images/games/horiz_1.jpg',
    'assets/images/games/horiz_2.jpg',
  ];

  final myVerticalScreenshots = [
    'assets/images/games/vert_1.jpg',
    'assets/images/games/vert_2.jpg',
  ];

  final List<int> ageRatings = [3, 7, 12, 16, 18];

  final modes = ['Single-player', 'Multiplayer', 'Co-op'];

  final permissions = [
    'Камера',
    'Микрофон',
    'Геолокация',
    'Контакты',
    'Хранилище',
  ];

  // Основной цикл генерации
  for (int i = 1; i <= 100; i++) {
    final String adj = faker.randomGenerator.element(titleWords);
    final String noun = faker.randomGenerator.element(suffixWords);
    final int randomSuffix = faker.randomGenerator.integer(9, min: 1);

    final String generatedTitle = '$adj $noun $randomSuffix';
    final String genreTitle = faker.randomGenerator.element(genres);
    final String creatorName =
        '${faker.person.firstName()} ${faker.person.lastName()} ${faker.randomGenerator.element(['Studios', 'Games', 'Labs'])}';

    // Логика цены (10% шанс, что isPaid будет true)
    // Генерируем число от 0 до 99. Если оно < 10, то это 10% шанс.
    final bool isPaid = faker.randomGenerator.integer(100) < 10;
    double? price;

    if (isPaid) {
      final int rawCents = faker.randomGenerator.integer(9999, min: 99);
      price = rawCents / 100.0; 
    }

    // Логика иконок
    final String localIcon = faker.randomGenerator.element(myIcons);

    // Логика скриншотов
    List<String> selectedScreenshots = [];

    // Шанс 50/50: либо только вертикальные, либо сначала горизонтальные
    if (random.nextBool()) {
      // Вариант 1: только вертикальные (часто для портретных игр)
      selectedScreenshots = List.generate(
        5,
        (_) =>
            myVerticalScreenshots[random.nextInt(myVerticalScreenshots.length)],
      );
    } else {
      // Вариант 2: сначала 1-2 горизонтальных (трейлеры/промо), потом вертикальные
      selectedScreenshots.add(
        faker.randomGenerator.element(myHorizontalScreenshots),
      );
      selectedScreenshots.addAll(
        List.generate(
          6,
          (_) => faker.randomGenerator.element(myVerticalScreenshots),
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
    final String size =
        '${(random.nextDouble() * 500 + 10).toStringAsFixed(1)} MB';

    // Логика разрешений (от 1 до 5)
    final int permCount = random.nextInt(5) + 1;
    final List<String> selectedPermissions = List.generate(
      permCount,
      (_) => faker.randomGenerator.element(permissions),
    ).toSet().toList();

    // Теги (от 3 до 7)
    final int tagCount = random.nextInt(5) + 3;
    final List<String> selectedTags = List.generate(
      tagCount,
      (_) => faker.randomGenerator.element(gameTags),
    ).toSet().toList();

    final gameData = {
      "id": i.toString(),
      "title": generatedTitle,
      "creator": creatorName,
      "rating": faker.randomGenerator.integer(50) / 10.0,
      "category": "Игры",
      "iconUrl": localIcon,
      "isPaid": isPaid,
      "price": price,
      "containsAds": faker.randomGenerator.boolean(),
      "containsPaidContent": faker.randomGenerator.boolean(),
      "description": faker.lorem.sentences(5).join(' '),
      "version": version,
      "size": size,
      "downloadCount": faker.randomGenerator
          .integer(100000000, min: 100)
          .toInt(),
      "permissions": selectedPermissions,
      "releaseDate": releaseDate.toIso8601String(),
      "lastUpdated": lastUpdated.toIso8601String(),
      "websiteUrl": faker.internet.httpsUrl(),
      "emailSupport": faker.internet.email(),
      "privacyPolicyUrl": faker.internet.httpsUrl(),
      "creatorDescription": faker.lorem.sentences(3).join(' '),
      "ageRating": faker.randomGenerator.element(ageRatings),
      "gameGenre": genreTitle,
      "screenshots": selectedScreenshots.join('|'),
      "tags": selectedTags.join(', '),
      "isOnline": faker.randomGenerator.boolean(),
      "hasMultiplayer": faker.randomGenerator.boolean(),
      "hasAchievements": faker.randomGenerator.boolean(),
      "gameModes": faker.randomGenerator.element(modes),
      "hasControllerSupport": faker.randomGenerator.boolean(),
    };

    gamesList.add(gameData);
  }

  // Запись в файл
  final file = File('assets/data/games.json');
  if (!await file.parent.exists()) {
    await file.parent.create(recursive: true);
  }
  await file.writeAsString(jsonEncode(gamesList));

  // ignore: avoid_print
  print(
    'Successfully generated ${gamesList.length} game objects to ${file.path}',
  );
}
