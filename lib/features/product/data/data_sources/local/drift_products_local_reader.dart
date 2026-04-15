part of 'drift_products_local_data_source.dart';

final class _ProductLocalReader {
  final AppDatabase _db;

  const _ProductLocalReader(this._db);

  Future<List<LocalProductBundle>> getProducts({
    required ProductKind type,
    required int page,
    required int pageSize,
  }) async {
    final products =
        await (_db.select(_db.cachedProduct)
              ..where((t) => t.type.equals(type.name))
              ..orderBy([(t) => OrderingTerm.desc(t.releaseDate)]))
            .withPagination(page, pageSize)
            .get();

    return _loadBundlesForProducts(products);
  }

  Stream<List<LocalProductBundle>> watchProducts({
    required ProductKind type,
    required int page,
    required int pageSize,
  }) {
    final query =
        (_db.select(_db.cachedProduct)
              ..where((t) => t.type.equals(type.name))
              ..orderBy([(t) => OrderingTerm.desc(t.releaseDate)]))
            .withPagination(page, pageSize)
            .watch();

    return query.asyncMap(_loadBundlesForProducts);
  }

  Future<List<LocalProductBundle>> getAllProducts(ProductKind type) async {
    final products =
        await (_db.select(_db.cachedProduct)
              ..where((t) => t.type.equals(type.name))
              ..orderBy([(t) => OrderingTerm.desc(t.releaseDate)]))
            .get();

    return _loadBundlesForProducts(products);
  }

  Stream<List<LocalProductBundle>> watchAllProducts(ProductKind type) {
    final query =
        (_db.select(_db.cachedProduct)
              ..where((t) => t.type.equals(type.name))
              ..orderBy([(t) => OrderingTerm.desc(t.releaseDate)]))
            .watch();

    return query.asyncMap(_loadBundlesForProducts);
  }

  Future<LocalProductBundle?> getProductById(String id) async {
    final base = await (_db.select(
      _db.cachedProduct,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    if (base == null) return null;
    return _buildBundle(base);
  }

  Future<List<LocalProductBundle>> _loadBundlesForProducts(
    List<CachedProductData> products,
  ) {
    if (products.isEmpty) return Future.value(const <LocalProductBundle>[]);
    return Future.wait(products.map(_buildBundle));
  }

  Future<LocalProductBundle> _buildBundle(CachedProductData product) async {
    final productId = product.id;

    final software = await (_db.select(
      _db.cachedSoftwareProduct,
    )..where((t) => t.productId.equals(productId))).getSingleOrNull();

    final game = product.type == 'game'
        ? await (_db.select(
            _db.cachedGames,
          )..where((t) => t.productId.equals(productId))).getSingleOrNull()
        : null;

    final app = product.type == 'app'
        ? await (_db.select(
            _db.cachedApps,
          )..where((t) => t.productId.equals(productId))).getSingleOrNull()
        : null;

    final book = product.type == 'book'
        ? await (_db.select(
            _db.cachedBooks,
          )..where((t) => t.productId.equals(productId))).getSingleOrNull()
        : null;

    final developer = software == null
        ? null
        : await (_db.select(
            _db.developers,
          )..where((t) => t.id.equals(software.developerId))).getSingleOrNull();

    final publisher = book == null
        ? null
        : await (_db.select(
            _db.publishers,
          )..where((t) => t.id.equals(book.publisherId))).getSingleOrNull();

    final translations = await (_db.select(
      _db.productTranslations,
    )..where((t) => t.productId.equals(productId))).get();

    final categoryLinks = await (_db.select(
      _db.productCategories,
    )..where((t) => t.productId.equals(productId))).get();
    final categories = await _loadCategoriesByIds(
      categoryLinks.map((e) => e.categoryId).toSet(),
    );

    final tagLinks = await (_db.select(
      _db.productTags,
    )..where((t) => t.productId.equals(productId))).get();
    final tags = await _loadTagsByIds(tagLinks.map((e) => e.tagId).toSet());

    return LocalProductBundle(
      product: product,
      software: software,
      game: game,
      app: app,
      book: book,
      developer: developer,
      publisher: publisher,
      translations: translations,
      categories: categories,
      tags: tags,
    );
  }

  Future<List<Category>> _loadCategoriesByIds(Set<String> ids) async {
    if (ids.isEmpty) return const <Category>[];
    return (_db.select(_db.categories)..where((t) => t.id.isIn(ids))).get();
  }

  Future<List<Tag>> _loadTagsByIds(Set<String> ids) async {
    if (ids.isEmpty) return const <Tag>[];
    return (_db.select(_db.tags)..where((t) => t.id.isIn(ids))).get();
  }
}
