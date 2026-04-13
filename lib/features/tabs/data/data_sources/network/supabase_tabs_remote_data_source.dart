import 'package:google_play/core/data/network/sort_orders.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/tabs/data/data_sources/network/i_supabase_tabs_network_data_source.dart';
import 'package:google_play/features/tabs/data/data_sources/network/supabase_tabs_network_data_source.dart';
import 'package:google_play/features/tabs/data/data_sources/network/tabs_network_views_names_enum.dart';
import 'package:google_play/features/tabs/data/models/network/tabs_dto.dart';

class SupabaseTabsRemoteDataSource implements ITabRemoteDataSource {
  final SupabaseTabsNetworkDataSource _datasource;

  const SupabaseTabsRemoteDataSource({
    required SupabaseTabsNetworkDataSource datasource,
  }) : _datasource = datasource;

  @override
  Future<Result<List<TabsDto>>> getTabs({
    required int page,
    int pageSize = 20,
  }) {
    final view = TabsNetworkViewsNames.tabs;
    final schemaName = SchemaNamesEnum.views;

    return _datasource.getTabs(
      view: view.name,
      schemaName: schemaName,
      order: SortOrders.sortOrderAsc,
      page: page,
      pageSize: pageSize,
    );
  }
}
