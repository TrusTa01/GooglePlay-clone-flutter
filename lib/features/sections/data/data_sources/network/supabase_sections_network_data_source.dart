import 'package:google_play/core/data/network/base_supabase_data_sourse.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/features/sections/data/models/network/tab_sections_dto.dart';

class SupabaseSectionsNetworkDataSource
    extends BaseSupabaseDataSourse<SectionsDto> {
  const SupabaseSectionsNetworkDataSource({required super.executor});

  @override
  SectionsDto fromJson(Map<String, dynamic> json) => SectionsDto.fromJson(json);

  Future<Result<List<SectionsDto>>> getSections({
    required String view,
    SchemaNamesEnum schemaName = SchemaNamesEnum.views,
    required ({bool ascending, String column}) order,
    required int page,
    int pageSize = 20,
  }) {
    FeatureTalker.data(
      'sections.network',
      'fetch sections',
      context: {'view': view, 'page': page, 'pageSize': pageSize},
    );
    return getData(
      view: view,
      schemaName: schemaName,
      order: order,
      page: page,
      pageSize: pageSize,
    );
  }
}
