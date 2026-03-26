import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/domain/entities/product_filter.dart';

// Интерфейс для работы с продуктами
/// Контракт, который слой [Data] обязан будет реализовать
abstract interface class IProductRepository {
  // Получаем список всех продуктов
  Future<List<ProductEntity>> getProducts({
    required String type,
    required String locale,
  });

  /// Получаем конкретный продукт по [ID]
  Future<ProductEntity?> getProductById(String id, {required String locale});

  // Получает похожие продукты
  Future<List<ProductEntity>> getSimilarProducts(
    ProductEntity product,
    String locale,
  );

  // Получить продукты по фильтрам
  Future<List<ProductEntity>> getProductsByFilters({
    required List<ProductFilter> filters,
    required String categoryType,
    required String locale,
  });
}
