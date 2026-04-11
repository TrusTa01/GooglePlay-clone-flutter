import 'package:google_play/core/domain/entities/store_type.dart';
import 'package:google_play/features/tabs/domain/entities/tab_entity.dart';
import 'package:google_play/features/tabs/domain/repositories/i_tab_repository.dart';

abstract interface class WatchTabsUsecase {
  Stream<List<TabsEntity>> call({
    required StoreType storeType,
    required String locale,
    bool forceRefresh = false,
  });
}

final class WatchTabsUsecaseImpl implements WatchTabsUsecase {
  final ITabRepository _repository;

  const WatchTabsUsecaseImpl(this._repository);

  @override
  Stream<List<TabsEntity>> call({
    required StoreType storeType,
    required String locale,
    bool forceRefresh = false,
  }) {
    return _repository.watchTabs(storeType: storeType, locale: locale);
  }
}
