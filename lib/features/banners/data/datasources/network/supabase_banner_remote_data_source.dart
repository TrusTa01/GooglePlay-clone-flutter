import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/result_pattern/failure.dart';
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

  static const ({String column, bool ascending}) _releaseDateDesc = (
    column: 'release_date',
    ascending: false,
  );

  @override
  Future<Result<List<BannerDto>>> getBanners({
    required String type,
    required int page,
    int pageSize = 20,
  }) {
    final view = NetworkBannerViewsNames.getViewName(type);
    final schemaName = SchemaNamesEnum.views;

    if (view == null) {
      return Result.asFuture(
        Result.failure(failure: UnsupportedFailure(type: type)),
      );
    }

    return _datasource.getBanners(
      view: view,
      schemaName: schemaName,
      order: _releaseDateDesc,
      page: page,
      pageSize: pageSize,
    );
  }

  @override
  Future<Result<BannerDto?>> getBannerById({required String id, String? type}) {
    if (type == null) {
      return Result.asFuture(const Result.success(data: null));
    }

    final view = NetworkBannerViewsNames.getViewName(type);
    final schemaName = SchemaNamesEnum.views;

    if (view == null) {
      return Result.asFuture(
        Result.failure(failure: UnsupportedFailure(type: type)),
      );
    }

    return _datasource.getBannerById(
      view: view,
      id: id,
      schemaName: schemaName,
    );
  }
}
