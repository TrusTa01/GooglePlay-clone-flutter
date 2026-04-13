import 'package:google_play/core/data/local/sync_keys.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_policy.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/product/data/data_sources/local/i_products_local_datasource.dart';
import 'package:google_play/features/product/data/mappers/local/local_product_bundle_mapper.dart';
import 'package:google_play/features/product/data/models/network/product_dto.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/core/domain/entities/filters.dart';
import 'package:google_play/features/product/data/data_sources/network/i_products_remote_data_source.dart';
import 'package:google_play/features/product/domain/entities/software_entity.dart';
import 'package:google_play/features/product/domain/repositories/i_products_repository.dart';

class CacheFirstProductRepository implements IProductsRepository {
  final IProductsRemoteDataSource _remoteDataSource;
  final IProductsLocalDataSource _local;
  final FreshnessPolicy _freshnessPolicy;

  const CacheFirstProductRepository({
    required IProductsRemoteDataSource remoteDataSource,
    required IProductsLocalDataSource local,
    required FreshnessPolicy freshnessPolicy,
  }) : _remoteDataSource = remoteDataSource,
       _local = local,
       _freshnessPolicy = freshnessPolicy;

  @override
  Future<List<ProductEntity>> getProducts({
    required String type,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  }) async {
    if (forceRefresh ||
        await _needsSync(
          syncKey: SyncKeys.productListPage(
            type: type,
            page: page,
            pageSize: pageSize,
          ),
        )) {
      await _refreshProducts(type: type, page: page, pageSize: pageSize);
    }

    final bundles = await _local.getProducts(
      type: type,
      page: page,
      pageSize: pageSize,
    );
    return bundles.map((bundle) => bundle.toEntity(locale)).nonNulls.toList();
  }

  @override
  Stream<List<ProductEntity>> watchProducts({
    required String type,
    required String locale,
    int page = 1,
    int pageSize = 20,
  }) {
    return _local
        .watchProducts(type: type, page: page, pageSize: pageSize)
        .map(
          (bundles) => bundles
              .map((bundle) => bundle.toEntity(locale))
              .nonNulls
              .toList(growable: false),
        );
  }

  @override
  Future<List<ProductEntity>> getProductsByFilters({
    required List<Filter> filters,
    required String categoryType,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  }) async {
    final products = await getProducts(
      type: categoryType,
      locale: locale,
      page: page,
      pageSize: pageSize,
      forceRefresh: forceRefresh,
    );

    if (filters.isEmpty) return products;
    return products
        .where((product) => filters.every((f) => _matchesFilter(product, f)))
        .toList(growable: false);
  }

  @override
  Stream<List<ProductEntity>> watchProductsByFilters({
    required List<Filter> filters,
    required String categoryType,
    required String locale,
    int page = 1,
    int pageSize = 20,
  }) {
    return watchProducts(
      type: categoryType,
      locale: locale,
      page: page,
      pageSize: pageSize,
    ).map((products) {
      if (filters.isEmpty) return products;
      return products
          .where((product) => filters.every((f) => _matchesFilter(product, f)))
          .toList(growable: false);
    });
  }

  @override
  Future<ProductEntity?> getProductById(
    String id, {
    required String type,
    required String locale,
    bool forceRefresh = false,
  }) async {
    final syncKey = SyncKeys.productItem(id);

    if (forceRefresh || await _needsSync(syncKey: syncKey)) {
      await _refreshProductById(id, type);
    }

    final fromLocal = await _local.getProductById(id);
    return fromLocal?.toEntity(locale);
  }

  Future<void> _refreshProducts({
    required String type,
    required int page,
    required int pageSize,
  }) async {
    final result = await _remoteDataSource.getProducts(
      type: type,
      page: page,
      pageSize: pageSize,
    );
    final syncKey = SyncKeys.productListPage(
      type: type,
      page: page,
      pageSize: pageSize,
    );

    switch (result) {
      case SuccessResult<List<ProductDto>>(data: final dtos):
        await _local.upsertProducts(dtos);
        await _local.setLastSync(syncKey, DateTime.now());
      case FailureResult():
        await _local.recordSyncFailure(syncKey);
    }
  }

  Future<void> _refreshProductById(String id, String type) async {
    final syncKey = SyncKeys.productItem(id);
    final result = await _remoteDataSource.getProductById(id: id, type: type);
    switch (result) {
      case SuccessResult<ProductDto?>(data: final dto):
        if (dto != null) {
          await _local.upsertProducts([dto]);
          await _local.setLastSync(syncKey, DateTime.now());
        }
      case FailureResult():
        await _local.recordSyncFailure(syncKey);
    }
  }

  Future<bool> _needsSync({required String syncKey}) async {
    final freshness = await _freshnessForSyncKey(syncKey);
    return freshness.status.shouldFetch;
  }

  Future<DataFreshness> _freshnessForSyncKey(String syncKey) async {
    final t = await _local.getSyncTimestamps(syncKey);
    return DataFreshness.fromPersistedFields(
      policy: _freshnessPolicy,
      lastSuccessAt: t.lastSyncAt,
      lastFailureAt: t.lastFailureAt,
      failureCount: t.failureCount,
    );
  }

  @override
  Future<DataFreshness> getProductsFreshness({required String type}) =>
      _freshnessForSyncKey(
        SyncKeys.productListPage(type: type, page: 1, pageSize: 20),
      );

  @override
  Future<DataFreshness> getProductFreshness(String id) =>
      _freshnessForSyncKey(SyncKeys.productItem(id));

  bool _matchesFilter(ProductEntity product, Filter filter) {
    return switch (filter) {
      RecommendedFilter(:final productIds) => productIds.contains(product.id),
      CategoryFilter(:final genre) => product.categories.contains(genre),
      CollectionFilter() => true, // TODO: [filter] добавить фильтр
      TagFilter(:final tag) => product.tags.contains(tag),
      IsPaidFilter(:final isPaid) => product.isPaid == isPaid,
      AgeLimitFilter(:final age) =>
        product is SoftwareEntity ? (product.ageRating <= age) : true,
      UnknownFilter() => true,
    };
  }
}
