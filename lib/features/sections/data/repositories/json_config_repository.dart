import 'package:google_play/features/tabs/data/mappers/available_sections_mapper.dart';
import 'package:google_play/features/sections/domain/entities/available_tabs_entity.dart';
import 'package:google_play/features/sections/domain/entities/section_entity.dart';
import 'package:google_play/features/sections/domain/repositories/config_repository.dart';
import 'package:google_play/features/sections/data/datasources/local/config_local_datasource.dart';
import 'package:google_play/features/sections/data/mappers/tab_config_mapper.dart';

class JsonConfigRepository implements IConfigRepository {
  final ConfigLocalDatasource _dataSource;

  JsonConfigRepository(this._dataSource);

  @override
  Future<TabConfigEntity> getTabConfig({
    required String folder,
    required String tabKey,
  }) async {
    final dto = await _dataSource.loadTabsConfig(
      folder: folder,
      tabKey: tabKey,
    );
    return dto.toEntity();
  }

  // Читаем список доступных табов из index.json через ConfigLocalDatasource
  @override
  Future<List<AvailableTabsEntity>> getAvaibleTabs(String indexKey) async {
    final dto = await _dataSource.getAvailableTabs(
      folder: 'shared',
      indexKey: indexKey,
    );

    return dto.map((d) => d.toEntity()).toList();
  }
}
