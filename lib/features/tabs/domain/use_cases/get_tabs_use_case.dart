import 'package:google_play/core/domain/entities/store_type.dart';
import 'package:google_play/features/tabs/domain/entities/tabs_entity.dart';
import 'package:google_play/features/tabs/domain/repositories/i_tabs_repository.dart';

abstract interface class GetTabsUseCase {
  Future<List<TabsEntity>> call({
    required String id,
    required StoreType storeType,
    required String locale,
    int page = 1,
    int pageSize = 100,
    bool forceRefresh = false,
  });
}

final class GetTabsUseCaseImpl implements GetTabsUseCase {
  final ITabsRepository _repository;

  const GetTabsUseCaseImpl(this._repository);

  @override
  Future<List<TabsEntity>> call({
    required String id,
    required StoreType storeType,
    required String locale,
    int page = 1,
    int pageSize = 100,
    bool forceRefresh = false,
  }) => _repository.getTabs(
    id: id,
    storeType: storeType,
    locale: locale,
    page: page,
    pageSize: pageSize,
    forceRefresh: forceRefresh,
  );
}
