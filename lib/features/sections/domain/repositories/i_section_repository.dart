import 'package:google_play/core/domain/entities/store_type.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/features/sections/domain/entities/section_entity.dart';

abstract interface class ISectionRepository {
  Future<List<SectionEntity>> getSections({
    required StoreType storeType,
    required String tabKey,
    required String locale,
    int page = 1,
    int pageSize = 200,
    bool forceRefresh = false,
  });

  Stream<List<SectionEntity>> watchSections({
    required StoreType storeType,
    required String tabKey,
    required String locale,
    int page = 1,
    int pageSize = 200,
  });

  Future<DataFreshness> getSectionsFreshness({
    required StoreType storeType,
    required String tabKey,
  });
}
