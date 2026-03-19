import 'package:google_play/domain/entities/sections/available_sections_entity.dart';
import 'package:google_play/domain/repositories/config_repository.dart';
import 'package:google_play/presentation/viewmodels/home/store_tab_config.dart';

extension StoreTypeAvailableTabsKey on StoreType {
  String get availableTabsKey => switch (this) {
    StoreType.games => 'available_games_tabs',
    StoreType.apps => 'available_apps_tabs',
    StoreType.books => 'available_books_tabs',
  };
}

/// Use case для получения списка доступных табов конкретного стора
/// (игры / приложения / книги) из внешнего конфига.
abstract interface class GetAvailableTabsUseCase {
  Future<List<AvailableSectionsEntity>> call({required StoreType storeType});
}

final class GetAvailableTabsUseCaseImpl implements GetAvailableTabsUseCase {
  final IConfigRepository _configRepository;

  const GetAvailableTabsUseCaseImpl(this._configRepository);

  @override
  Future<List<AvailableSectionsEntity>> call({
    required StoreType storeType,
  }) async {
    try {
      return await _configRepository.getAvaibleTabs(storeType.availableTabsKey);
    } catch (e) {
      // TODO: [default] В случае ошибки не падаем, а возвращаем минимальный дефолтный набор табов
      return const [];
    }
  }
}
