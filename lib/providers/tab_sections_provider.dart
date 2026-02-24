import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/providers/banners_provider.dart';

/// Общий интерфейс для провайдеров, которые отдают секции по ключу sub-tab.
/// Реализуют [GamesProvider], [AppsProvider], [BooksProvider] - один виджет [LazyTabContent] работает со всеми.
abstract interface class TabSectionsProvider {
  /// Загружает или возвращает из кэша секции для вкладки [tabKey].
  /// [bannersProvider] - для игр и приложений обязателен, для книг не используется.
  Future<List<HomeSection>> getSectionsForTab(
    String tabKey, [
    BannersProvider? bannersProvider,
  ]);

  /// Секции для экрана «Для детей по возрасту» (таб kidsCategory с подставленным [ageLabel]).
  /// Если таба kidsCategory нет, возвращает пустой список.
  List<HomeSection> getSectionsForKidsAge(
    String ageLabel,
    BannersProvider? bannersProvider,
  );

  /// Идёт ли сейчас загрузка секций для [tabKey].
  bool isTabSectionsLoading(String tabKey);

  /// Текст ошибки загрузки данных, если есть.
  String? get error;
}
