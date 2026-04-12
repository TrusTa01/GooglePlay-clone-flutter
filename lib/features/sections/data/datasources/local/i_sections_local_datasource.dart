import 'package:google_play/core/data/local/i_local_sync_state.dart';
import 'package:google_play/features/sections/data/models/network/tab_sections_dto.dart';
import 'package:google_play/features/sections/domain/entities/section_entity.dart';

abstract interface class ISectionsLocalDatasource implements ILocalSyncState {
  Future<List<SectionEntity>> getSections({
    required String tabId,
    required String locale,
    required int page,
    required int pageSize,
  });

  Future<void> upsertSections(List<SectionsDto> dtos);
}
