import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/data/network/sort_orders.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/sections/data/data_sources/network/sections_network_views_names_enum.dart';
import 'package:google_play/features/sections/data/data_sources/network/supabase_sections_network_data_source.dart';
import 'package:google_play/features/sections/data/data_sources/network/supabase_sections_remote_data_source.dart';
import 'package:google_play/features/sections/data/models/network/tab_sections_dto.dart';
import 'package:mocktail/mocktail.dart';

class MockSectionsNetworkDataSource extends Mock
    implements SupabaseSectionsNetworkDataSource {}

void main() {
  late MockSectionsNetworkDataSource networkDataSource;
  late SupabaseSectionsRemoteDataSource remoteDataSource;

  setUp(() {
    networkDataSource = MockSectionsNetworkDataSource();
    remoteDataSource = SupabaseSectionsRemoteDataSource(
      datasource: networkDataSource,
    );
  });

  test('delegates getSections with fixed view/schema/order', () async {
    when(
      () => networkDataSource.getSections(
        view: NetworkSectionsViewsNames.sections.name,
        schemaName: SchemaNamesEnum.views,
        order: SortOrders.sortOrderAsc,
        page: 2,
        pageSize: 9,
      ),
    ).thenAnswer((_) async => const Result.success(data: <SectionsDto>[]));

    final result = await remoteDataSource.getSections(page: 2, pageSize: 9);

    expect(result, isA<SuccessResult<List<SectionsDto>>>());
    verify(
      () => networkDataSource.getSections(
        view: NetworkSectionsViewsNames.sections.name,
        schemaName: SchemaNamesEnum.views,
        order: SortOrders.sortOrderAsc,
        page: 2,
        pageSize: 9,
      ),
    ).called(1);
  });
}
