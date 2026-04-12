import 'package:google_play/core/data/network/base_supabase_datasourse.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/tabs/data/models/tabs_dto.dart';

class SupabaseTabNetworkDatasource extends BaseSupabaseDatasourse<TabsDto> {
  const SupabaseTabNetworkDatasource({required super.executor});

  @override
  TabsDto fromJson(Map<String, dynamic> json) => TabsDto.fromJson(json);

  Future<Result<List<TabsDto>>> getTabs({
    required String view,
    SchemaNamesEnum schemaName = SchemaNamesEnum.views,
    required ({String column, bool ascending}) order,
    required int page,
    int pageSize = 20,
  }) => getContent(
    view: view,
    schemaName: schemaName,
    order: order,
    page: page,
    pageSize: pageSize,
  );
}
