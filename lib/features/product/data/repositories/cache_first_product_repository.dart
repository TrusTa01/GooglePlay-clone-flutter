import 'package:google_play/core/data/local/sync_keys.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_policy.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/features/product/data/data_sources/local/i_products_local_datasource.dart';
import 'package:google_play/features/product/data/mappers/local/local_product_bundle_mapper.dart';
import 'package:google_play/features/product/data/models/network/product_dto.dart';
import 'package:google_play/features/product/domain/entities/book_entity.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/domain/entities/filters/product_filters.dart';
import 'package:google_play/features/product/domain/entities/filters/product_sort.dart';
import 'package:google_play/features/product/data/data_sources/network/i_products_remote_data_source.dart';
import 'package:google_play/features/product/domain/entities/software_entity.dart';
import 'package:google_play/features/product/domain/repositories/i_products_repository.dart';

class CacheFirstProductRepository implements IProductsRepository {
  final IProductsRemoteDataSource _remote;
  final IProductsLocalDataSource _local;
  final FreshnessPolicy _freshnessPolicy;
  final FetchBackoffPolicy _fetchBackoffPolicy;

  const CacheFirstProductRepository({
    required IProductsRemoteDataSource remote,
    required IProductsLocalDataSource local,
    required FreshnessPolicy freshnessPolicy,
    required FetchBackoffPolicy fetchBackoffPolicy,
  }) : _remote = remote,
       _local = local,
       _freshnessPolicy = freshnessPolicy,
       _fetchBackoffPolicy = fetchBackoffPolicy;

  @override
  Future<List<ProductEntity>> getProducts({
    required ProductKind type,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  }) async {
    FeatureTalker.domainStart(
      'product.repository',
      'getProducts',
      context: {'type': type.name, 'page': page, 'forceRefresh': forceRefresh},
    );
    final pageSyncKey = SyncKeys.productListPage(
      type: type,
      page: page,
      pageSize: pageSize,
    );

    final shouldRefresh = await _shouldAttemptRemoteRefresh(
      syncKey: pageSyncKey,
      forceRefresh: forceRefresh,
    );
    if (shouldRefresh) {
      await _refreshProducts(type: type, page: page, pageSize: pageSize);
    }

    final bundles = await _local.getProducts(
      type: type,
      page: page,
      pageSize: pageSize,
    );
    if (bundles.isEmpty && !forceRefresh && !shouldRefresh) {
      await _refreshProducts(type: type, page: page, pageSize: pageSize);
      final refreshedBundles = await _local.getProducts(
        type: type,
        page: page,
        pageSize: pageSize,
      );
      final refreshed = refreshedBundles
          .map((bundle) => bundle.toEntity(locale))
          .nonNulls
          .toList();
      FeatureTalker.domainDone(
        'product.repository',
        'getProducts',
        context: {'type': type.name, 'page': page, 'resultCount': refreshed},
      );
      return refreshed;
    }
    final result = bundles
        .map((bundle) => bundle.toEntity(locale))
        .nonNulls
        .toList();
    FeatureTalker.domainDone(
      'product.repository',
      'getProducts',
      context: {'type': type.name, 'page': page, 'resultCount': result},
    );
    return result;
  }

  Future<bool> _shouldAttemptRemoteRefresh({
    required String syncKey,
    required bool forceRefresh,
  }) async {
    if (forceRefresh) return true;
    final freshness = await _freshnessForSyncKey(syncKey);
    if (!freshness.status.shouldFetch) return false;
    return !_fetchBackoffPolicy.shouldDeferFetch(freshness);
  }

  @override
  Stream<List<ProductEntity>> watchProducts({
    required ProductKind type,
    required String locale,
    int page = 1,
    int pageSize = 20,
  }) => _local
      .watchProducts(type: type, page: page, pageSize: pageSize)
      .map(
        (bundles) => bundles
            .map((bundle) => bundle.toEntity(locale))
            .nonNulls
            .toList(growable: false),
      );

