import 'package:google_play/core/data/network/sort_orders.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/sections/data/data_sources/network/i_sections_remote_data_source.dart';
import 'package:google_play/features/sections/data/data_sources/network/sections_network_views_names_enum.dart';
import 'package:google_play/features/sections/data/data_sources/network/supabase_sections_network_data_source.dart';
import 'package:google_play/features/sections/data/models/network/tab_sections_dto.dart';

class SupabaseSectionsRemoteDataSource implements ISectionsRemoteDataSource {
  final SupabaseSectionsNetworkDataSource _datasource;

  const SupabaseSectionsRemoteDataSource({
    required SupabaseSectionsNetworkDataSource datasource,
  }) : _datasource = datasource;

  @override
  Future<Result<List<SectionsDto>>> getSections({
    required int page,
    int pageSize = 20,
  }) {
    final view = NetworkSectionsViewsNames.sections;
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
