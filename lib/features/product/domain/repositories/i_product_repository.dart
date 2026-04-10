import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/domain/entities/product_filter.dart';

abstract interface class IProductRepository {
  Future<List<ProductEntity>> getProducts({
    required String type,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  });

  Stream<List<ProductEntity>> watchProducts({
    required String type,
    required String locale,
    int page = 1,
    int pageSize = 20,
  });

  Future<ProductEntity?> getProductById(
    String id, {
    required String locale,
    bool forceRefresh = false,
  });

  Future<List<ProductEntity>> getProductsByFilters({
    required List<ProductFilter> filters,
    required String categoryType,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  });

  Stream<List<ProductEntity>> watchProductsByFilters({
    required List<ProductFilter> filters,
    required String categoryType,
    required String locale,
    int page = 1,
    int pageSize = 20,
  });

  Future<DataFreshness> getProductsFreshness({required String type});

  Future<DataFreshness> getProductFreshness(String id);
}
