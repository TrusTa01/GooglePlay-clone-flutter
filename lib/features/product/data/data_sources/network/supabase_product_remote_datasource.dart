import 'package:google_play/core/data/network/sort_orders.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/result_pattern/failure.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
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
    required String type,
    required int page,
    int pageSize = 20,
  }) {
    final view = NetworkProductsViewsNames.getViewName(type);
    final order = SortOrders.releaseDateDesc;

    if (view == null) {
      return Result.asFuture(
        Result.failure(failure: UnsupportedFailure(type: type)),
      );
    }

    return _datasource.getProducts(
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
    required String type,
  }) {
    final view = NetworkProductsViewsNames.getViewName(type);

    return view == null
        ? Result.asFuture(
            Result.failure(failure: UnsupportedFailure(type: type)),
          )
        : _datasource.getProductById(
            view: view,
            schemaName: schemaName,
            id: id,
          );
  }
}
