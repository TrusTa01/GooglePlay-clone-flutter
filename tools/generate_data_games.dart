// ignore_for_file: avoid_print
// Генерация мок-данных игр

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
    'Все категории',
    'Аркады',
    'Викторины',
    'Головоломки',
    'Гонки',
    'Казино',
    'Казуальные',
    'Карточные',
    'Музыкальные',
    'Настольные',
    'Обучающие',
    'Приключения',
    'Ролевые',
    'Симуляторы',
    'Словесные',
    'Спортивные',
    'Стратегии',
    'Экшен',
    'Файтинг',
    'Образование',
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
    'Steampunk',
    'VR',
    'PvP',
    'PvE',
    'Кинематографичная',
    'Сложная',
    'Расслабляющая',
    'Процедурная генерация',
    'Кроссплатформенность',
    'Реалистичная',
    'Стилизованная',
    'Абстрактная',
    'Минимализм',
    'Постапокалипсис',
    'Киберспорт',
    'Офлайн',
    'Низкие цены',
  ];

  // Теги для детских игр
  final kidsTags = [
    'Математика',
    'Рисование',
    'Алфавит',
    'Буквы',
    'Цифры',
    'Языки',
    'Здоровье',
    'Логика',
    'Творчество',
    'Сказки',
    'Мультфильмы',
    'Для всей семьи',
  ];

  final icons = [
    'assets/icons/games_icons/zenless_zone_zero.webp',
    'assets/icons/games_icons/tomb_of_the_mask.webp',
    'assets/icons/games_icons/the_battle_cats.webp',
    'assets/icons/games_icons/terraria.webp',
    'assets/icons/games_icons/temple_run.webp',
    'assets/icons/games_icons/teablin_teashop.webp',
    'assets/icons/games_icons/tasty_planet.webp',
    'assets/icons/games_icons/swamp_attack.webp',
    'assets/icons/games_icons/stardew_valley.webp',
    'assets/icons/games_icons/standoff.webp',
    'assets/icons/games_icons/solo_leveling_arise.webp',
    'assets/icons/games_icons/skullgirls.webp',
    'assets/icons/games_icons/roblox.webp',
    'assets/icons/games_icons/red_ball_4.webp',
    'assets/icons/games_icons/rainbow_six_mobile.webp',
    'assets/icons/games_icons/pubg_mobile.webp',
    'assets/icons/games_icons/pokemon_go.webp',
    'assets/icons/games_icons/plants_vs_zombies_2.webp',
    'assets/icons/games_icons/my_talking_tom_2.webp',
    'assets/icons/games_icons/my_singing_monsters.webp',
    'assets/icons/games_icons/muse_dash.webp',
    'assets/icons/games_icons/monopoly_go.webp',
    'assets/icons/games_icons/minecraft.webp',
    'assets/icons/games_icons/limbo.webp',
    'assets/icons/games_icons/league_of_legends.webp',
    'assets/icons/games_icons/identity_v.webp',
    'assets/icons/games_icons/honkai_star_rail.webp',
    'assets/icons/games_icons/hello_kitty_my_dream_store.webp',
    'assets/icons/games_icons/hay_day.webp',
    'assets/icons/games_icons/geometry_dash.webp',
    'assets/icons/games_icons/genshin_impact.webp',
    'assets/icons/games_icons/gardenscapes.webp',
    'assets/icons/games_icons/fruit_ninja.webp',
    'assets/icons/games_icons/friday_night_funkin.webp',
    'assets/icons/games_icons/free_fire_max.webp',
    'assets/icons/games_icons/fnaf.webp',
    'assets/icons/games_icons/fluffy_fall.webp',
    'assets/icons/games_icons/dumb_ways_to_die.webp',
    'assets/icons/games_icons/doom.webp',
    'assets/icons/games_icons/don_t_starve.webp',
    'assets/icons/games_icons/divineko.webp',
    'assets/icons/games_icons/dead_cells.webp',
    'assets/icons/games_icons/cut_the_rope.webp',
    'assets/icons/games_icons/cookierun.webp',
    'assets/icons/games_icons/clash_royale.webp',
    'assets/icons/games_icons/clash_of_clans.webp',
    'assets/icons/games_icons/chess.webp',
    'assets/icons/games_icons/burrito_bisone.webp',
    'assets/icons/games_icons/brawl_stars.webp',
    'assets/icons/games_icons/blue_archive.webp',
    'assets/icons/games_icons/block_blast.webp',
    'assets/icons/games_icons/bleach.webp',
    'assets/icons/games_icons/best_fiends.webp',
    'assets/icons/games_icons/asphalt.webp',
    'assets/icons/games_icons/among_us.webp',
    'assets/icons/games_icons/afk_arena.webp',
  ];

  final horizontalScreenshots = [
    'assets/images/games_screenshots/block_blast_horiz_1.webp',
    'assets/images/games_screenshots/cats_and_soup_horiz_1.webp',
    'assets/images/games_screenshots/cats_and_soup_horiz_2.webp',
    'assets/images/games_screenshots/cats_and_soup_horiz_3.webp',
    'assets/images/games_screenshots/cats_and_soup_horiz_4.webp',
    'assets/images/games_screenshots/cats_and_soup_horiz_5.webp',
    'assets/images/games_screenshots/cats_and_soup_horiz_6.webp',
    'assets/images/games_screenshots/cats_and_soup_horiz_7.webp',
    'assets/images/games_screenshots/plants_vs_zombies_2_horiz_1.webp',
    'assets/images/games_screenshots/plants_vs_zombies_2_horiz_2.webp',
    'assets/images/games_screenshots/plants_vs_zombies_2_horiz_3.webp',
    'assets/images/games_screenshots/plants_vs_zombies_2_horiz_4.webp',
    'assets/images/games_screenshots/plants_vs_zombies_2_horiz_5.webp',
    'assets/images/games_screenshots/plants_vs_zombies_2_horiz_6.webp',
    'assets/images/games_screenshots/plants_vs_zombies_2_horiz_7.webp',
    'assets/images/games_screenshots/rfee_fire_horiz_1.webp',
    'assets/images/games_screenshots/rfee_fire_horiz_2.webp',
    'assets/images/games_screenshots/rfee_fire_horiz_3.webp',
    'assets/images/games_screenshots/rfee_fire_horiz_4.webp',
    'assets/images/games_screenshots/rfee_fire_horiz_5.webp',
    'assets/images/games_screenshots/rfee_fire_horiz_6.webp',
    'assets/images/games_screenshots/stardew_valley_horiz_1.webp',
    'assets/images/games_screenshots/stardew_valley_horiz_2.webp',
    'assets/images/games_screenshots/stardew_valley_horiz_3.webp',
    'assets/images/games_screenshots/stardew_valley_horiz_4.webp',
    'assets/images/games_screenshots/stardew_valley_horiz_5.webp',
    'assets/images/games_screenshots/stardew_valley_horiz_6.webp',
    'assets/images/games_screenshots/subway_serfers_horiz1.webp',
    'assets/images/games_screenshots/subway_surfers_horiz2.webp',
    'assets/images/games_screenshots/tasty_planet_horiz_1.webp',
    'assets/images/games_screenshots/tasty_planet_horiz_2.webp',
    'assets/images/games_screenshots/tasty_planet_horiz_3.webp',
    'assets/images/games_screenshots/tasty_planet_horiz_4.webp',
    'assets/images/games_screenshots/tasty_planet_horiz_5.webp',
    'assets/images/games_screenshots/terraria_horiz_1.webp',
    'assets/images/games_screenshots/terraria_horiz_2.webp',
    'assets/images/games_screenshots/terraria_horiz_3.webp',
    'assets/images/games_screenshots/terraria_horiz_4.webp',
    'assets/images/games_screenshots/terraria_horiz_5.webp',
    'assets/images/games_screenshots/terraria_horiz_6.webp',
    'assets/images/games_screenshots/terraria_horiz_7.webp',
    'assets/images/games_screenshots/the_battle_cats_horiz_1.webp',
    'assets/images/games_screenshots/the_battle_cats_horiz_2.webp',
    'assets/images/games_screenshots/the_battle_cats_horiz_3.webp',
    'assets/images/games_screenshots/the_battle_cats_horiz_4.webp',
    'assets/images/games_screenshots/the_battle_cats_horiz_5.webp',
    'assets/images/games_screenshots/the_battle_cats_horiz_6.webp',
  ];

  final verticalScreenshots = [
    'assets/images/games_screenshots/animal_restaurant_vert_1.webp',
    'assets/images/games_screenshots/animal_restaurant_vert_2.webp',
    'assets/images/games_screenshots/animal_restaurant_vert_3.webp',
    'assets/images/games_screenshots/animal_restaurant_vert_4.webp',
    'assets/images/games_screenshots/animal_restaurant_vert_5.webp',
    'assets/images/games_screenshots/animal_restaurant_vert_6.webp',
    'assets/images/games_screenshots/block_blast_vert_1.webp',
    'assets/images/games_screenshots/block_blast_vert_2.webp',
    'assets/images/games_screenshots/block_blast_vert_3.webp',
    'assets/images/games_screenshots/block_blast_vert_4.webp',
    'assets/images/games_screenshots/roblox_vert_1.webp',
    'assets/images/games_screenshots/roblox_vert_2.webp',
    'assets/images/games_screenshots/roblox_vert_3.webp',
    'assets/images/games_screenshots/roblox_vert_4.webp',
    'assets/images/games_screenshots/roblox_vert_5.webp',
    'assets/images/games_screenshots/subway_surfers_vert1.webp',
    'assets/images/games_screenshots/subway_surfers_vert2.webp',
    'assets/images/games_screenshots/subway_surfers_vert3.webp',
    'assets/images/games_screenshots/subway_surfers_vert4.webp',
    'assets/images/games_screenshots/subway_surfers_vert5.webp',
    'assets/images/games_screenshots/the_battle_cats_vert_1.webp',
  ];

  final List<int> ageRatings = [3, 5, 6, 8, 9, 12, 16, 18];

  final ageRatingReasons = [
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

  final modes = ['Single-player', 'Multiplayer', 'Co-op'];

  // Данные разработчиков игр
  final developerCompanies = [
    'Rockstar Games, Inc.',
    'Electronic Arts Inc.',
    'Activision Publishing, Inc.',
    'Ubisoft Entertainment SA',
    'Take-Two Interactive Software, Inc.',
    'Nintendo Co., Ltd.',
    'Sony Interactive Entertainment LLC',
    'Microsoft Studios',
    'Blizzard Entertainment, Inc.',
    'Epic Games, Inc.',
    'Valve Corporation',
    'Square Enix Co., Ltd.',
    'Bandai Namco Entertainment Inc.',
    'Capcom Co., Ltd.',
    'Sega Corporation',
    'Konami Digital Entertainment',
    'CD Projekt S.A.',
    'Bethesda Softworks LLC',
    'Supercell Oy',
    'miHoYo Co., Ltd.',
  ];

  final developerAddresses = [
    '110 W 44th St',
    '209 Redwood Shores Parkway',
    '3100 Ocean Park Boulevard',
    '28 Rue Armand Carrel',
    '622 Broadway',
    '11-1 Kamitoba Hokotate-cho',
    '2207 Bridgepointe Parkway',
    'One Microsoft Way',
    '16215 Alton Parkway',
    '620 Crossroads Blvd',
    '10400 NE 4th Street',
    '6-27-30 Shinjuku',
    '5-37-8 Shiba',
    '3-1-3 Uchihirano-machi',
    '1-2-12 Higashishinagawa',
    '1-11-1 Ginza',
    'Jagiellonska 74',
    '1370 Piccard Drive',
    'Itämerenkatu 11',
    'No. 1 Xibeiwang East Road',
  ];

  final developerCities = [
    'New York, NY 10036',
    'Redwood City, CA 94065',
    'Santa Monica, CA 90405',
    'Montreuil, 93100',
    'New York, NY 10012',
    'Minami-ku, Kyoto 601-8501',
    'San Mateo, CA 94404',
    'Redmond, WA 98052',
    'Irvine, CA 92618',
    'Cary, NC 27518',
    'Bellevue, WA 98004',
    'Shinjuku-ku, Tokyo 160-8430',
    'Minato-ku, Tokyo 108-0014',
    'Chuo-ku, Osaka 540-0037',
    'Shinagawa-ku, Tokyo 140-8583',
    'Chuo-ku, Tokyo 104-0061',
    'Warsaw, 03-301',
    'Rockville, MD 20850',
    'Helsinki, 00180',
    'Haidian District, Beijing 100193',
  ];

  final developerCountries = [
    'United States',
    'United States',
    'United States',
    'France',
    'United States',
    'Japan',
    'United States',
    'United States',
    'United States',
    'United States',
    'United States',
    'Japan',
    'Japan',
    'Japan',
    'Japan',
    'Japan',
    'Poland',
    'United States',
    'Finland',
    'China',
  ];

  final developerPhones = [
    '+1 646-817-2429',
    '+1 650-628-1500',
    '+1 310-255-2000',
    '+33 1 48 18 50 00',
    '+1 212-334-6633',
    '+81 75-662-9600',
    '+1 650-655-8000',
    '+1 425-882-8080',
    '+1 949-955-1380',
    '+1 919-854-0070',
    '+1 425-889-9642',
    '+81 3-5292-1200',
    '+81 3-6744-5000',
    '+81 6-6920-3600',
    '+81 3-6864-2200',
    '+81 3-3573-1111',
    '+48 22 519 69 00',
    '+1 301-926-8300',
    '+358 9 4247 5200',
    '+86 10-5765-2888',
  ];

  final permissions = [
    'Камера',
    'Микрофон',
    'Геолокация',
    'Контакты',
    'Хранилище',
    'Уведомления',
    'Bluetooth',
    'Информация о Wi-Fi подключении',
    'Идентификатор устройства и данные о вызовах',
    'Неограниченный доступ к Интернету',
    'Просмотр сетевых подключений',
    'Запуск при включении устройства',
    'Предотвращение спящего режима',
    'Управление вибросигналом',
    'Чтение содержимого USB-накопителя',
    'Изменение или удаление содержимого USB-накопителя',
    'Получение данных из Интернета',
    'Play Install Referrer API',
    'Запуск фоновых служб',
    'Разрешение на рекламный идентификатор',
    'Наложение поверх других окон',
    'Доступ к медиафайлам',
    'Использование биометрических данных',
    'Сервисы выставления счетов Google Play',
    'Доступ к данным о физической активности',
    'Чтение настроек синхронизации',
    'Запуск при загрузке',
  ];

  // Основной цикл генерации
  for (int i = 1; i <= 1000; i++) {
    // Генерируем ID с префиксом 'g' (game)
    final String id = 'g_$i'.toString();

    final String adj = faker.randomGenerator.element(titleWords);
    final String noun = faker.randomGenerator.element(suffixWords);
    final int randomSuffix = faker.randomGenerator.integer(9, min: 1);

    final String generatedTitle = '$adj $noun $randomSuffix';

    // Логика ивентов
    String? generateEventText(Random random) {
      // Шанс 10% (0, 1, 2... 9 из 100)
      if (random.nextInt(100) >= 10) return null;

      final variations = [
        'Крупное обновление',
        'Событие',
        'Распродажа',
        'Одобрено преподавателями',
        'Скоро выйдет',
        'Закончится через ${random.nextInt(9) + 1} дня',
        'Завершится ${random.nextInt(28) + 1}.02.2026',
        'Специальное предложение',
      ];

      return variations[random.nextInt(variations.length)];
    }

    // Логика жанров (от 1 до 3)
    int genreCount = faker.randomGenerator.integer(4, min: 1);
    List<String> selectedGenres =
        (genres.where((g) => g != 'Все категории').toList()..shuffle())
            .take(genreCount)
            .toList();

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
    
    // Для детских игр (возраст 3 или 7, или жанр "Обучающие") добавляем детские теги
    final int ageRating = faker.randomGenerator.element(ageRatings);
    final bool isKidsGame = ageRating <= 7 || selectedGenres.contains('Обучающие');
    
    if (isKidsGame) {
      // Для детских игр берем 2-3 детских тега и 2-4 обычных
      final int kidsTagCount = random.nextInt(1) + 2; // 1-2
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
      "title": generatedTitle,
      "creator": creatorName,
      "rating": faker.randomGenerator.integer(50) / 10.0,
      "iconUrl": localIcon,
      "isPaid": isPaid,
      "price": price,
      "containsAds": faker.randomGenerator.boolean(),
      "containsPaidContent": faker.randomGenerator.boolean(),
      "shortDescription": faker.lorem.sentences(2).join(' '),
      "description": List.generate(6, (_) => faker.lorem.sentences(5).join(' ')).join('\n\n'),
      "version": version,
      "size": size,
      "eventText": generateEventText(random),
      "downloadCount": faker.randomGenerator
          .integer(100000000, min: 100)
          .toInt(),
      "reviewsCount": faker.randomGenerator.integer(10000000, min: 1000),
      "permissions": selectedPermissions,
      "releaseDate": releaseDate.toIso8601String(),
      "lastUpdated": lastUpdated.toIso8601String(),
      "url": "https://play.google.com/store/apps/details?id=com.game.$id",
      "websiteUrl": faker.internet.httpsUrl(),
      "emailSupport": faker.internet.email(),
      "privacyPolicyUrl": faker.internet.httpsUrl(),
      "creatorDescription": faker.lorem.sentences(2).join(' '),
      "whatsNewText": faker.lorem.sentences(3).join(' '),
      "ageRating": ageRating,
      "ageRatingReasons": selectedAgeRatingReasons,
      "gameGenre": selectedGenres,
      "screenshots": selectedScreenshots,
      "tags": selectedTags,
      "isOnline": faker.randomGenerator.boolean(),
      "hasMultiplayer": faker.randomGenerator.boolean(),
      "hasAchievements": faker.randomGenerator.boolean(),
      "gameModes": faker.randomGenerator.element(modes),
      "hasControllerSupport": faker.randomGenerator.boolean(),
      // Информация о разработчике
      "developerCompany": developerCompanies[devIndex],
      "developerAddress": developerAddresses[devIndex],
      "developerCity": developerCities[devIndex],
      "developerCountry": developerCountries[devIndex],
      "developerPhone": developerPhones[devIndex],
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
    'Successfully generated ${gamesList.length} game objects to ${file.path}',
  );
}
