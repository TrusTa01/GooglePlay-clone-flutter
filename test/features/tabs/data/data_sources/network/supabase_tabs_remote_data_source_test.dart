import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/data/network/sort_orders.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/tabs/data/data_sources/network/supabase_tabs_network_data_source.dart';
import 'package:google_play/features/tabs/data/data_sources/network/supabase_tabs_remote_data_source.dart';
import 'package:google_play/features/tabs/data/data_sources/network/tabs_network_views_names_enum.dart';
import 'package:google_play/features/tabs/data/models/network/tabs_dto.dart';
import 'package:mocktail/mocktail.dart';

class MockTabsNetworkDataSource extends Mock
    implements SupabaseTabsNetworkDataSource {}

void main() {
  late MockTabsNetworkDataSource networkDataSource;
  late SupabaseTabsRemoteDataSource remoteDataSource;

  setUp(() {
    networkDataSource = MockTabsNetworkDataSource();
    remoteDataSource = SupabaseTabsRemoteDataSource(
      datasource: networkDataSource,
    );
  });

  test('delegates getTabs with fixed view/schema/order', () async {
    when(
      () => networkDataSource.getTabs(
        view: TabsNetworkViewsNames.tabs.name,
        schemaName: SchemaNamesEnum.views,
        order: SortOrders.sortOrderAsc,
        page: 3,
        pageSize: 11,
      ),
    ).thenAnswer((_) async => const Result.success(data: <TabsDto>[]));

    final result = await remoteDataSource.getTabs(page: 3, pageSize: 11);

    expect(result, isA<SuccessResult<List<TabsDto>>>());
    verify(
      () => networkDataSource.getTabs(
        view: TabsNetworkViewsNames.tabs.name,
        schemaName: SchemaNamesEnum.views,
        order: SortOrders.sortOrderAsc,
        page: 3,
        pageSize: 11,
      ),
    ).called(1);
  });
}
