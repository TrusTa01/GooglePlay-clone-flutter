import 'package:google_play/core/domain/result_pattern/product_result.dart';
import 'package:google_play/features/product/data/models/network/product_dto.dart';

abstract interface class IProductNetworkRepository {
  Future<ProductResult<List<ProductDto>>> getProducts({
    required String type,
    required int page,
    int pageSize = 20,
  });

  Future<ProductResult<ProductDto?>> getProductById({
    required String id,
    String? type,
  });
}
