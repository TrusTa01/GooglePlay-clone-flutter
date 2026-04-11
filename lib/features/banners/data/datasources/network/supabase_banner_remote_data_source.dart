import 'package:google_play/core/data/network/sort_orders.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/banners/data/datasources/network/banner_network_views_names_enum.dart';
import 'package:google_play/features/banners/data/datasources/network/i_banner_remote_data_source.dart';
import 'package:google_play/features/banners/data/datasources/network/supabase_banner_network_datasource.dart';
import 'package:google_play/features/banners/data/models/network/banner_dto.dart';

class SupabaseBannerRemoteDataSource implements IBannerRemoteDataSource {
  final SupabaseBannerNetworkDatasource _datasource;

  const SupabaseBannerRemoteDataSource({
    required SupabaseBannerNetworkDatasource datasource,
  }) : _datasource = datasource;

  static final view = NetworkBannerViewsNames.banners;
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
  Future<Result<BannerDto?>> getBannerById({required String id, String? type}) {
    if (type == null) {
      return Result.asFuture(const Result.success(data: null));
    }

    return _datasource.getBannerById(
      id: id,
      view: view,
      schemaName: schemaName,
    );
  }
}
