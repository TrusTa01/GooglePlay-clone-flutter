import 'package:google_play/features/sections/data/models/network/tab_sections_dto.dart';
import 'package:google_play/features/sections/domain/entities/section_entity.dart';

abstract interface class ISectionLocalDatasource {
  Future<List<SectionEntity>> getSections({
    required String tabId,
    required String locale,
    required int page,
    required int pageSize,
  });

  Future<void> upsertSections(List<TabSectionsDto> dtos);

  Future<DateTime?> getLastSync(String syncKey);
  Future<void> setLastSync(String syncKey, DateTime at);
}
