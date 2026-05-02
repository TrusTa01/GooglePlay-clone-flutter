import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/data/network/supabase_query_executor.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/result_pattern/failure.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/tabs/data/data_sources/network/supabase_tabs_network_data_source.dart';
import 'package:google_play/features/tabs/data/models/network/tabs_dto.dart';
import 'package:mocktail/mocktail.dart';

class MockQueryExecutor extends Mock implements IQueryExecutor {}

void main() {
  late MockQueryExecutor executor;
  late SupabaseTabsNetworkDataSource datasource;

  setUp(() {
    executor = MockQueryExecutor();
    datasource = SupabaseTabsNetworkDataSource(executor: executor);
  });

  test('getTabs maps raw json rows to TabsDto list', () async {
    when(
      () => executor.getList(
        view: 'tabs_full_view',
        schemaName: SchemaNamesEnum.views,
        order: (column: 'sort_order', ascending: true),
        page: 1,
        pageSize: 100,
      ),
    ).thenAnswer((_) async => Result.success(data: [_tabJson(id: 'tab-1')]));

    final result = await datasource.getTabs(
      view: 'tabs_full_view',
      order: (column: 'sort_order', ascending: true),
      page: 1,
    );

    expect(result, isA<SuccessResult<List<TabsDto>>>());
    result.when(
      success: (data) {
        expect(data, hasLength(1));
        expect(data.first.id, 'tab-1');
        expect(data.first.label['en'], 'Games');
      },
      failure: (_) => fail('Expected success'),
    );
  });

  test('getTabs returns ParsingFailure for malformed json', () async {
    when(
      () => executor.getList(
        view: 'tabs_full_view',
        schemaName: SchemaNamesEnum.views,
        order: (column: 'sort_order', ascending: true),
        page: 1,
        pageSize: 100,
      ),
    ).thenAnswer(
      (_) async => Result.success(
        data: const [
          {'id': 'broken'},
        ],
      ),
    );

    final result = await datasource.getTabs(
      view: 'tabs_full_view',
      order: (column: 'sort_order', ascending: true),
      page: 1,
    );

    expect(result, isA<FailureResult<List<TabsDto>>>());
    result.when(
      success: (_) => fail('Expected failure'),
      failure: (failure) => expect(failure, isA<ParsingFailure>()),
    );
  });
}

Map<String, dynamic> _tabJson({required String id}) => {
  'id': id,
  'content_type': 'games',
  'tab_key': 'games',
  'label': {'en': 'Games', 'ru': 'Игры'},
  'tab_type': 'main',
  'sort_order': 1,
};
