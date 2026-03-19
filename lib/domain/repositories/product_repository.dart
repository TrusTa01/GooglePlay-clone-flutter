import 'package:google_play/domain/entities/products/product_entity.dart';
import 'package:google_play/domain/entities/products/product_filter.dart';

// Интерфейс для работы с продуктами
/// Контракт, который слой [Data] обязан будет реализовать
abstract interface class IProductRepository {
  // Получаем список всех продуктов
  // TODO: [base] Пагинация
  Future<List<ProductEntity>> getProducts({required String type});

  /// Получаем конкретный продукт по [ID]
  Future<ProductEntity?> getProductById(String id);

  // Получает похожие продукты
  Future<List<ProductEntity>> getSimilarProducts(ProductEntity product);

  // Получить продукты по фильтрам
  Future<List<ProductEntity>> getProductsByFilters({
    required List<ProductFilter> filters,
    required String categoryType,
  });
}
