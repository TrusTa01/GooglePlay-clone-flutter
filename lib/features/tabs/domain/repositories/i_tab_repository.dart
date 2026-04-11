import 'package:google_play/core/domain/entities/store_type.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/features/tabs/domain/entities/tab_entity.dart';

abstract interface class ITabRepository {
  Future<List<TabsEntity>> getTabs({
    required StoreType storeType,
    required String locale,
    int page = 1,
    int pageSize = 100,
    bool forceRefresh = false,
  });

  Stream<List<TabsEntity>> watchTabs({
    required StoreType storeType,
    required String locale,
    int page = 1,
    int pageSize = 100,
  });

  Future<DataFreshness> getTabsFreshness({required StoreType storeType});
}
