// ignore_for_file: avoid_print
// Генерация мок-данных книг

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:faker/faker.dart';

void main() async {
  final faker = Faker();
  final Random random = Random();
  final List<Map<String, dynamic>> booksList = [];

  final prefixWords = [
    'Последний',
    'Первый',
    'Тайный',
    'Секретный',
    'Скрытый',
    'Забытый',
    'Утерянный',
    'Потерянный',
    'Найденный',
    'Темный',
    'Светлый',
    'Красный',
    'Черный',
    'Белый',
    'Золотой',
    'Серебряный',
    'Ночной',
    'Дневной',
    'Вечный',
    'Бесконечный',
    'Проклятый',
    'Благословенный',
    'Священный',
    'Запретный',
    'Странный',
    'Великий',
    'Малый',
    'Древний',
    'Новый',
    'Старый',
    'Юный',
    'Мертвый',
    'Живой',
    'Падший',
    'Восставший',
    'Спящий',
    'Проснувшийся',
    'Далекий',
    'Близкий',
    'Северный',
    'Южный',
    'Восточный',
    'Западный',
    'Небесный',
    'Подземный',
    'Морской',
    'Горный',
    'Лесной',
    'Пустынный',
    'Ледяной',
  ];

  final suffixWords = [
    'Хроники',
    'Легенда',
    'Сага',
    'История',
    'Рассказ',
    'Повесть',
    'Роман',
    'Дневник',
    'Записки',
    'Воспоминания',
    'Тайна',
    'Секрет',
    'Загадка',
    'Мистерия',
    'Приключения',
    'Путешествие',
    'Поиск',
    'Квест',
    'Охота',
    'Битва',
    'Война',
    'Мир',
    'Империя',
    'Королевство',
    'Трон',
    'Корона',
    'Меч',
    'Щит',
    'Кольцо',
    'Амулет',
    'Талисман',
    'Артефакт',
    'Реликвия',
    'Сокровище',
    'Клад',
    'Книга',
    'Том',
    'Манускрипт',
    'Свиток',
    'Кодекс',
    'Заклинание',
    'Пророчество',
    'Предсказание',
    'Судьба',
    'Проклятие',
    'Благословение',
    'Дар',
    'Наследие',
    'Завет',
    'Обет',
    'Клятва',
    'Договор',
    'Пакт',
    'Союз',
    'Братство',
    'Орден',
    'Гильдия',
    'Клан',
    'Семья',
    'Династия',
    'Род',
    'Наследник',
    'Преемник',
    'Избранный',
    'Герой',
    'Злодей',
    'Маг',
    'Колдун',
    'Волшебник',
    'Ведьма',
    'Дракон',
    'Феникс',
    'Грифон',
    'Единорог',
    'Кентавр',
    'Эльф',
    'Гном',
    'Орк',
    'Демон',
    'Ангел',
    'Бог',
    'Титан',
    'Гигант',
    'Призрак',
    'Дух',
    'Тень',
    'Фантом',
    'Видение',
    'Сон',
    'Кошмар',
    'Иллюзия',
    'Реальность',
    'Измерение',
    'Портал',
    'Врата',
    'Дверь',
    'Путь',
    'Дорога',
  ];

  final genres = [
    'Фэнтези',
    'Научная фантастика',
    'Детектив',
    'Триллер',
    'Романы',
    'Историческая проза',
    'Биография',
    'Мемуары',
    'Поэзия',
    'Философия',
    'Драма',
    'Комедия',
    'Приключения',
    'Ужасы',
    'Мистика',
    'Фантастика',
    'Киберпанк',
    'Стимпанк',
    'Постапокалипсис',
    'Антиутопия',
    'Бизнес',
    'Для детей',
    'Детективы и триллеры',
    'Для души и тела',
    'Здоровье и спорт',
    'История',
    'Компьютеры и технологии',
    'Кулинария и домашнее хозяйство',
    'Любовные романы',
    'Саморазвитие',
    'Художественная литература',
  ];

  final bookTags = [
    'Бестселлер',
    'Классика',
    'Современная литература',
    'Экранизация',
    'Серия',
    'Молодежная литература',
    'Детская литература',
    'Антиутопия',
    'Мистика',
    'Детектив',
    'Психологический триллер',
    'Эпическое фэнтези',
    'Городское фэнтези',
    'Темное фэнтези',
    'Космическая опера',
    'Твердая НФ',
    'Альтернативная история',
    'Магический реализм',
    'Нуар',
    'Шпионский роман',
    'Любовный роман',
    'Исторический роман',
    'Военная проза',
    'Приключенческая проза',
    'Сатира',
    'Пародия',
    'Готика',
    'Хоррор',
    'Философская проза',
    'Постмодернизм',
    'Реализм',
    'Сюрреализм',
    'Абсурдизм',
    'Экзистенциализм',
    'Дзен',
    'Буддизм',
    'Христианство',
    'Самопознание',
    'Саморазвитие',
    'Мотивация',
    'Успех',
    'Новинка',
    'Самоучитель',
  ];

  final icons = [
    'assets/icons/books_icons/1984.webp',
    'assets/icons/books_icons/alice_in_wonderland.webp',
    'assets/icons/books_icons/animal_farm.webp',
    'assets/icons/books_icons/an_american_tragedy_1.webp',
    'assets/icons/books_icons/a_clash_of_kings.webp',
    'assets/icons/books_icons/a_game_of_thrones.webp',
    'assets/icons/books_icons/betrayal.webp',
    'assets/icons/books_icons/big_swiss.webp',
    'assets/icons/books_icons/cause_to_dread.webp',
    'assets/icons/books_icons/dandelion_wine.webp',
    'assets/icons/books_icons/drive.webp',
    'assets/icons/books_icons/foresight.webp',
    'assets/icons/books_icons/foundation_and_empire.webp',
    'assets/icons/books_icons/girl_in_the_yellow_coat.webp',
    'assets/icons/books_icons/hotel.webp',
    'assets/icons/books_icons/if_tomorrow_comes.webp',
    'assets/icons/books_icons/inside_the_killer.webp',
    'assets/icons/books_icons/jump.webp',
    'assets/icons/books_icons/lemons_lemons_lemons_lemons_lemons.webp',
    'assets/icons/books_icons/little_women.webp',
    'assets/icons/books_icons/love_with_death.webp',
    'assets/icons/books_icons/metamorphosis.webp',
    'assets/icons/books_icons/moby_dick.webp',
    'assets/icons/books_icons/never_let_me_go.webp',
    'assets/icons/books_icons/normal_people.webp',
    'assets/icons/books_icons/only_forward.webp',
    'assets/icons/books_icons/on_leadership.webp',
    'assets/icons/books_icons/past.webp',
    'assets/icons/books_icons/piecelove.webp',
    'assets/icons/books_icons/pride_and_prejudice.webp',
    'assets/icons/books_icons/small_things_like_these.webp',
    'assets/icons/books_icons/tender_is_the_night.webp',
    'assets/icons/books_icons/the_ashes_of_london.webp',
    'assets/icons/books_icons/the_a_b_c_murders.webp',
    'assets/icons/books_icons/the_court_of_icy_hearts.webp',
    'assets/icons/books_icons/the_covenant_of_water.webp',
    'assets/icons/books_icons/the_devil_wears_prada.webp',
    'assets/icons/books_icons/the_dice_man.webp',
    'assets/icons/books_icons/the_flaw.webp',
    'assets/icons/books_icons/the_grinch.webp',
    'assets/icons/books_icons/the_hobbit.webp',
    'assets/icons/books_icons/the_hunting_party.webp',
    'assets/icons/books_icons/the_imperial_guardian.webp',
    'assets/icons/books_icons/the_it.webp',
    'assets/icons/books_icons/the_limit.webp',
    'assets/icons/books_icons/the_lord_of_the_ring.webp',
    'assets/icons/books_icons/the_pioneers.webp',
    'assets/icons/books_icons/the_starry_messenger.webp',
    'assets/icons/books_icons/the_weight_of_honor.webp',
    'assets/icons/books_icons/three_days_of_indigo.webp',
    'assets/icons/books_icons/three_men_in_a_boat.webp',
    'assets/icons/books_icons/through_another_night.webp',
    'assets/icons/books_icons/utopia.webp',
    'assets/icons/books_icons/vassal_state.webp',
    'assets/icons/books_icons/wealth_of_wisdom.webp',
    'assets/icons/books_icons/world_of_warcraft.webp',
  ];

  final publishers = [
    'АСТ',
    'Эксмо',
    'Азбука',
    'Азбука-Аттикус',
    'Росмэн',
    'Манн, Иванов и Фербер',
    'Альпина Паблишер',
    'Питер',
    'Просвещение',
    'Дрофа',
    'Вентана-Граф',
    'Махаон',
    'Clever',
    'Самокат',
    'КомпасГид',
    'Фантом Пресс',
    'Абрис',
    'Livebook',
    'Рипол Классик',
    'Добрая книга',
  ];

  final awards = [
    'Букер',
    'Национальный бестселлер',
    'Русский Букер',
    'Большая книга',
    'Ясная Поляна',
    'НОС',
    'Дебют',
    'Студенческий Букер',
    'Премия Андрея Белого',
    'Премия имени Аркадия и Бориса Стругацких',
    'Портал',
    'Звездный мост',
    'Интерпресскон',
    'Награда Всемирного фэнтези',
    'Хьюго',
    'Небьюла',
    'Локус',
    'Премия Артура Кларка',
    'Премия Филипа К. Дика',
    'Британская премия фэнтези',
  ];

  final narrators = [
    'Алексей Иванов',
    'Мария Петрова',
    'Дмитрий Сидоров',
    'Елена Соколова',
    'Николай Васильев',
    'Ольга Смирнова',
    'Андрей Кузнецов',
    'Татьяна Новикова',
    'Сергей Морозов',
    'Анна Федорова',
    'Владимир Попов',
    'Наталья Волкова',
    'Михаил Лебедев',
    'Ирина Козлова',
    'Павел Орлов',
  ];

  final seriesNames = [
    'Хроники Тьмы',
    'Саги Севера',
    'Легенды Востока',
    'Записки путешественника',
    'Детективы большого города',
    'Мистерии ночи',
    'Космические приключения',
    'Магическая академия',
    'Королевская сага',
    'Империя магов',
    'Тайны прошлого',
    'Война миров',
    'Забытые королевства',
    'Звездные войны',
    'Академия убийц',
    'Дети богов',
    'Проклятие династии',
    'Секреты древних',
    'Последние герои',
    'Врата времени',
  ];

  final languages = [
    'Čeština',
    'Dansk',
    'Deutsch',
    'English',
    'Español',
    'Français',
    'Indonesia',
    'Italiano',
    'Magyar',
    'Melayu',
    'Nederlands',
    'Norsk bokmål',
    'Polski',
    'Português',
    'Română',
    'Slovenčina',
    'Suomi',
    'Svenska',
    'Tiếng Việt',
    'Türkçe',
    'Ελληνικά',
    'Русский',
    'українська',
    'עברית',
    'العربية',
    'मराठी',
    'हिंदी',
    'বাংলা',
    'தமிழ்',
    'ไทย',
    '한국어',
    '日本語',
    '中文',
  ];

  final formats = ['ePub', 'Audiobook'];

  // Основной цикл генерации
  // Для равномерного распределения по жанрам и языкам используем циклические индексы
  int genreIndex = 0;
  
  for (int i = 1; i <= 300; i++) {
    // Генерируем ID с префиксом 'b' (book)
    final String id = 'b_$i';

    final String prefix = faker.randomGenerator.element(prefixWords);
    final String suffix = faker.randomGenerator.element(suffixWords);
    final int randomSuffix = faker.randomGenerator.integer(5, min: 1);

    final String generatedTitle = randomSuffix > 3
        ? '$prefix $suffix'
        : '$prefix $suffix $randomSuffix';

    // Логика цены (60% шанс, что isPaid будет true)
    final bool isPaid = faker.randomGenerator.integer(100) < 60;
    double? price;

    if (isPaid) {
      final int wholeAmount = faker.randomGenerator.integer(800, min: 100);
      price = wholeAmount.toDouble();
    }

    // Логика иконок
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
    if (isChildrenBook && !selectedTags.any((t) => t.toLowerCase().contains('детск'))) {
      selectedTags.add('Детская литература');
    }

    // ISBN генерация (российский формат)
    final String isbn =
        '978-5-${random.nextInt(900) + 100}-${random.nextInt(90000) + 10000}-${random.nextInt(10)}';

    // Количество страниц
    final int pageCount = random.nextInt(800) + 100;

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

    // Генерация рейтинга с перекосом в сторону высоких значений
    // 70% книг будут иметь рейтинг 3.5-5.0
    final double rating;
    if (faker.randomGenerator.integer(100) < 70) {
      // Высокий рейтинг: от 3.5 до 5.0
      rating = 3.5 + (faker.randomGenerator.integer(16) / 10.0);
    } else {
      // Средний/низкий рейтинг: от 2.0 до 3.5
      rating = 2.0 + (faker.randomGenerator.integer(16) / 10.0);
    }

    // Описание автора (от 3 предложений до нескольких абзацев)
    final int paragraphCount = random.nextInt(4) + 1; // 1-4 абзаца
    final List<String> paragraphs = List.generate(paragraphCount, (index) {
      final int sentenceCount = random.nextInt(5) + 3; // 3-7 предложений в абзаце
      return faker.lorem.sentences(sentenceCount).join(' ');
    });
    final String creatorDescription = '$authorName — ${paragraphs.join('\n\n')}';

    final bookData = {
      "type": "book",
      "id": id,
      "title": generatedTitle,
      "creator": authorName,
      "creatorDescription": creatorDescription,
      "rating": rating,
      "reviewsCount": faker.randomGenerator.integer(500000, min: 1000),
      "iconUrl": localIcon,
      "isPaid": isPaid,
      "price": price,
      "shortDescription": faker.lorem.sentences(2).join(' '),
      "description": List.generate(6, (_) => faker.lorem.sentences(5).join(' ')).join('\n\n'),
      "releaseDate": releaseDate.toIso8601String(),
      "publisher": publisher,
      "isbn": isbn,
      "pageCount": pageCount,
      "language": language,
      "format": format,
      "publicationDate": publicationDate.toIso8601String(),
      "genres": selectedGenres,
      "tags": selectedTags,
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
    'Successfully generated ${booksList.length} book objects to ${file.path}',
  );
}
