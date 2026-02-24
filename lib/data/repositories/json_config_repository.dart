import 'package:google_play/data/datasources/local/config_local_datasource.dart';
import 'package:google_play/data/mappers/config_mappers/tab_config_mapper.dart';
import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/domain/repositories/config_repository.dart';

class JsonConfigRepository implements IConfigRepository {
  final ConfigLocalDatasource _dataSource;

  JsonConfigRepository(this._dataSource);

  @override
  getTabConfig({required String folder, required String tabKey}) async {
    final rawMap = await _dataSource.loadTabsConfig(
      folder: folder,
      tabKey: '$tabKey.json',
    );

    final dto = TabConfigDto.fromJson(rawMap);

    return dto.toEntity();
  }

  @override
  Future<List<String>> getAvaibleTabs(String folder) => getAvaibleTabs(folder);
}
