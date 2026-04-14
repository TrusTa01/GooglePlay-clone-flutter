import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/core/domain/entities/filters.dart';

abstract interface class IProductsRepository {
  Future<List<ProductEntity>> getProducts({
    required ProductKind type,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  });

  Stream<List<ProductEntity>> watchProducts({
    required ProductKind type,
    required String locale,
    int page = 1,
    int pageSize = 20,
  });

  Future<ProductEntity?> getProductById(
    String id, {
    required ProductKind type,
    required String locale,
    bool forceRefresh = false,
  });

  Future<List<ProductEntity>> getProductsByFilters({
    required List<Filter> filters,
    required ProductKind type,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  });

  Stream<List<ProductEntity>> watchProductsByFilters({
    required List<Filter> filters,
    required ProductKind type,
    required String locale,
    int page = 1,
    int pageSize = 20,
  });

  Future<List<ProductEntity>> getSimilarProducts({
    required ProductEntity product,
    required ProductKind type,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  });

  Future<DataFreshness> getProductsFreshness({required ProductKind type});

  Future<DataFreshness> getProductFreshness(String id);
}
