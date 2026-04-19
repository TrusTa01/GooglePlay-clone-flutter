import 'package:google_play/core/data/network/base_supabase_data_sourse.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/tabs/data/models/network/tabs_dto.dart';

class SupabaseTabsNetworkDataSource extends BaseSupabaseDataSourse<TabsDto> {
  const SupabaseTabsNetworkDataSource({required super.executor});

  @override
  TabsDto fromJson(Map<String, dynamic> json) => TabsDto.fromJson(json);

  Future<Result<List<TabsDto>>> getTabs({
    required String view,
    SchemaNamesEnum schemaName = SchemaNamesEnum.views,
    required ({String column, bool ascending}) order,
    required int page,
    int pageSize = 100,
  }) => getData(
    view: view,
    schemaName: schemaName,
    order: order,
    page: page,
    pageSize: pageSize,
  );
}
