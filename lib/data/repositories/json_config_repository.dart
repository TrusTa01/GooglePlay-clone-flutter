import 'package:google_play/data/datasources/local/config_local_datasource.dart';
import 'package:google_play/data/mappers/mappers.dart';
import 'package:google_play/domain/entities/sections/available_tabs_entity.dart';
import 'package:google_play/domain/entities/sections/section_entity.dart';
import 'package:google_play/domain/repositories/config_repository.dart';

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
