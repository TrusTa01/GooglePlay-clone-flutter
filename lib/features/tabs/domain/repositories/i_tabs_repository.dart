import 'package:google_play/core/domain/entities/store_type.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/features/tabs/domain/entities/tabs_entity.dart';

abstract interface class ITabsRepository {
  Future<List<TabsEntity>> getTabs({
    required String id,
    required StoreType storeType,
    required String locale,
    int page = 1,
    int pageSize = 100,
    bool forceRefresh = false,
  });

  Future<DataFreshness> getTabsFreshness({required StoreType storeType});
}
