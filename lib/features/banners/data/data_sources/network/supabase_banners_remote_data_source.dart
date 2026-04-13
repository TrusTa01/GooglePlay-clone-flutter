import 'package:google_play/core/data/network/sort_orders.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/banners/data/data_sources/network/banners_network_views_names_enum.dart';
import 'package:google_play/features/banners/data/data_sources/network/i_banners_remote_data_source.dart';
import 'package:google_play/features/banners/data/data_sources/network/supabase_banners_network_datasource.dart';
import 'package:google_play/features/banners/data/models/network/banner_dto.dart';

class SupabaseBannerRemoteDataSource implements IBannersRemoteDataSource {
  final SupabaseBannerNetworkDataSource _datasource;

  const SupabaseBannerRemoteDataSource({
    required SupabaseBannerNetworkDataSource datasource,
  }) : _datasource = datasource;

  static final view = NetworkBannersViewsNames.banners;
  static final schemaName = SchemaNamesEnum.views;

  @override
  Future<Result<List<BannerDto>>> getBanners({
    required String type,
    required int page,
    int pageSize = 20,
  }) {
    final order = SortOrders.releaseDateDesc;

    return _datasource.getBanners(
      view: view,
      schemaName: schemaName,
      order: order,
      page: page,
      pageSize: pageSize,
    );
  }

  @override
  Future<Result<BannerDto?>> getBannerById({required String id}) =>
      _datasource.getBannerById(id: id, view: view, schemaName: schemaName);
}
