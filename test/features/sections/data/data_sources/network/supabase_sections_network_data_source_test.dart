import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/data/network/supabase_query_executor.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/result_pattern/failure.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/sections/data/data_sources/network/supabase_sections_network_data_source.dart';
import 'package:google_play/features/sections/data/models/network/tab_sections_dto.dart';
import 'package:mocktail/mocktail.dart';

class MockQueryExecutor extends Mock implements IQueryExecutor {}

void main() {
  late MockQueryExecutor executor;
  late SupabaseSectionsNetworkDataSource datasource;

  setUp(() {
    executor = MockQueryExecutor();
    datasource = SupabaseSectionsNetworkDataSource(executor: executor);
  });

  test('getSections maps raw rows to SectionsDto list', () async {
    when(
      () => executor.getList(
        view: 'sections_full_view',
        schemaName: SchemaNamesEnum.views,
        order: (column: 'sort_order', ascending: true),
        page: 1,
        pageSize: 20,
      ),
    ).thenAnswer((_) async => Result.success(data: [_sectionJson(id: 's-1')]));

    final result = await datasource.getSections(
      view: 'sections_full_view',
      order: (column: 'sort_order', ascending: true),
      page: 1,
    );

    expect(result, isA<SuccessResult<List<SectionsDto>>>());
    result.when(
      success: (data) {
        expect(data, hasLength(1));
        expect(data.first.id, 's-1');
        expect(data.first.tabId, 'for_you');
      },
      failure: (_) => fail('Expected success'),
    );
  });

  test('getSections maps rows when optional string fields are null in view', () async {
    when(
      () => executor.getList(
        view: 'sections_full_view',
        schemaName: SchemaNamesEnum.views,
        order: (column: 'sort_order', ascending: true),
        page: 1,
        pageSize: 20,
      ),
    ).thenAnswer(
      (_) async => Result.success(
        data: [
          {
            'id': 's-nulls',
            'tab_id': 'for_you',
            'tab_key': 'for_you',
            'section_title': null,
            'title': null,
            'subtitle': null,
            'data_source': 'products',
            'image_asset_path': null,
            'sort_order': null,
            'content_type': null,
            'data_params_dto': null,
          },
        ],
      ),
    );

    final result = await datasource.getSections(
      view: 'sections_full_view',
      order: (column: 'sort_order', ascending: true),
      page: 1,
    );

    expect(result, isA<SuccessResult<List<SectionsDto>>>());
    result.when(
      success: (data) {
        expect(data, hasLength(1));
        expect(data.first.sectionType, '');
        expect(data.first.imageAssetPath, isNull);
        expect(data.first.sortOrder, 0);
        expect(data.first.contentType, '');
      },
      failure: (_) => fail('Expected success'),
    );
  });

  test('getSections returns ParsingFailure on malformed rows', () async {
    when(
      () => executor.getList(
        view: 'sections_full_view',
        schemaName: SchemaNamesEnum.views,
        order: (column: 'sort_order', ascending: true),
        page: 1,
        pageSize: 20,
      ),
    ).thenAnswer(
      (_) async => Result.success(
        data: const [
          {'id': 'broken'},
        ],
      ),
    );

    final result = await datasource.getSections(
      view: 'sections_full_view',
      order: (column: 'sort_order', ascending: true),
      page: 1,
    );

    expect(result, isA<FailureResult<List<SectionsDto>>>());
    result.when(
      success: (_) => fail('Expected failure'),
      failure: (failure) => expect(failure, isA<ParsingFailure>()),
    );
  });
}

Map<String, dynamic> _sectionJson({required String id}) => {
  'id': id,
  'tab_id': 'for_you',
  'tab_key': 'for_you',
  'section_title': 'grid',
  'title': {'en': 'Section'},
  'subtitle': {'en': 'Subtitle'},
  'data_source': 'products',
  'image_asset_path': 'asset.png',
  'sort_order': 1,
  'content_type': 'apps',
  'data_params_dto': {
    'sort': 'top_rated',
    'extras': {
      'filters': [
        {'type': 'tag', 'value': 'Action'},
      ],
    },
  },
};
