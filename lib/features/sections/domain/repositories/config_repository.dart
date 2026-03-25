import 'package:google_play/features/sections/domain/entities/available_tabs_entity.dart';

import 'package:google_play/features/sections/domain/entities/section_entity.dart';

abstract interface class IConfigRepository {
  Future<TabConfigEntity> getTabConfig({
    required String folder,
    required String tabKey,
  });

  Future<List<AvailableTabsEntity>> getAvaibleTabs(String indexKey);
}
