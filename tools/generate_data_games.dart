// Генерация Мок-данных игр
import 'dart:convert';
import 'dart:io';
import 'package:faker/faker.dart';

void main() async {
  final faker = Faker();
  final List<Map<String, dynamic>> gamesList = [];

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
  ];

  final gameTags = [
    'Выживание',
    'Фэнтези',
    'Средневековье',
    'Кооператив',
    'Открытый мир',
    'Инди',
    'Многопользовательская',
    'Синглплеер',
    'Сюжетная',
    'Ранний доступ',
    'Стимпанк',
    'Киберпанк',
    'Постапокалипсис',
    'Зомби',
    'Научная фантастика',
    'Рогалик',
    'Метроидвания',
    '2D',
    '3D',
    'Пиксельная графика',
    'Реализм',
    'Стилизация',
    'Мультяшная',
    'Ретро',
    'Красивая',
    'Смешная',
    'Ужасы',
    'Хоррор',
    'Для всей семьи',
    'Для детей',
    'Хардкор',
    'Казуальная',
    'Быстрый темп',
    'Медленный темп',
    'Для VR',
    'Контроллер',
    'Клавиатура',
    'Мышь',
    'Бесплатная',
    'Платная',
    'Гриндинг',
    'Крафтинг',
    'Пошаговая',
    'В реальном времени',
    'Экономика',
    'Строительство',
    'Война',
    'Мир',
    'Ферма',
    'Рыбалка',
    'Охота',
    'Исследование',
    'Загадки',
    'Физика',
  ];

  final platforms = ['Android', 'iOS'];
  final ageCategories = ['3+', '7+', '12+', '16+', '18+'];
  final modes = ['Single-player', 'Multiplayer', 'Co-op'];

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
  ];

  for (int i = 1; i <= 1000; i++) {
    final List<String> selectedPlatforms = [
      faker.randomGenerator.element(platforms),
    ];
    if (faker.randomGenerator.boolean()) {
      selectedPlatforms.add(
        faker.randomGenerator.element(
          platforms.where((p) => p != selectedPlatforms.first).toList(),
        ),
      );
    }

    // [Прилагательное] + [Существительное] + [ID]
    final String adj = faker.randomGenerator.element(titleWords);
    final String noun = faker.randomGenerator.element(suffixWords);

    // Используем i.toString() для гарантии уникальности
    final String generatedTitle = '$adj $noun $i';

    final String genreTitle = faker.randomGenerator.element(genres);
    final String creatorName =
        '${faker.person.firstName()} ${faker.person.lastName()} ${faker.randomGenerator.element(['Studios', 'Games', 'Labs'])}';

    // Логика для генерации количества тегов (от 8 до 15)
    int tagCount;
    do {
      tagCount = faker.randomGenerator.integer(15);
    } while (tagCount < 8);

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

      "iconUrl": "https://picsum.photos/100/100?random=$i",
      "platforms": selectedPlatforms.toSet().toList(),
      "gameGenre": genreTitle,

      "screenshots": List.generate(
        6,
        (j) => "https://picsum.photos/600/400?random=${i * 10 + j}",
      ),

      "isOnline": faker.randomGenerator.boolean(),
      "hasMultiplayer": faker.randomGenerator.boolean(),
      "ageCategory": faker.randomGenerator.element(ageCategories),
      "hasControllerSupport": faker.randomGenerator.boolean(),
      "hasAchievements": faker.randomGenerator.boolean(),
      "gameModes": faker.randomGenerator.element(modes),

      "storyDuration": faker.randomGenerator.boolean()
          ? faker.randomGenerator.element([
              '10+ часов',
              '50+ часов',
              '100+ часов',
            ])
          : null,

      "tags": selectedTags.join(', '),
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
    '✅ Successfully generated ${gamesList.length} game objects to ${file.path}',
  );
}
