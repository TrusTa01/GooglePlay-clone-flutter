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
}
