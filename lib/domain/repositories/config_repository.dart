import 'package:google_play/domain/entities/sections/section_entity.dart';

abstract interface class IConfigRepository {
  Future<TabConfigEntity> getTabConfig({
    required String folder,
    required String tabKey,
  });

  Future<List<String>> getAvaibleTabs(String folder);
}
