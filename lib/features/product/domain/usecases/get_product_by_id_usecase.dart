import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/domain/repositories/product_repository.dart';

/// Use case для получения продукта по [id]
abstract interface class GetProductByIdUseCase {
  Future<ProductEntity?> call(String id);
}

final class GetProductByIdUseCaseImpl implements GetProductByIdUseCase {
  final IProductRepository _productRepository;

  const GetProductByIdUseCaseImpl(this._productRepository);

  @override
  Future<ProductEntity?> call(String id) {
    return _productRepository.getProductById(id);
  }
}

