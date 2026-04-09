import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/sections/data/datasources/network/i_section_remote_data_source.dart';
import 'package:google_play/features/sections/data/datasources/network/section_network_views_names_enum.dart';
import 'package:google_play/features/sections/data/datasources/network/supabase_section_network_datasource.dart';
import 'package:google_play/features/sections/data/models/section_dto.dart';

class SupabaseSectionRemoteDataSource implements ISectionRemoteDataSource {
  final SupabaseSectionNetworkDatasource _datasource;

  const SupabaseSectionRemoteDataSource({
    required SupabaseSectionNetworkDatasource datasource,
  }) : _datasource = datasource;

  static const ({String column, bool ascending}) _releaseDateDesc = (
    column: 'release_date',
    ascending: false,
  );

  @override
  Future<Result<List<TabConfigDto>>> getSections({
    required int page,
    int pageSize = 20,
  }) {
    final view = NetworkSectionViewsNames.sections;
    final schemaName = SchemaNamesEnum.configs;

    return _datasource.getSections(
      view: view.name,
      schemaName: schemaName,
      order: _releaseDateDesc,
      page: page,
      pageSize: pageSize,
    );
  }
}
