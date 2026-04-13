import 'package:google_play/core/data/local/i_local_sync_state.dart';
import 'package:google_play/features/tabs/data/models/network/tabs_dto.dart';
import 'package:google_play/features/tabs/domain/entities/tabs_entity.dart';

abstract interface class ITabsLocalDataSource implements ILocalSyncState {
  Future<List<TabsEntity>> getTabs({
    required String id,
    required String locale,
    required int page,
    required int pageSize,
  });

  Future<void> upsertSections(List<TabsDto> dtos);
}
