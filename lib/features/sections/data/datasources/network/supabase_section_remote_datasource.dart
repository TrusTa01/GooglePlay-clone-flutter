import 'package:google_play/core/data/network/sort_orders.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/sections/data/datasources/network/i_section_remote_datasource.dart';
import 'package:google_play/features/sections/data/datasources/network/section_network_views_names_enum.dart';
import 'package:google_play/features/sections/data/datasources/network/supabase_section_network_datasource.dart';
import 'package:google_play/features/sections/data/models/network/tab_sections_dto.dart';

class SupabaseSectionRemoteDataSource implements ISectionRemoteDataSource {
  final SupabaseSectionNetworkDatasource _datasource;

  const SupabaseSectionRemoteDataSource({
    required SupabaseSectionNetworkDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<Result<List<SectionsDto>>> getSections({
    required int page,
    int pageSize = 20,
  }) {
    final view = NetworkSectionViewsNames.sections;
    final schemaName = SchemaNamesEnum.views;

    return _datasource.getSections(
      view: view.name,
      schemaName: schemaName,
      order: SortOrders.sortOrderAsc,
      page: page,
      pageSize: pageSize,
    );
  }
}
