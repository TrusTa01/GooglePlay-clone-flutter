import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/features/sections/domain/entities/sections_entity.dart';

abstract interface class ISectionsRepository {
  Future<List<SectionEntity>> getSections({
    required ProductKind productKind,
    required String tabId,
    required String locale,
    int page = 1,
    int pageSize = 200,
    bool forceRefresh = false,
  });

  Future<DataFreshness> getSectionsFreshness({
    required ProductKind productKind,
    required String tabKey,
  });
}
