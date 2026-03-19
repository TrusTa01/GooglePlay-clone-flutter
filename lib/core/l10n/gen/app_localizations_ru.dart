// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Google Play';

  @override
  String get navGames => 'Игры';

  @override
  String get navApps => 'Приложения';

  @override
  String get navSearch => 'Поиск';

  @override
  String get navBooks => 'Книги';

  @override
  String get tabRecommended => 'Рекомендуем';

  @override
  String get tabTopCharts => 'Лучшее';

  @override
  String get tabKids => 'Детям';

  @override
  String get tabPaid => 'Платные';

  @override
  String get tabCategories => 'Категории';

  @override
  String get buttonInstall => 'Установить';

  @override
  String get buttonFragment => 'Фрагмент';

  @override
  String get tagFree => 'Бесплатно';

  @override
  String get tagContainsPaidContent => 'Есть платный контент';

  @override
  String get emptyNoData => 'Данных нет';

  @override
  String get searchBooksHint => 'Поиск книг';

  @override
  String get for_you_title => 'Для вас';

  @override
  String get apps_work_title => 'Работа';

  @override
  String get apps_new_releases_title => 'Новые поступления';

  @override
  String get aboutGame => 'Об игре';

  @override
  String get aboutApp => 'Об приложении';

  @override
  String get aboutBook => 'Об книге';

  @override
  String get aboutProduct => 'Об продукте';

  @override
  String get description => 'Описание';

  @override
  String aboutBookType(Object bookType) {
    return 'Об $bookType книге';
  }

  @override
  String get bookTypeAudio => 'аудио';

  @override
  String get bookTypeElectronic => 'электронной';

  @override
  String get aboutAuthor => 'Об авторе';

  @override
  String get appSupport => 'Поддержка приложения';

  @override
  String get similarGames => 'Похожие игры';

  @override
  String get similarApps => 'Похожие приложения';

  @override
  String get similarBooks => 'Похожие книги';

  @override
  String get refundPolicy => 'Правила возврата платежей в Google Play';

  @override
  String get pricesIncludeVat => 'Все цены указаны с учетом НДС.';

  @override
  String get permissionsTitle => 'Разрешения для приложения';

  @override
  String permissionsForVersion(Object version) {
    return 'Возможные разрешения для версии $version';
  }

  @override
  String get supportWebsite => 'Сайт';

  @override
  String get supportEmail => 'Электронная почта';

  @override
  String get supportPrivacy => 'Конфиденциальность';

  @override
  String get supportAboutDeveloper => 'О разработчике';

  @override
  String get ratingHowCalculated => 'Как рассчитываются оценки';

  @override
  String get ratingDisclaimer =>
      'Оценки основаны на недавних отзывах от жителей вашего региона, использующих такой же тип устройства, как и вы.\n\nОтзывы оставляют пользователи с подтвержденными аккаунтами Google на основе своего опыта работы с приложением.';

  @override
  String get detailsMore => 'Подробнее...';

  @override
  String get dialogOk => 'ОК';

  @override
  String get formatEbook => 'Электронная книга';

  @override
  String get formatAudiobook => 'Аудиокнига';

  @override
  String get downloads => 'Скачивания';

  @override
  String get pagesShort => 'стр.';

  @override
  String get detailsInfo => 'Сведения';

  @override
  String get whatsNew => 'Что нового';

  @override
  String get noInformation => 'Нет информации';

  @override
  String get more => 'Еще';

  @override
  String get hasAds => 'Есть реклама';

  @override
  String get adsDisclaimer => 'Рекламу размещает разработчик приложения.';

  @override
  String get achievements => 'Достижения';

  @override
  String get achievementsDescription =>
      'За выполнения целей вам будут присваиваться достижения';

  @override
  String get labelVersion => 'Версия';

  @override
  String get labelLastUpdate => 'Последнее обновление';

  @override
  String get labelDownloads => 'Кол-во скачиваний';

  @override
  String get labelSize => 'Размер файла';

  @override
  String get labelDeveloper => 'Разработчик';

  @override
  String get labelReleaseDate => 'Дата выпуска';

  @override
  String get labelPermissions => 'Разрешения для приложения';

  @override
  String get labelMore => 'Еще';

  @override
  String get labelAuthor => 'Автор';

  @override
  String get labelPublisher => 'Издатель';

  @override
  String get labelPublishDate => 'Дата публикации';

  @override
  String get labelPages => 'Количество страниц';

  @override
  String get labelLanguage => 'Язык';

  @override
  String get labelFormat => 'Формат';

  @override
  String get labelGenres => 'Жанры';

  @override
  String get menuShare => 'Поделиться';

  @override
  String get menuWishlist => 'Добавить в список желаний';

  @override
  String get menuReport => 'Сообщить о нарушении';

  @override
  String shareMessage(Object title, Object url) {
    return 'Посмотри, что я нашел в Google Play: \n\n$title\n\n$url';
  }

  @override
  String get filterCategories => 'Категории';

  @override
  String get filterTopFree => 'Топ бесплатных';

  @override
  String get filterTopCharts => 'Лучшее';

  @override
  String get filterGenre => 'Жанр';

  @override
  String get filterAge => 'Возраст';

  @override
  String get filterByRating => 'По рейтингу';

  @override
  String get filterLanguage => 'Язык';

  @override
  String get filterAbridged => 'Сокращенное издание';

  @override
  String get productPageTitle => 'Страница продукта';

  @override
  String get productNotFound => 'Продукт не найден';

  @override
  String get categoryAll => 'Все категории';

  @override
  String get categoryGamesArcade => 'Аркады';

  @override
  String get categoryGamesTrivia => 'Викторины';

  @override
  String get categoryGamesPuzzle => 'Головоломки';

  @override
  String get categoryGamesRacing => 'Гонки';

  @override
  String get categoryGamesCasino => 'Казино';

  @override
  String get categoryGamesCasual => 'Казуальные';

  @override
  String get categoryGamesCard => 'Карточные';

  @override
  String get categoryGamesMusic => 'Музыкальные';

  @override
  String get categoryGamesBoard => 'Настольные';

  @override
  String get categoryGamesEducational => 'Обучающие';

  @override
  String get categoryGamesAdventure => 'Приключения';

  @override
  String get categoryGamesRolePlaying => 'Ролевые';

  @override
  String get categoryGamesSimulation => 'Симуляторы';

  @override
  String get categoryGamesWord => 'Словесные';

  @override
  String get categoryGamesSports => 'Спортивные';

  @override
  String get categoryGamesStrategy => 'Стратегии';

  @override
  String get categoryGamesAction => 'Экшен';

  @override
  String get categoryAppsCars => 'Автомобили и транспорт';

  @override
  String get categoryAppsBusiness => 'Бизнес';

  @override
  String get categoryAppsVideo => 'Видеоплееры и редакторы';

  @override
  String get categoryAppsFood => 'Еда и напитки';

  @override
  String get categoryAppsHouse => 'Жилье и дом';

  @override
  String get categoryAppsHealth => 'Здоровье и фитнес';

  @override
  String get categoryAppsDating => 'Знакомства';

  @override
  String get categoryAppsTools => 'Инструменты';

  @override
  String get categoryAppsArt => 'Искусство и дизайн';

  @override
  String get categoryAppsMaps => 'Карты и навигация';

  @override
  String get categoryAppsBooks => 'Книги и справочники';

  @override
  String get categoryAppsComics => 'Комиксы';

  @override
  String get categoryAppsBeauty => 'Красота';

  @override
  String get categoryAppsParenting => 'Материнство и детство';

  @override
  String get categoryAppsMedical => 'Медицина';

  @override
  String get categoryAppsEvents => 'Мероприятия';

  @override
  String get categoryAppsMusicAudio => 'Музыка и аудио';

  @override
  String get categoryAppsNews => 'Новости и журналы';

  @override
  String get categoryAppsEducation => 'Образование';

  @override
  String get categoryAppsPersonalization => 'Персонализация';

  @override
  String get categoryAppsWeather => 'Погода';

  @override
  String get categoryAppsShopping => 'Покупки';

  @override
  String get categoryAppsWatch => 'Приложения для часов';

  @override
  String get categoryAppsTravel => 'Путешествия';

  @override
  String get categoryAppsWork => 'Работа';

  @override
  String get categoryAppsEntertainment => 'Развлечения';

  @override
  String get categoryAppsOther => 'Разное';

  @override
  String get categoryAppsCommunication => 'Связь';

  @override
  String get categoryAppsSocial => 'Социальные';

  @override
  String get categoryAppsSports => 'Спорт';

  @override
  String get categoryAppsLifestyle => 'Стиль жизни';

  @override
  String get categoryAppsFinance => 'Финансы';

  @override
  String get categoryAppsPhoto => 'Фотография';

  @override
  String get categoryAppsWatchFaces => 'Циферблаты';

  @override
  String get categoryBooksAll => 'Все';

  @override
  String get categoryBooksBusiness => 'Бизнес и инвестиции';

  @override
  String get categoryBooksBiography => 'Биографии и мемуары';

  @override
  String get categoryBooksDetective => 'Детективы и триллеры';

  @override
  String get categoryBooksChildren => 'Для детей';

  @override
  String get categoryBooksMindBody => 'Для души и тела';

  @override
  String get categoryBooksHealthSports => 'Здоровье и спорт';

  @override
  String get categoryBooksHistory => 'История';

  @override
  String get categoryBooksComputers => 'Компьютеры и технологии';

  @override
  String get categoryBooksCooking => 'Кулинария и домашнее хозяйство';

  @override
  String get categoryBooksRomance => 'Любовные романы';

  @override
  String get categoryBooksSelfHelp => 'Саморазвитие';

  @override
  String get categoryBooksFantasy => 'Фантастика и фэнтези';

  @override
  String get categoryBooksFiction => 'Художественная литература';

  @override
  String get filterTopFreeOption => 'Топ бесплатных';

  @override
  String get filterBestsellers => 'Бестселлеры';

  @override
  String get filterTopPaid => 'Топ платных';

  @override
  String get filterAll => 'Все';

  @override
  String get ageUnder5 => 'До 5 лет';

  @override
  String get age6to8 => 'От 6 до 8 лет';

  @override
  String get age9to12 => 'От 9 до 12 лет';

  @override
  String get age13plus => 'От 13 лет';

  @override
  String get ratingAll => 'Все';

  @override
  String get rating45Up => '4,5★ и выше';

  @override
  String get rating40Up => '4,0★ и выше';

  @override
  String get versionAbridged => 'Сокращенная версия';

  @override
  String get versionFull => 'Полная версия';

  @override
  String get kidsHeroTitle => 'Детям - всё лучшее';

  @override
  String get kidsHeroSubtitle =>
      'Все приложения на вкладке для детей - как обучающие, так и развлекательные - получили одобрение преподавателей и отмечены специальным знаком.';

  @override
  String get kidsSectionLearning => 'Для учебы и не только';

  @override
  String get kidsSectionLearningText =>
      'Вместе с учителями, специалистами в области образования и специалистами по работе с мультимедийными технологиями мы выбираем лучшие приложения для детей в Google Play. Эксперты оценивают приложения и одобряют только те из них, которые:';

  @override
  String get kidsBullet1 => 'дарят позитивные эмоции и вдохновение;';

  @override
  String get kidsBullet2 => 'соответствуют указанной возрастной группе;';

  @override
  String get kidsBullet3 => 'тщательно продуманы.';

  @override
  String get kidsConsultants => 'Наши ведущие консультанты:';

  @override
  String get kidsConsultantsList =>
      'Джо Блатт, Гарвардская высшая школа педагогических наук;\nдоктор Сандра Калверт, Джорджтаунский университет.';

  @override
  String get kidsBadgeTitle => 'Значок \"Одобрено преподавателями\"';

  @override
  String get notificationsTitle => 'Уведомления и предложения';

  @override
  String get notificationsEmptyTitle => 'Ничего нет';

  @override
  String get notificationsEmptyDescription =>
      'Здесь будут появляться уведомления о вашем\nаккаунте Google Play.';

  @override
  String get kidsBadgeDescription =>
      'Если приложению присвоен значок \"Одобрено преподавателями\", вы увидите его в верхней части страницы сведений. Ниже вы найдете отзывы преподавателей и экспертов. Из них вы сможете узнать, к примеру, способствует ли приложение развитию воображения и любознательности.';

  @override
  String get kidsServicesTitle => 'Сервисы и приложения для учащихся';

  @override
  String get kidsServicesDescription =>
      'Приложения из Google Play (в том числе одобренные преподавателями) могут быть недоступны для учебных аккаунтов G Suite for Education. Совет для преподавателей: выясните у системного администратора, какие приложения и сервисы можно использовать в вашем учебном заведении. Узнайте больше о приложениях для учебных заведений на портале Chromebook App Hub.';

  @override
  String get unitMb => 'МБ';

  @override
  String get unitMillion => 'млн';

  @override
  String get unitThousand => 'тыс';

  @override
  String get reviewsCountLabel => 'отзывов';

  @override
  String get detailsSectionExtra => 'Дополнительно';

  @override
  String failedToLoadTabs(Object error) {
    return 'Не удалось загрузить вкладки: $error';
  }

  @override
  String get filterRecent => 'Новое';

  @override
  String get action_games_title => 'Action Games';

  @override
  String get adventure_games_title => 'Adventure Games';

  @override
  String get anime_games_title => 'Anime Games';

  @override
  String get apps_art_design_title => 'Apps Art Design';

  @override
  String get apps_auto_vehicles_title => 'Apps Auto Vehicles';

  @override
  String get apps_books_reference_title => 'Apps Books Reference';

  @override
  String get apps_business_title => 'Apps Business';

  @override
  String get apps_communication_title => 'Apps Communication';

  @override
  String get apps_dark_mode_title => 'Apps Dark Mode';

  @override
  String get apps_dating_title => 'Apps Dating';

  @override
  String get apps_education_title => 'Apps Education';

  @override
  String get apps_entertainment_title => 'Apps Entertainment';

  @override
  String get apps_events_title => 'Apps Events';

  @override
  String get apps_finance_title => 'Apps Finance';

  @override
  String get apps_food_drink_title => 'Apps Food Drink';

  @override
  String get apps_free_title => 'Apps Free';

  @override
  String get apps_health_fitness_title => 'Apps Health Fitness';

  @override
  String get apps_house_home_title => 'Apps House Home';

  @override
  String get apps_lists_title => 'Apps Lists';

  @override
  String get apps_medical_title => 'Apps Medical';

  @override
  String get apps_music_audio_title => 'Apps Music Audio';

  @override
  String get apps_navigation_title => 'Apps Navigation';

  @override
  String get apps_news_title => 'Apps News';

  @override
  String get apps_no_ads_title => 'Apps No Ads';

  @override
  String get apps_offline_title => 'Apps Offline';

  @override
  String get apps_parenting_title => 'Apps Parenting';

  @override
  String get apps_photography_title => 'Apps Photography';

  @override
  String get apps_popular_subtitle => 'Apps Popular';

  @override
  String get apps_popular_title => 'Apps Popular';

  @override
  String get apps_productivity_title => 'Apps Productivity';

  @override
  String get apps_security_title => 'Apps Security';

  @override
  String get apps_shopping_title => 'Apps Shopping';

  @override
  String get apps_social_title => 'Apps Social';

  @override
  String get apps_sports_title => 'Apps Sports';

  @override
  String get apps_top_rated_title => 'Apps Top Rated';

  @override
  String get apps_travel_title => 'Apps Travel';

  @override
  String get apps_utilities_title => 'Apps Utilities';

  @override
  String get apps_video_players_title => 'Apps Video Players';

  @override
  String get apps_weather_title => 'Apps Weather';

  @override
  String get apps_widgets_title => 'Apps Widgets';

  @override
  String get apps_work_tools_title => 'Apps Work Tools';

  @override
  String get arcade_games_title => 'Arcade Games';

  @override
  String get best_indie_games_title => 'Best Indie Games';

  @override
  String get board_games_title => 'Board Games';

  @override
  String get books_architecture_title => 'Books Architecture';

  @override
  String get books_art_title => 'Books Art';

  @override
  String get books_award_winning_title => 'Books Award Winning';

  @override
  String get books_bestseller_title => 'Books Bestseller';

  @override
  String get books_biography_title => 'Books Biography';

  @override
  String get books_business_title => 'Books Business';

  @override
  String get books_children_title => 'Books Children';

  @override
  String get books_classic_title => 'Books Classic';

  @override
  String get books_comics_title => 'Books Comics';

  @override
  String get books_cooking_title => 'Books Cooking';

  @override
  String get books_economics_title => 'Books Economics';

  @override
  String get books_education_title => 'Books Education';

  @override
  String get books_fantasy_title => 'Books Fantasy';

  @override
  String get books_free_title => 'Books Free';

  @override
  String get books_graphic_novel_title => 'Books Graphic Novel';

  @override
  String get books_health_title => 'Books Health';

  @override
  String get books_history_title => 'Books History';

  @override
  String get books_horror_title => 'Books Horror';

  @override
  String get books_law_title => 'Books Law';

  @override
  String get books_memoir_title => 'Books Memoir';

  @override
  String get books_music_title => 'Books Music';

  @override
  String get books_mystery_title => 'Books Mystery';

  @override
  String get books_nature_title => 'Books Nature';

  @override
  String get books_new_title => 'Books New';

  @override
  String get books_parenting_title => 'Books Parenting';

  @override
  String get books_philosophy_title => 'Books Philosophy';

  @override
  String get books_poetry_title => 'Books Poetry';

  @override
  String get books_politics_title => 'Books Politics';

  @override
  String get books_psychology_title => 'Books Psychology';

  @override
  String get books_religion_title => 'Books Religion';

  @override
  String get books_romance_title => 'Books Romance';

  @override
  String get books_science_fiction_title => 'Books Science Fiction';

  @override
  String get books_science_title => 'Books Science';

  @override
  String get books_self_help_title => 'Books Self Help';

  @override
  String get books_series_title => 'Books Series';

  @override
  String get books_short_stories_title => 'Books Short Stories';

  @override
  String get books_sports_title => 'Books Sports';

  @override
  String get books_technology_title => 'Books Technology';

  @override
  String get books_thriller_title => 'Books Thriller';

  @override
  String get books_top_rated_subtitle => 'Books Top Rated';

  @override
  String get books_top_rated_title => 'Books Top Rated';

  @override
  String get books_translated_title => 'Books Translated';

  @override
  String get books_travel_title => 'Books Travel';

  @override
  String get building_games_title => 'Building Games';

  @override
  String get casual_games_title => 'Casual Games';

  @override
  String get co_op_games_title => 'Co Op Games';

  @override
  String get crafting_games_title => 'Crafting Games';

  @override
  String get cyberpunk_games_title => 'Cyberpunk Games';

  @override
  String get fantasy_games_title => 'Fantasy Games';

  @override
  String get fighting_games_title => 'Fighting Games';

  @override
  String get games_offline_title => 'Games Offline';

  @override
  String get games_unusual_puzzle_title => 'Games Unusual Puzzle';

  @override
  String get home_grid_everyone_plays_subtitle => 'Home Grid Everyone Plays';

  @override
  String get home_grid_everyone_plays_title => 'Home Grid Everyone Plays';

  @override
  String get horror_games_title => 'Horror Games';

  @override
  String get indie_games_title => 'Indie Games';

  @override
  String get kids_2d_title => 'Kids 2d';

  @override
  String get kids_3d_title => 'Kids 3d';

  @override
  String get kids_abstract_title => 'Kids Abstract';

  @override
  String get kids_adventure_title => 'Kids Adventure';

  @override
  String get kids_age_12_title => 'Kids Age 12';

  @override
  String get kids_age_3_title => 'Kids Age 3';

  @override
  String get kids_age_6_title => 'Kids Age 6';

  @override
  String get kids_alphabet_title => 'Kids Alphabet';

  @override
  String get kids_arcade_title => 'Kids Arcade';

  @override
  String get kids_board_title => 'Kids Board';

  @override
  String get kids_building_title => 'Kids Building';

  @override
  String get kids_cartoons_title => 'Kids Cartoons';

  @override
  String get kids_casual_title => 'Kids Casual';

  @override
  String get kids_co_op_title => 'Kids Co Op';

  @override
  String get kids_creativity_title => 'Kids Creativity';

  @override
  String get kids_crossplatform_title => 'Kids Crossplatform';

  @override
  String get kids_drawing_title => 'Kids Drawing';

  @override
  String get kids_educational_title => 'Kids Educational';

  @override
  String get kids_exploration_title => 'Kids Exploration';

  @override
  String get kids_fairy_tales_title => 'Kids Fairy Tales';

  @override
  String get kids_family_title => 'Kids Family';

  @override
  String get kids_free_title => 'Kids Free';

  @override
  String get kids_health_title => 'Kids Health';

  @override
  String get kids_hero_banner_subtitle => 'Kids Hero Banner';

  @override
  String get kids_hero_banner_title => 'Kids Hero Banner';

  @override
  String get kids_languages_title => 'Kids Languages';

  @override
  String get kids_letters_title => 'Kids Letters';

  @override
  String get kids_logic_title => 'Kids Logic';

  @override
  String get kids_math_title => 'Kids Math';

  @override
  String get kids_minimalist_title => 'Kids Minimalist';

  @override
  String get kids_multiplayer_title => 'Kids Multiplayer';

  @override
  String get kids_music_title => 'Kids Music';

  @override
  String get kids_new_and_updated_title => 'Kids New And Updated';

  @override
  String get kids_new_releases_title => 'Kids New Releases';

  @override
  String get kids_numbers_title => 'Kids Numbers';

  @override
  String get kids_offline_title => 'Kids Offline';

  @override
  String get kids_pixel_art_title => 'Kids Pixel Art';

  @override
  String get kids_popular_title => 'Kids Popular';

  @override
  String get kids_procedural_title => 'Kids Procedural';

  @override
  String get kids_puzzle_title => 'Kids Puzzle';

  @override
  String get kids_relaxing_title => 'Kids Relaxing';

  @override
  String get kids_retro_title => 'Kids Retro';

  @override
  String get kids_rpg_title => 'Kids Rpg';

  @override
  String get kids_simulation_title => 'Kids Simulation';

  @override
  String get kids_story_rich_title => 'Kids Story Rich';

  @override
  String get kids_strategy_title => 'Kids Strategy';

  @override
  String get kids_stylized_title => 'Kids Stylized';

  @override
  String get kids_top_rated_subtitle => 'Kids Top Rated';

  @override
  String get kids_top_rated_title => 'Kids Top Rated';

  @override
  String get kids_trivia_title => 'Kids Trivia';

  @override
  String get kids_turn_based_title => 'Kids Turn Based';

  @override
  String get kids_word_title => 'Kids Word';

  @override
  String get low_price_games_title => 'Low Price Games';

  @override
  String get multiplayer_games_title => 'Multiplayer Games';

  @override
  String get new_releases_subtitle => 'New Releases';

  @override
  String get new_releases_title => 'New Releases';

  @override
  String get offline_games_title => 'Offline Games';

  @override
  String get open_world_games_title => 'Open World Games';

  @override
  String get paid_action_games_title => 'Paid Action Games';

  @override
  String get paid_adventure_games_title => 'Paid Adventure Games';

  @override
  String get paid_anime_games_title => 'Paid Anime Games';

  @override
  String get paid_arcade_games_title => 'Paid Arcade Games';

  @override
  String get paid_board_games_title => 'Paid Board Games';

  @override
  String get paid_building_games_title => 'Paid Building Games';

  @override
  String get paid_casual_games_title => 'Paid Casual Games';

  @override
  String get paid_co_op_games_title => 'Paid Co Op Games';

  @override
  String get paid_crafting_games_title => 'Paid Crafting Games';

  @override
  String get paid_cyberpunk_games_title => 'Paid Cyberpunk Games';

  @override
  String get paid_esports_games_title => 'Paid Esports Games';

  @override
  String get paid_exploration_games_title => 'Paid Exploration Games';

  @override
  String get paid_fantasy_games_title => 'Paid Fantasy Games';

  @override
  String get paid_fighting_games_title => 'Paid Fighting Games';

  @override
  String get paid_horror_games_title => 'Paid Horror Games';

  @override
  String get paid_multiplayer_games_title => 'Paid Multiplayer Games';

  @override
  String get paid_new_releases_subtitle => 'Paid New Releases';

  @override
  String get paid_new_releases_title => 'Paid New Releases';

  @override
  String get paid_open_world_games_title => 'Paid Open World Games';

  @override
  String get paid_pixel_art_games_title => 'Paid Pixel Art Games';

  @override
  String get paid_post_apocalyptic_games_title => 'Paid Post Apocalyptic Games';

  @override
  String get paid_pvp_games_title => 'Paid Pvp Games';

  @override
  String get paid_racing_games_title => 'Paid Racing Games';

  @override
  String get paid_relaxing_games_title => 'Paid Relaxing Games';

  @override
  String get paid_retro_games_title => 'Paid Retro Games';

  @override
  String get paid_roguelike_games_title => 'Paid Roguelike Games';

  @override
  String get paid_rpg_games_title => 'Paid Rpg Games';

  @override
  String get paid_shooter_games_title => 'Paid Shooter Games';

  @override
  String get paid_simulation_games_title => 'Paid Simulation Games';

  @override
  String get paid_sports_games_title => 'Paid Sports Games';

  @override
  String get paid_steampunk_games_title => 'Paid Steampunk Games';

  @override
  String get paid_story_rich_games_title => 'Paid Story Rich Games';

  @override
  String get paid_strategy_games_title => 'Paid Strategy Games';

  @override
  String get paid_survival_games_title => 'Paid Survival Games';

  @override
  String get paid_top_rated_games_title => 'Paid Top Rated Games';

  @override
  String get paid_turn_based_games_title => 'Paid Turn Based Games';

  @override
  String get paid_vr_games_title => 'Paid Vr Games';

  @override
  String get pixel_art_games_title => 'Pixel Art Games';

  @override
  String get post_apocalyptic_games_title => 'Post Apocalyptic Games';

  @override
  String get puzzle_games_title => 'Puzzle Games';

  @override
  String get pve_games_title => 'Pve Games';

  @override
  String get pvp_games_title => 'Pvp Games';

  @override
  String get racing_games_title => 'Racing Games';

  @override
  String get relaxing_games_title => 'Relaxing Games';

  @override
  String get retro_games_title => 'Retro Games';

  @override
  String get roguelike_games_title => 'Roguelike Games';

  @override
  String get rpg_games_title => 'Rpg Games';

  @override
  String get shooter_games_title => 'Shooter Games';

  @override
  String get simulation_games_title => 'Simulation Games';

  @override
  String get sports_games_title => 'Sports Games';

  @override
  String get steampunk_games_title => 'Steampunk Games';

  @override
  String get story_rich_games_title => 'Story Rich Games';

  @override
  String get strategy_games_title => 'Strategy Games';

  @override
  String get survival_games_title => 'Survival Games';

  @override
  String get top_rated_games_title => 'Top Rated Games';

  @override
  String get turn_based_games_title => 'Turn Based Games';

  @override
  String get vr_games_title => 'Vr Games';
}
