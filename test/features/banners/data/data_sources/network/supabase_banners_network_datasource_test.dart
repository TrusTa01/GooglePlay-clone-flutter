import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/data/network/supabase_query_executor.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/result_pattern/failure.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/banners/data/data_sources/network/banners_network_views_names_enum.dart';
import 'package:google_play/features/banners/data/data_sources/network/supabase_banners_network_datasource.dart';
import 'package:google_play/features/banners/data/models/network/banner_dto.dart';
import 'package:mocktail/mocktail.dart';

class MockQueryExecutor extends Mock implements IQueryExecutor {}

void main() {
  late MockQueryExecutor executor;
  late SupabaseBannerNetworkDataSource datasource;

  setUp(() {
    executor = MockQueryExecutor();
    datasource = SupabaseBannerNetworkDataSource(executor: executor);
  });

  group('SupabaseBannerNetworkDataSource.getBanners', () {
    test('maps raw rows to BannerDto list', () async {
      when(
        () => executor.getList(
          view: NetworkBannersViewsNames.banners.name,
          schemaName: SchemaNamesEnum.views,
          order: (column: 'created_at', ascending: false),
          page: 1,
          pageSize: 20,
        ),
      ).thenAnswer(
        (_) async => Result.success(data: [_eventJson(id: 'event-1')]),
      );

      final result = await datasource.getBanners(
        view: NetworkBannersViewsNames.banners,
        order: (column: 'created_at', ascending: false),
        page: 1,
      );

      expect(result, isA<SuccessResult<List<BannerDto>>>());
      result.when(
        success: (data) {
          expect(data, hasLength(1));
          expect(data.first.id, 'event-1');
        },
        failure: (_) => fail('Expected success'),
      );
    });

    test('returns ParsingFailure when row is malformed', () async {
      when(
        () => executor.getList(
          view: NetworkBannersViewsNames.banners.name,
          schemaName: SchemaNamesEnum.views,
          order: (column: 'created_at', ascending: false),
          page: 1,
          pageSize: 20,
        ),
      ).thenAnswer(
        (_) async => Result.success(
          data: const [
            {'type': 'event'},
          ],
        ),
      );

      final result = await datasource.getBanners(
        view: NetworkBannersViewsNames.banners,
        order: (column: 'created_at', ascending: false),
        page: 1,
      );

      expect(result, isA<FailureResult<List<BannerDto>>>());
      result.when(
        success: (_) => fail('Expected failure'),
        failure: (failure) => expect(failure, isA<ParsingFailure>()),
      );
    });
  });

  group('SupabaseBannerNetworkDataSource.getBannerById', () {
    test('maps raw row to BannerDto', () async {
      when(
        () => executor.getOneById(
          view: NetworkBannersViewsNames.banners.name,
          id: 'action-1',
          schemaName: SchemaNamesEnum.views,
        ),
      ).thenAnswer(
        (_) async => Result.success(data: _actionJson(id: 'action-1')),
      );

      final result = await datasource.getBannerById(
        view: NetworkBannersViewsNames.banners,
        id: 'action-1',
      );

      expect(result, isA<SuccessResult<BannerDto?>>());
      result.when(
        success: (data) => expect(data?.id, 'action-1'),
        failure: (_) => fail('Expected success'),
      );
    });

    test('returns ServerFailure from executor as is', () async {
      const failure = Failure.server(message: '500');
      when(
        () => executor.getOneById(
          view: NetworkBannersViewsNames.banners.name,
          id: 'broken',
          schemaName: SchemaNamesEnum.views,
        ),
      ).thenAnswer((_) async => const Result.failure(failure: failure));

      final result = await datasource.getBannerById(
        view: NetworkBannersViewsNames.banners,
        id: 'broken',
      );

      expect(result, isA<FailureResult<BannerDto?>>());
      result.when(
        success: (_) => fail('Expected failure'),
        failure: (actual) => expect(actual, isA<ServerFailure>()),
      );
    });
  });
}

Map<String, dynamic> _eventJson({required String id}) => {
  'type': 'event',
  'id': id,
  'image_asset_path': 'https://example.com/$id.png',
  'title': {'en': 'Event'},
  'top_tooltip_text': {'en': 'Tooltip'},
  'description': {'en': 'Description'},
  'event_id': 'evt-1',
  'event_category': 'sale',
  'event_description': {'en': 'Event description'},
  'created_at': '2024-01-01T00:00:00.000Z',
  'updated_at': '2024-01-02T00:00:00.000Z',
};

Map<String, dynamic> _actionJson({required String id}) => {
  'type': 'action',
  'id': id,
  'product_external_id': 'product-1',
  'image_asset_path': 'https://example.com/$id.png',
  'title': {'en': 'Action'},
  'top_tooltip_text': {'en': 'Tooltip'},
  'description': {'en': 'Description'},
  'created_at': '2024-01-01T00:00:00.000Z',
  'updated_at': '2024-01-02T00:00:00.000Z',
};
