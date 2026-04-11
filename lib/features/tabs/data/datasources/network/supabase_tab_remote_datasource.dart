import 'package:google_play/core/data/network/sort_orders.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/tabs/data/datasources/network/i_supabase_tab_network_datasource.dart';
import 'package:google_play/features/tabs/data/datasources/network/supabase_tab_network_datasource.dart';
import 'package:google_play/features/tabs/data/datasources/network/tab_network_views_names_enum.dart';
import 'package:google_play/features/tabs/data/models/tabs_dto.dart';

class SupabaseTabsRemoteDatasource implements ITabRemoteDataSource {
  final SupabaseTabRemoteDatasource _datasource;

  const SupabaseTabsRemoteDatasource({
    required SupabaseTabRemoteDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<Result<List<TabsDto>>> getTabs({
    required int page,
    int pageSize = 20,
  }) {
    final view = TabNetworkViewsNames.tabs;
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