  @override
  Future<List<ProductEntity>> getProductsByFilters({
    required List<ProductFilter> filters,
    ProductSort? sort,
    required ProductKind type,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  }) async {
    FeatureTalker.domainStart(
      'product.repository',
      'getProductsByFilters',
      context: {
        'type': type.name,
        'filters': filters,
        'sort': sort?.runtimeType,
        'page': page,
      },
    );
    final collectionSyncKey = SyncKeys.productsCollection(type);
    final shouldRefresh = await _shouldAttemptRemoteRefresh(
      syncKey: collectionSyncKey,
      forceRefresh: forceRefresh,
    );
    if (shouldRefresh) {
      await _refreshProducts(type: type, page: page, pageSize: pageSize);
    }
    final bundles = await _local.getAllProducts(type: type);
    // Не дублируем сеть после shouldRefresh + _ensureCollectionCoverage.
    if (bundles.isEmpty && !forceRefresh && !shouldRefresh) {
      await _refreshProducts(type: type, page: page, pageSize: pageSize);
    }
    final effectiveBundles = await _local.getAllProducts(type: type);

    final allProducts = effectiveBundles
        .map((b) => b.toEntity(locale))
        .nonNulls
        .toList();

    final filtered = _applyFiltersAndSort(
      allProducts,
      filters: filters,
      sort: sort,
    );

    final result = _paginate(filtered, page: page, pageSize: pageSize);
    FeatureTalker.domainDone(
      'product.repository',
      'getProductsByFilters',
      context: {'type': type.name, 'page': page, 'resultCount': result},
    );
    return result;
  }

  @override
  Stream<List<ProductEntity>> watchProductsByFilters({
    required List<ProductFilter> filters,
    ProductSort? sort,
    required ProductKind type,
    required String locale,
    int page = 1,
    int pageSize = 20,
  }) => _local.watchAllProducts(type: type).map((bundles) {
    final allProducts = bundles
        .map((b) => b.toEntity(locale))
        .nonNulls
        .toList();
    final filtered = _applyFiltersAndSort(
      allProducts,
      filters: filters,
      sort: sort,
    );
    return _paginate(filtered, page: page, pageSize: pageSize);
  });

  @override
  Future<ProductEntity?> getProductById(
    String id, {
    required ProductKind type,
    required String locale,
    bool forceRefresh = false,
  }) async {
    FeatureTalker.domainStart(
      'product.repository',
      'getProductById',
      context: {'id': id, 'type': type.name, 'forceRefresh': forceRefresh},
    );
    final productSyncKey = SyncKeys.productItem(id);

    if (forceRefresh || await _needsSync(syncKey: productSyncKey)) {
      await _refreshProductById(id, type);
    }

    final fromLocal = await _local.getProductById(id);
    final result = fromLocal?.toEntity(locale);
    FeatureTalker.domainDone(
      'product.repository',
      'getProductById',
      context: {'id': id, 'hasResult': result != null},
    );
    return result;
  }

  Future<void> _refreshProducts({
    required ProductKind type,
    required int page,
    required int pageSize,
  }) async {
    FeatureTalker.dataStart(
      'product.repository',
      'refreshProducts',
      context: {'type': type.name, 'page': page, 'pageSize': pageSize},
    );
    final result = await _remote.getProducts(
      type: type,
      page: page,
      pageSize: pageSize,
    );
    final pageSyncKey = SyncKeys.productListPage(
      type: type,
      page: page,
      pageSize: pageSize,
    );
    final collectionSyncKey = SyncKeys.productsCollection(type);

    switch (result) {
      case SuccessResult<List<ProductDto>>(data: final dtos):
        FeatureTalker.dataDone(
          'product.repository',
          'refreshProducts',
          context: {'type': type.name, 'dtos': dtos},
        );
        final now = DateTime.now();
        await _local.upsertProducts(dtos);
        await _local.setLastSync(pageSyncKey, now);
        await _local.setLastSync(collectionSyncKey, now);
      case FailureResult():
        FeatureTalker.data(
          'product.repository',
          'fail refreshProducts',
          context: {'type': type.name},
        );
        await _local.recordSyncFailure(pageSyncKey);
        await _local.recordSyncFailure(collectionSyncKey);
    }
  }

