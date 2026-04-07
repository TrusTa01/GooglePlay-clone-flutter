import 'package:google_play/features/product/data/models/local/local_product_bundle.dart';
import 'package:google_play/features/product/data/models/network/product_dto.dart';

abstract interface class IProductLocalDatasource {
  Future<List<LocalProductBundle>> getProducts({
    required String type,
    required int page,
    required int pageSize,
  });

  Stream<List<LocalProductBundle>> watchProducts({
    required String type,
    required int page,
    required int pageSize,
  });

  Future<LocalProductBundle?> getProductById(String id);

  Future<void> upsertProducts(List<ProductDto> dtos);

  Future<DateTime?> getLastSync(String syncKey);
  Future<void> setLastSync(String syncKey, DateTime at);
}
