import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/data/network/sort_orders.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/banners/data/data_sources/network/banners_network_views_names_enum.dart';
import 'package:google_play/features/banners/data/data_sources/network/supabase_banners_network_datasource.dart';
import 'package:google_play/features/banners/data/data_sources/network/supabase_banners_remote_data_source.dart';
import 'package:google_play/features/banners/data/models/network/banner_dto.dart';
import 'package:google_play/features/banners/domain/entities/banner_kind.dart';
import 'package:mocktail/mocktail.dart';

class MockBannerNetworkDataSource extends Mock
    implements SupabaseBannerNetworkDataSource {}

void main() {
  late MockBannerNetworkDataSource networkDataSource;
  late SupabaseBannerRemoteDataSource remoteDataSource;

  setUp(() {
    networkDataSource = MockBannerNetworkDataSource();
    remoteDataSource = SupabaseBannerRemoteDataSource(
      datasource: networkDataSource,
    );
  });

  test('getBanners delegates with fixed view/schema/order', () async {
    const expected = <BannerDto>[];
    when(
      () => networkDataSource.getBanners(
        view: NetworkBannersViewsNames.banners,
        schemaName: SchemaNamesEnum.views,
        order: SortOrders.createdAtDesc,
        page: 2,
        pageSize: 7,
      ),
    ).thenAnswer((_) async => const Result.success(data: expected));

    final result = await remoteDataSource.getBanners(
      type: BannerKind.event,
      page: 2,
      pageSize: 7,
    );

    expect(result, isA<SuccessResult<List<BannerDto>>>());
    verify(
      () => networkDataSource.getBanners(
        view: NetworkBannersViewsNames.banners,
        schemaName: SchemaNamesEnum.views,
        order: SortOrders.createdAtDesc,
        page: 2,
        pageSize: 7,
      ),
    ).called(1);
  });

  test('getBannerById delegates to network datasource', () async {
    when(
      () => networkDataSource.getBannerById(
        id: 'banner-10',
        view: NetworkBannersViewsNames.banners,
        schemaName: SchemaNamesEnum.views,
      ),
    ).thenAnswer((_) async => const Result.success(data: null));

    final result = await remoteDataSource.getBannerById(id: 'banner-10');

    expect(result, isA<SuccessResult<BannerDto?>>());
    verify(
      () => networkDataSource.getBannerById(
        id: 'banner-10',
        view: NetworkBannersViewsNames.banners,
        schemaName: SchemaNamesEnum.views,
      ),
    ).called(1);
  });
}
