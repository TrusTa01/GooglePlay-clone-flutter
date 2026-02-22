import 'package:google_play/domain/entities/products/product_entity.dart';

// Интерфейс для работы с продуктами
/// Контракт, который слой [Data] обязан будет реализовать
abstract interface class IProductRepository {
  // Получаем список всех продуктов
  // TODO: Пагинация
  Future<List<ProductEntity>> getProducts({required String type});

  /// Получаем конкретный продукт по [ID]
  Future<ProductEntity?> getProductById(String id);

  // Получает похожие продукты
  Future<List<ProductEntity>> getSimilarProducts(ProductEntity product);
}
