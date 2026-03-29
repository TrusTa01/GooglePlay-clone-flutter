import 'package:google_play/core/domain/result_pattern/product_result.dart';
import 'package:google_play/features/product/domain/entities/app_entity.dart';
import 'package:google_play/features/product/domain/entities/book_entity.dart';
import 'package:google_play/features/product/domain/entities/game_entity.dart';

// Интерфейс для работы с продуктами
/// Контракт, который слой [Data] обязан будет реализовать
abstract interface class IProductRepository {
  // Получение списка продуктов
  Future<ProductResult<List<GameEntity>>> getGames({
    required String locale,
    required int page,
    int pageSize = 20,
  });
  Future<ProductResult<List<AppEntity>>> getApps({
    required String locale,
    required int page,
    int pageSize = 20,
  });
  Future<ProductResult<List<BookEntity>>> getBooks({
    required String locale,
    required int page,
    int pageSize = 20,
  });
}
