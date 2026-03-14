import 'package:google_play/domain/repositories/config_repository.dart';
import 'package:google_play/presentation/viewmodels/home/store_tab_config.dart';

extension StoreTypeAvailableTabsKey on StoreType {
  String get availableTabsKey => switch (this) {
        StoreType.apps => 'availableAppsTabs',
        StoreType.games => 'availableGamesTabs',
        StoreType.books => 'availableBooksTabs',
      };
}

/// Use case для получения списка доступных табов конкретного стора
/// (игры / приложения / книги) из внешнего конфига.
abstract interface class GetAvailableTabsUseCase {
  Future<List<String>> call({required StoreType storeType});
}

final class GetAvailableTabsUseCaseImpl implements GetAvailableTabsUseCase {
  final IConfigRepository _configRepository;

  const GetAvailableTabsUseCaseImpl(this._configRepository);

  @override
  Future<List<String>> call({required StoreType storeType}) async {
    try {
      return await _configRepository.getAvaibleTabs(
        storeType.availableTabsKey,
      );
    } catch (e, _) {
      // В случае ошибки не падаем, а возвращаем
      // минимальный дефолтный набор табов
      return const ['recommended'];
    }
  }
}

