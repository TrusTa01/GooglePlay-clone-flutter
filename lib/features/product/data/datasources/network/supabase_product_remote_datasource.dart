import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/result_pattern/failure.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/product/data/datasources/network/i_product_remote_data_source.dart';
import 'package:google_play/features/product/data/datasources/network/product_network_views_names_enum.dart';
import 'package:google_play/features/product/data/datasources/network/supabase_product_network_datasource.dart';
import 'package:google_play/features/product/data/models/network/product_dto.dart';

class SupabaseProductRemoteDataSource implements IProductRemoteDataSource {
  final SupabaseProductNetworkDatasource _datasource;

  const SupabaseProductRemoteDataSource({
    required SupabaseProductNetworkDatasource datasource,
  }) : _datasource = datasource;

  static const ({String column, bool ascending}) _releaseDateDesc = (
    column: 'release_date',
    ascending: false,
  );

  @override
  Future<Result<List<ProductDto>>> getProducts({
    required String type,
    required int page,
    int pageSize = 20,
  }) {
    final view = NetworkProductViewsNames.getViewName(type);
    final schemaName = SchemaNamesEnum.views;

    if (view == null) {
      return Result.asFuture(
        Result.failure(failure: UnsupportedFailure(type: type)),
      );
    }

    return _datasource.getProducts(
      view: view,
      schemaName: schemaName,
      order: _releaseDateDesc,
      page: page,
      pageSize: pageSize,
    );
  }

  @override
  Future<Result<ProductDto?>> getProductById({
    required String id,
    String? type,
  }) {
    if (type == null) {
      return Result.asFuture(const Result.success(data: null));
    }

    final view = NetworkProductViewsNames.getViewName(type);
    final schemaName = SchemaNamesEnum.views;

    if (view == null) {
      return Result.asFuture(
        Result.failure(failure: UnsupportedFailure(type: type)),
      );
    }

    return _datasource.getProductById(
      view: view,
      schemaName: schemaName,
      id: id,
    );
  }
}
