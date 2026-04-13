import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/product/data/models/network/product_dto.dart';

abstract interface class IProductsRemoteDataSource {
  Future<Result<List<ProductDto>>> getProducts({
    required ProductKind type,
    required int page,
    int pageSize = 20,
  });

  Future<Result<ProductDto?>> getProductById({
    required String id,
    required ProductKind type,
  });
}
