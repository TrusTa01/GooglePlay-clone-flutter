import 'package:google_play/domain/entities/products/product_entity.dart';
import 'package:google_play/domain/repositories/product_repository.dart';

/// Use case для загрузки списка продуктов по типу стора ([apps]/[games]/[books])
abstract interface class LoadProductsUseCase {
  Future<List<ProductEntity>> call({required String type});
}

final class LoadProductsUseCaseImpl implements LoadProductsUseCase {
  final IProductRepository _productRepository;

  const LoadProductsUseCaseImpl(this._productRepository);

  @override
  Future<List<ProductEntity>> call({required String type}) {
    return _productRepository.getProducts(type: type);
  }
}

