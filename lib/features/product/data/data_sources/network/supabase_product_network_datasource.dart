import 'package:google_play/core/data/network/base_supabase_data_sourse.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/product/data/data_sources/network/products_network_views_names_enum.dart';
import 'package:google_play/features/product/data/models/network/product_dto.dart';

class SupabaseProductNetworkDataSource
    extends BaseSupabaseDataSourse<ProductDto> {
  const SupabaseProductNetworkDataSource({required super.executor});

  @override
  ProductDto fromJson(Map<String, dynamic> json) => ProductDto.fromJson(json);

  Future<Result<List<ProductDto>>> getProducts({
    required NetworkProductsViewsNames view,
    SchemaNamesEnum schemaName = SchemaNamesEnum.views,
    required ({String column, bool ascending}) order,
    required int page,
    int pageSize = 20,
  }) => getData(
    view: view.name,
    schemaName: schemaName,
    order: order,
    page: page,
    pageSize: pageSize,
  );

  Future<Result<ProductDto?>> getProductById({
    required NetworkProductsViewsNames view,
    required String id,
    SchemaNamesEnum schemaName = SchemaNamesEnum.views,
  }) => getDataById(view: view.name, id: id, schemaName: schemaName);
}
