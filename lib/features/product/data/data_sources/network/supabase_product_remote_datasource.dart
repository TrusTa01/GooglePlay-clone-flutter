import 'package:google_play/core/data/network/sort_orders.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/domain/result_pattern/failure.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/features/product/data/data_sources/network/i_products_remote_data_source.dart';
import 'package:google_play/features/product/data/data_sources/network/products_network_views_names_enum.dart';
import 'package:google_play/features/product/data/data_sources/network/supabase_product_network_datasource.dart';
import 'package:google_play/features/product/data/models/network/product_dto.dart';

class SupabaseProductRemoteDataSource implements IProductsRemoteDataSource {
  final SupabaseProductNetworkDataSource _datasource;

  const SupabaseProductRemoteDataSource({
    required SupabaseProductNetworkDataSource datasource,
  }) : _datasource = datasource;

  static final schemaName = SchemaNamesEnum.views;

  @override
  Future<Result<List<ProductDto>>> getProducts({
    required ProductKind type,
    required int page,
    int pageSize = 20,
  }) {
    FeatureTalker.data(
      'product.remote',
      'resolve view and request products',
      context: {'type': type.name, 'page': page, 'pageSize': pageSize},
    );
    final view = NetworkProductsViewsNames.getViewName(type.name);
    final order = SortOrders.releaseDateDesc;

    return view == null
        ? Result.asFuture(
            Result.failure(failure: UnsupportedFailure(type: type.name)),
          )
        : _datasource.getProducts(
            view: view,
            schemaName: schemaName,
            order: order,
            page: page,
            pageSize: pageSize,
          );
  }

  @override
  Future<Result<ProductDto?>> getProductById({
    required String id,
    required ProductKind type,
  }) {
    FeatureTalker.data(
      'product.remote',
      'resolve view and request product by id',
      context: {'type': type.name, 'id': id},
    );
    final view = NetworkProductsViewsNames.getViewName(type.name);

    return view == null
        ? Result.asFuture(
            Result.failure(failure: UnsupportedFailure(type: type.name)),
          )
        : _datasource.getProductById(
            view: view,
            schemaName: schemaName,
            id: id,
          );
  }

  @override
  Future<Result<List<String>>> getRecommendedProducts({
    required ProductKind type,
    int limit = 20,
    int excludeRecentDays = 30,
    String? seed,
  }) {
    FeatureTalker.data(
      'product.remote',
      'request recommended products',
      context: {'type': type.name, 'limit': limit},
    );
    return _datasource.getRecommendedProducts(
      type: type,
      limit: limit,
      excludeRecentDays: excludeRecentDays,
      seed: seed,
    );
  }
}
