import 'package:google_play/core/domain/entities/store_type.dart';
import 'package:google_play/features/tabs/domain/entities/tab_entity.dart';
import 'package:google_play/features/tabs/domain/repositories/i_tab_repository.dart';

abstract interface class GetTabsUseCase {
  Future<List<TabsEntity>> call({
    required StoreType storeType,
    required String locale,
    bool forceRefresh = false,
  });
}

final class GetTabsUseCaseImpl implements GetTabsUseCase {
  final ITabRepository _repository;

  const GetTabsUseCaseImpl(this._repository);

  @override
  Future<List<TabsEntity>> call({
    required StoreType storeType,
    required String locale,
    bool forceRefresh = false,
  }) {
    return _repository.getTabs(
      storeType: storeType,
      locale: locale,
      forceRefresh: forceRefresh,
    );
  }
}
