import 'package:google_play/core/data/network/base_supabase_data_sourse.dart';
import 'package:google_play/core/data/network/supabase_query_executor.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/features/product/data/data_sources/network/products_network_views_names_enum.dart';
import 'package:google_play/features/product/data/data_sources/network/products_recommendation_rpc.dart';
import 'package:google_play/features/product/data/models/network/product_dto.dart';

class SupabaseProductNetworkDataSource
    extends BaseSupabaseDataSourse<ProductDto> {
  final IQueryExecutor _executor;

  const SupabaseProductNetworkDataSource({required super.executor})
    : _executor = executor;

  @override
  ProductDto fromJson(Map<String, dynamic> json) => ProductDto.fromJson(json);

  Future<Result<List<ProductDto>>> getProducts({
    required NetworkProductsViewsNames view,
    SchemaNamesEnum schemaName = SchemaNamesEnum.views,
    required ({String column, bool ascending}) order,
    required int page,
    int pageSize = 20,
  }) {
    FeatureTalker.data(
      'product.network',
      'fetch products page',
      context: {'view': view.name, 'page': page, 'pageSize': pageSize},
    );
    return getData(
      view: view.name,
      schemaName: schemaName,
      order: order,
      page: page,
      pageSize: pageSize,
    );
  }

  Future<Result<ProductDto?>> getProductById({
    required NetworkProductsViewsNames view,
    required String id,
    SchemaNamesEnum schemaName = SchemaNamesEnum.views,
  }) {
    FeatureTalker.data(
      'product.network',
      'fetch product by id',
      context: {'view': view.name, 'id': id},
    );
    return getDataById(view: view.name, id: id, schemaName: schemaName);
  }

  Future<Result<List<String>>> getRecommendedProducts({
    required ProductKind type,
    int limit = 20,
    int excludeRecentDays = 30,
    String? seed,
  }) async {
    FeatureTalker.data(
      'product.network',
      'fetch recommendations rpc',
      context: {'type': type.name, 'limit': limit},
    );
    final params = <String, dynamic>{
      ProductsRecommendationRpc.productKindParam: type.name,
      ProductsRecommendationRpc.limitParam: limit,
      ProductsRecommendationRpc.excludeRecentDaysParam: excludeRecentDays,
      ProductsRecommendationRpc.seedParam: seed,
    }..removeWhere((_, value) => value == null);

    final result = await _executor.rpcList(
      fn: ProductsRecommendationRpc.functionName,
      params: params,
    );

    return result.when(
      success: (rows) {
        final ids = rows
            .map((row) => row[ProductsRecommendationRpc.productIdField])
            .whereType<Object>()
            .map((id) => id.toString())
            .toList(growable: false);
        FeatureTalker.data(
          'product.network',
          'recommendations loaded',
          context: {'type': type.name, 'ids': ids},
        );
        return Result.success(data: ids);
      },
      failure: (failure) {
        FeatureTalker.data(
          'product.network',
          'recommendations failed',
          context: {'type': type.name, 'failure': failure.runtimeType},
        );
        return Result.failure(failure: failure);
      },
    );
  }
}
