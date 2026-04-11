import 'package:google_play/features/tabs/data/models/tabs_dto.dart';
import 'package:google_play/features/tabs/domain/entities/tab_entity.dart';

abstract interface class ITabsLocalDatasource {
  Future<List<TabsEntity>> getTabs({
    required String id,
    required String locale,
    required int page,
    required int pageSize,
  });

  Future<void> upsertSections(List<TabsDto> dtos);
}
