import 'package:google_play/data/datasources/local/product_local_datasource.dart';
import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/domain/entities/products/product_entity.dart';
import 'package:google_play/domain/repositories/product_repository.dart';
import 'package:google_play/data/mappers/mappers.dart';

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
    final dto = await _dataSource.getDtoById(id);
    // TODO: Реализовать проверку инициализации кэша
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
    final allDtos = _dataSource.getAllCachedDtos();

    // TODO: Логика поиска похожих
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
}
