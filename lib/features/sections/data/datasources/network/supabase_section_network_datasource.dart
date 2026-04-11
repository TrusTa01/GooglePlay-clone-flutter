import 'package:google_play/core/data/network/base_supabase_datasourse.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/sections/data/models/network/tab_sections_dto.dart';

class SupabaseSectionNetworkDatasource
    extends BaseSupabaseDatasourse<SectionsDto> {
  const SupabaseSectionNetworkDatasource({required super.executor});

  @override
  SectionsDto fromJson(Map<String, dynamic> json) => SectionsDto.fromJson(json);

  Future<Result<List<SectionsDto>>> getSections({
    required String view,
    SchemaNamesEnum schemaName = SchemaNamesEnum.views,
    required ({bool ascending, String column}) order,
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
