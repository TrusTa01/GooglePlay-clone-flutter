import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/features/tabs/domain/entities/tabs_entity.dart';

abstract interface class ITabsRepository {
  Future<List<TabsEntity>> getTabs({
    required ProductKind productKind,
    required String locale,
    int page = 1,
    int pageSize = 100,
    bool forceRefresh = false,
  });

  Future<DataFreshness> getTabsFreshness({required ProductKind productKind});
}