  Future<void> _refreshProductById(String id, ProductKind type) async {
    FeatureTalker.dataStart(
      'product.repository',
      'refreshProductById',
      context: {'id': id, 'type': type.name},
    );
    final productSyncKey = SyncKeys.productItem(id);
    final result = await _remote.getProductById(id: id, type: type);

    switch (result) {
      case SuccessResult<ProductDto?>(data: final dto):
        if (dto != null) {
          FeatureTalker.dataDone(
            'product.repository',
            'refreshProductById',
            context: {'id': id},
          );
          await _local.upsertProducts([dto]);
          await _local.setLastSync(productSyncKey, DateTime.now());
        }
      case FailureResult():
        FeatureTalker.data(
          'product.repository',
          'fail refreshProductById',
          context: {'id': id},
        );
        await _local.recordSyncFailure(productSyncKey);
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
  Future<List<ProductEntity>> getSimilarProducts({
    required ProductEntity product,
    required ProductKind type,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  }) async {
    FeatureTalker.domainStart(
      'product.repository',
      'getSimilarProducts',
      context: {'id': product.id, 'type': type.name, 'page': page},
    );
    final syncKey = SyncKeys.productListPage(
      type: type,
      page: page,
      pageSize: pageSize,
    );

    if (await _shouldAttemptRemoteRefresh(
      syncKey: syncKey,
      forceRefresh: forceRefresh,
    )) {
      await _refreshProducts(type: type, page: page, pageSize: pageSize);
    }

    final candidates = await getProductsByFilters(
      filters: [
        if (product.tags.isNotEmpty) TagFilter(tag: product.tags.first),
        if (product.categories.isNotEmpty)
          CategoryFilter(genre: product.categories.first),
        if (product is SoftwareEntity) AgeLimitFilter(age: product.ageRating),
      ],
      type: type,
      locale: locale,
      page: page,
      pageSize: pageSize,
      forceRefresh: false,
    );

    final matches = _getMatches(product: product, candidates: candidates);
    FeatureTalker.domainDone(
      'product.repository',
      'getSimilarProducts',
      context: {'id': product.id, 'matches': matches},
    );

    return matches;
  }

  List<ProductEntity> _getMatches({
    required ProductEntity product,
    required List<ProductEntity> candidates,
  }) {
    final matches = candidates
        .where((candidate) {
          if (candidate.id == product.id) return false;
          return _isSimilarProductCondition(product, candidate);
        })
        .toList(growable: false);

    return matches;
  }

  bool _isSimilarProductCondition(
    ProductEntity product,
    ProductEntity candidate,
  ) {
    final sameType = candidate.type == product.type;

    final sameTags = _hasAtLeastNCommonValues(
      product.tags,
      candidate.tags,
      minCommon: 2,
    );

    final sameCategories = _hasAtLeastNCommonValues(
      product.categories,
      candidate.categories,
      minCommon: 2,
    );

    final sameGenres = (product is BookEntity && candidate is BookEntity)
        ? _hasAtLeastNCommonValues(
            product.genres,
            candidate.genres,
            minCommon: 2,
          )
        : false;
    return sameType && sameTags && (sameCategories || sameGenres);
  }

  bool _hasAtLeastNCommonValues(
    List<String> left,
    List<String> right, {
    required int minCommon,
  }) {
    final leftSet = left.map((l) => l.toLowerCase()).toSet();
    final rightSet = right.map((r) => r.toLowerCase()).toSet();
    return leftSet.intersection(rightSet).length >= minCommon;
  }

  @override
  Future<DataFreshness> getProductsFreshness({required ProductKind type}) =>
      _freshnessForSyncKey(SyncKeys.productsCollection(type));

  @override
  Future<DataFreshness> getProductFreshness(String id) =>
      _freshnessForSyncKey(SyncKeys.productItem(id));

  bool _matchesFilter(ProductEntity product, ProductFilter filter) {
    return switch (filter) {
      CategoryFilter(:final genre) => product.categories.any(
        (category) => category.toLowerCase() == genre.toLowerCase(),
      ),
      TagFilter(:final tag) => product.tags.any(
        (productTag) => productTag.toLowerCase() == tag.toLowerCase(),
      ),
      IsPaidFilter(:final isPaid) => product.isPaid == isPaid,
      AgeLimitFilter(:final age) =>
        product is SoftwareEntity ? (product.ageRating <= age) : true,
      UnknownFilter() => true,
    };
  }

  List<ProductEntity> _applyFiltersAndSort(
    List<ProductEntity> products, {
    required List<ProductFilter> filters,
    ProductSort? sort,
  }) {
    final filtered = filters.isEmpty
        ? products
        : products
              .where(
                (product) => filters.every((f) => _matchesFilter(product, f)),
              )
              .toList(growable: false);
    if (sort == null) return filtered;
    return sort.sort(filtered);
  }

  List<T> _paginate<T>(
    List<T> items, {
    required int page,
    required int pageSize,
  }) {
    if (page <= 0 || pageSize <= 0 || items.isEmpty) return const [];

    final start = (page - 1) * pageSize;
    if (start >= items.length) return const [];

    final end = (start + pageSize).clamp(0, items.length);
    return items.sublist(start, end);
  }
}
