import 'package:google_play/features/product/data/datasources/product_local_datasource.dart';
import 'package:google_play/features/product/data/models/product_dto.dart';
import 'package:google_play/features/product/data/mappers/app_mapper.dart';
import 'package:google_play/features/product/data/mappers/book_mapper.dart';
import 'package:google_play/features/product/data/mappers/game_mapper.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/domain/entities/product_filter.dart';
import 'package:google_play/features/product/domain/repositories/product_repository.dart';

class JsonProductRepository implements IProductRepository {
  final ProductLocalDatasource _dataSource;

  const JsonProductRepository(this._dataSource);

  @override
  Future<List<ProductEntity>> getProducts({required String type}) async {
    // Определяем файл по типу
    final fileName = switch (type) {
      'game' => 'games.json',
      'app' => 'apps.json',
      _ => 'books.json',
    };

    // Получаем список DTO из датасорса
    final dtos = await _dataSource.loadProducts(fileName: fileName);

    return dtos.map<ProductEntity>((dto) {
      if (dto is GameDto) return dto.toEntity();
      if (dto is AppDto) return dto.toEntity();
      if (dto is BookDto) return dto.toEntity();
      throw Exception('Mapping error');
    }).toList();
  }

  @override
  Future<ProductEntity?> getProductById(String id) async {
    final dto = _dataSource.getProductById(id);
    // TODO: [cache] Реализовать проверку инициализации кэша
    // Если кэш пуст, вызвать загрузку соответствующих файлов перед поиском
    if (dto == null) return null;

    // Мапим в зависимости от того, что пришло
    if (dto is GameDto) return dto.toEntity();
    if (dto is AppDto) return dto.toEntity();
    if (dto is BookDto) return dto.toEntity();
    return null;
  }

  @override
  Future<List<ProductEntity>> getSimilarProducts(ProductEntity product) async {
    // Получаем все загруженные продукты из DataSource
    final allDtos = _dataSource.getAllCachedDtos<ProductDto>();

    // TODO: [db] Логика поиска похожих
    final similarDtos = allDtos
        .where((dto) {
          // Не возвращаем тот же самый продукт
          if (dto.id == product.id) return false;

          // Сравниваем тип (игры к играм, книги к книгам)
          return dto.type == product.type;
        })
        .take(10)
        .toList(); // Берем первые 10 для примера

    // Мапим результат в Entity
    return similarDtos.map((dto) {
      if (dto is GameDto) return dto.toEntity();
      if (dto is AppDto) return dto.toEntity();
      if (dto is BookDto) return dto.toEntity();
      throw Exception('Unknown DTO type');
    }).toList();
  }

  @override
  Future<List<ProductEntity>> getProductsByFilters({
    required List<ProductFilter> filters,
    required String categoryType,
  }) async {
    final allProducts = await getProducts(type: categoryType);

    return allProducts.where((product) {
      return filters.every((filter) {
        return switch (filter) {
          CategoryFilter(genre: var c) => product.categories.any(
            (category) => category.toLowerCase() == c.toLowerCase(),
          ),
          CollectionFilter(collectionName: var name) => _collectionFilter(
            product,
            name,
          ),
          TagFilter(tag: var t) => product.tags.any(
            (tag) => tag.toLowerCase() == t.toLowerCase(),
          ),
          IsPaidFilter(isPaid: var p) => product.isPaid == p,
          RecommendedFilter() =>
            product.rating >= 4.7 && product.reviewsCount >= 5000000,
          UnknownFilter() => true,
        };
      });
    }).toList();
  }

  bool _collectionFilter(ProductEntity product, String collectionName) =>
      switch (collectionName) {
        'top_rated' => product.rating >= 4.6,
        'new_releases' || 'new_release' => _isNewRelease(product),
        'popular' => product.rating >= 4.5 && product.reviewsCount >= 200000,
        'low_price' =>
          product.isPaid &&
              product.price != null &&
              product.price! > 0 &&
              product.price! < 4.0,
        'bestseller' => product.rating >= 4.5,
        _ => true,
      };

  bool _isNewRelease(ProductEntity product) {
    const threshold = Duration(days: 90);
    return DateTime.now().difference(product.releaseDate) <= threshold;
  }
}
