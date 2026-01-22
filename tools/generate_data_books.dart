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
    'Роман',
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
  ];

  final bookTags = [
    'Бестселлер',
    'Классика',
    'Современная литература',
    'Экранизация',
    'Серия',
    'Молодежная литература',
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

  // Основной цикл генерации
  for (int i = 1; i <= 1000; i++) {
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
    double? originalPrice;
    final bool isOnSale = faker.randomGenerator.integer(100) < 15;

    if (isPaid) {
      final int wholeAmount = faker.randomGenerator.integer(800, min: 100);
      price = wholeAmount.toDouble();
      
      if (isOnSale) {
        // Оригинальная цена на 20-50% выше
        final double multiplier = 1.2 + (random.nextDouble() * 0.3);
        originalPrice = (price * multiplier).roundToDouble();
      }
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

    // Логика жанров (от 1 до 3)
    final int genreCount = faker.randomGenerator.integer(3, min: 1);
    final List<String> selectedGenres = (List<String>.from(
      genres,
    )..shuffle()).take(genreCount).toList();

    // Теги (от 2 до 6)
    final int tagCount = random.nextInt(5) + 2;
    final List<String> selectedTags = (List<String>.from(
      bookTags,
    )..shuffle()).take(tagCount).toList();

    // ISBN генерация (российский формат)
    final String isbn = '978-5-${random.nextInt(900) + 100}-${random.nextInt(90000) + 10000}-${random.nextInt(10)}';

    // Количество страниц
    final int pageCount = random.nextInt(800) + 100;

    // Язык (85% русский, 15% английский)
    final String language = random.nextInt(100) < 85 ? 'Русский' : 'English';

    // Автор
    final String authorName =
        '${faker.person.firstName()} ${faker.person.lastName()}';

    // Издательство
    final String publisher = faker.randomGenerator.element(publishers);

    // Аудиоверсия (30% шанс)
    final bool hasAudioVersion = faker.randomGenerator.integer(100) < 30;
    Duration? audioDuration;
    String narrator = faker.randomGenerator.element(narrators);

    if (hasAudioVersion) {
      final int hours = random.nextInt(18) + 3; // От 3 до 20 часов
      final int minutes = random.nextInt(60);
      audioDuration = Duration(hours: hours, minutes: minutes);
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

    final bookData = {
      "type": "book",
      "id": id,
      "title": generatedTitle,
      "creator": authorName,
      "rating": faker.randomGenerator.integer(50) / 10.0,
      "iconUrl": localIcon,
      "isPaid": isPaid,
      "price": price,
      "description": faker.lorem.sentences(3).join(' '),
      "releaseDate": releaseDate.toIso8601String(),
      "publisher": publisher,
      "isbn": isbn,
      "pageCount": pageCount,
      "language": language,
      "publicationDate": publicationDate.toIso8601String(),
      "genres": selectedGenres,
      "hasAudioVersion": hasAudioVersion,
      "audioDuration": audioDuration?.inSeconds,
      "narrator": narrator,
      "isSeries": isSeries,
      "seriesName": seriesName,
      "seriesNumber": seriesNumber,
      "sampleAvailable": faker.randomGenerator.boolean(),
      "isOnSale": isOnSale,
      "originalPrice": originalPrice,
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
