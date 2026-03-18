
import 'package:google_play/domain/entities/sections/available_sections_entity.dart';
import 'package:google_play/domain/entities/sections/section_entity.dart';

abstract interface class IConfigRepository {
  Future<TabConfigEntity> getTabConfig({
    required String folder,
    required String tabKey,
  });

  Future<List<AvailableSectionsEntity>> getAvaibleTabs(String indexKey);
}
